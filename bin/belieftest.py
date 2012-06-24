
# -*- coding: utf_8 -*-

#    Copyright (C) 2012  Olaf Radicke
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.


import sys
import sqlite3
import web
from web import form

import HtmlTemplate
import SQLBackend

class belieftest:
    
    htemp = HtmlTemplate.HtmlTemplate()
    
    # get back a array of anser options
    def getAnswers (self):
        _answers = list()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute( ''' 
            SELECT answers_nr, user_statement 
            FROM answers 
            ORDER BY answers_nr ; ''' )
        for row in cur:
             _answers.append( [ row[0], row[1] ] )
        return _answers
 
        
    # Gibt ein dict zurück mit allen gewichtungsnummer und gewichtungsbeschreibung.   
    def getWeightings ( self ):
        
        weightingsNames = dict()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute( '''
            SELECT weighting_nr, description 
            FROM weightings 
            ORDER BY weighting_nr ASC; ''')
        for row in cur:
             weightingsNames [ unicode(row[0]) ] = unicode(row[1]) 
        return weightingsNames        
        
    # gibt die Antwort einer Konfession auf eine Frage zurück.
    # Ist keine Antwort hinterlegt wird "egal" also "2" zurückgegeben.
    def getAnswersOfDenomination( self, denomination_id, question_id ):
        questionAnswers = dict()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute ( '''
            SELECT denomination_answers.answer_nr
            FROM denomination_answers, questions 
            WHERE denomination_answers.denomination_id = ?
            AND denomination_answers.question_id = ? ;     
        ''', ( denomination_id, question_id ))
        # set default value
        _denomination_answer = "2"
        for row in cur:
            _denomination_answer = unicode(row[0])
        return _denomination_answer
        
    # vergleicht die Antworten des Benutzer mit den der Konfessionen.
    def matchingTable (self):
        _htmlcode = u''
        _max_weighting_points = 0
        max_points = 0
        denomination_points = dict()
        denomination_weighting_points = dict()
        user_answers = dict()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute("SELECT question_id FROM questions;")  
        
        widgetlist = web.input(groups = []) 
        for row in cur:  
            i = row[0]
            user_answers[unicode(i)] =  {'answer'   :  unicode( widgetlist[ u'answer_'   + unicode(i)] ), \
                                     'wichtung' :  unicode( widgetlist[ u'wichtung_' + unicode(i)] ) }
          
        cur.execute( '''SELECT denomination_id 
                        FROM denominations
                        ORDER BY denomination;''') 
        # denomination loop
        for row in cur:  
            _denomination_id = row[0]
            denomination_points [ unicode(_denomination_id) ] = 0
            denomination_weighting_points [ unicode(_denomination_id) ] = 0
            # user answer loop
            for user_answer_key in user_answers.keys() :
                deno_answer = self.getAnswersOfDenomination( _denomination_id, user_answer_key )
                _user_answer = user_answers [ user_answer_key ] [ "answer" ]
                if ( int ( _user_answer )   == int ( deno_answer ) ) \
                  or ( int ( deno_answer)   == 3 ) \
                  or ( int ( _user_answer ) == 3 ) :
                        
                    denomination_points [ unicode(_denomination_id) ] = \
                        int( denomination_points [ unicode(_denomination_id) ]) + 1
                    if int(user_answers [ user_answer_key ] [ "wichtung" ]) == 1 :
                        denomination_weighting_points [ unicode(_denomination_id) ] = \
                            int( denomination_weighting_points [ unicode(_denomination_id) ] ) + 1
        # sort key list
        _sorted_points_keys = list ()
        for key, value in sorted(denomination_points.iteritems(), key=lambda (k,v): (v,k)):
            _sorted_points_keys.append ( key )
        
        for _key in user_answers.keys() :
            if int( user_answers [_key][ "wichtung" ] ) == 1 :
                _max_weighting_points = _max_weighting_points + 1        
                
        _table = HtmlTemplate.Tag ( "table" )
        
        _table_titles =   HtmlTemplate.Tag ( "tr" )
        
        _title_1 =   HtmlTemplate.Tag ( "th" )  
        _title_1.addContent ( u'Konfession' )   
        _table_titles.addContent ( _title_1 )
        
        _title_2 =   HtmlTemplate.Tag ( "th" )  
        _title_2.addContent ( u'Übereinstimmung' )   
        _table_titles.addContent ( _title_2 )
        
        _title_3 =   HtmlTemplate.Tag ( "th" )  
        _title_3.addContent ( u'In wichtigen Fragen' )   
        _table_titles.addContent ( _title_3 )
        
        _table.addContent ( _table_titles )
        
        _odd = 0
        #for denomination_points_key in denomination_points.keys():
        for denomination_points_key in _sorted_points_keys: 
            # Prozent zahlen allgemein
            _all = len ( user_answers.keys() )
            _sum_denomination_points = int ( denomination_points [denomination_points_key] )
            _relativ =  _sum_denomination_points / ( float( _all ) / float ( 100 ) ) 
            
            # Prozentzahl der Gewichtung
            _sum_denomination_weighting_points = float ( denomination_weighting_points [denomination_points_key] )
            if _max_weighting_points == 0 :
                _weighting_relativ = 0
            else :
                _one_procent = float( _max_weighting_points ) / float ( 100 ) 
                _weighting_relativ =  _sum_denomination_weighting_points / _one_procent             
            
            _row  =  HtmlTemplate.Tag ( "tr" )
            if _odd == 1:
                _row.setAttribute ( "class", "oddrow" )
                _odd = 0
            else:
                _odd = 1
                
            _col_1 =  HtmlTemplate.Tag ( "td" )
            _col_1.addContent ( SQLBackend.SQLBackend().getDenominationName( denomination_points_key ) )
            _row.addContent ( _col_1 )
            
            _col_2 = HtmlTemplate.Tag ( "td" )
            _col_2.setAttribute ( "class", "tabpoints" )
            _bar_le = HtmlTemplate.Tag ( "div" )
            _bar_le.setAttribute ( "class", "points" )
            _bar_le.setAttribute ( "style", 'width:' + unicode ( int ( _relativ ) ) + '%;' )
            _bar_le.addContent ( u'&nbsp;' )
            _col_2.addContent ( _bar_le )
            _col_2.addContent ( unicode ( int ( _relativ ) ) + ' %' )
            _row.addContent ( _col_2 )

            _col_3 = HtmlTemplate.Tag ( "td" )
            _col_3.setAttribute ( "class", "tabpoints-weighting" )
            _bar_ri = HtmlTemplate.Tag ( "div" )
            _bar_ri.setAttribute ( "class", "points-weighting" )
            _bar_ri.setAttribute ( "style", 'width:' + unicode ( int ( _weighting_relativ ) ) + '%;' )
            _bar_ri.addContent ( u'&nbsp;' )
            _col_3.addContent ( _bar_ri )
            _col_3.addContent ( unicode ( int ( _weighting_relativ ) ) + ' %' )
            _row.addContent ( _col_3 )
            _table.addContent ( _row)
              
        return _table
        
        
    def GET(self):
        _sqlBackend = SQLBackend.SQLBackend()
        _answer_optionen = self.getAnswers()
        _last_kat = ""
        weightingsDict = self.getWeightings ()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute( '''
            SELECT question_id, kat, question, commentary 
            FROM questions 
            ORDER BY kat; ''')
        
        _appbox = HtmlTemplate.Tag ( "div" )
        _appbox.setAttribute ( "class", "appbox" )
        
        _section_1 = HtmlTemplate.Tag ( "h2" )      
        _section_1.addContent ( u'''Selbsttest''')
        _appbox.addContent ( _section_1 )    
        
        _section_glossar = HtmlTemplate.Tag ( "h3" )      
        _section_glossar.addContent ( u'''Glossar - Erleuterung zu den Aussagen.''')
        _appbox.addContent ( _section_glossar )
        

        _list = HtmlTemplate.Tag ( "ul" )
        for _row in _sqlBackend.getAnswersDescriptions () :
            _item = HtmlTemplate.Tag ( "li" )
            _item.addContent ( u'<b>' + unicode(_row[1]) + ':</b> ')
            _item.addContent ( unicode(_row[2]) )
            _list.addContent ( _item )
            
        _appbox.addContent ( _list )          
        
        _form = HtmlTemplate.Tag ( "form" )
        _form.setAttribute ( "method", "POST" )
        _form.setAttribute ( "name", "belieftest" )
        _form.setAttribute ( "action", "belieftest" )
        
        _table =  HtmlTemplate.Tag ( "table" )
        
        _table_titles =   HtmlTemplate.Tag ( "tr" )
        
        _title_1 =   HtmlTemplate.Tag ( "th" )  
        _title_1.addContent ( u'Nr.' )   
        _table_titles.addContent ( _title_1 )
        
        _title_2 =   HtmlTemplate.Tag ( "th" )  
        _title_2.addContent ( u'Kategorie' )   
        _table_titles.addContent ( _title_2 )
        
        _title_3 =   HtmlTemplate.Tag ( "th" )  
        _title_3.addContent ( u'Überzeugnung' )   
        _table_titles.addContent ( _title_3 )
        
        _title_4 =   HtmlTemplate.Tag ( "th" )  
        _title_4.addContent ( u'Ja/Nein' )   
        _table_titles.addContent ( _title_4 )
        
        _title_5 =   HtmlTemplate.Tag ( "th" )  
        _title_5.addContent ( u'Gewichtung' )   
        _table_titles.addContent ( _title_5 )
        
        _table.addContent ( _table_titles )        
    
    
        _odd = 0
        _line_count = 1
        for row in cur:
            _rowTag  =  HtmlTemplate.Tag ( "tr" )
            
            if _odd == 1:
                _rowTag.setAttribute ( "class", "oddrow" )
                _odd = 0
            else:
                _odd = 1
            # column: number
            _col_1 =  HtmlTemplate.Tag ( "td" )
            _col_1.addContent ( unicode(_line_count) )
            _rowTag.addContent ( _col_1 )            
            _line_count = _line_count + 1
            
            # column: category
            _col_2 =  HtmlTemplate.Tag ( "td" )
            if _last_kat == row[1] :
                pass
            else:
                _col_2.addContent ( row[1] ) 
                _last_kat = row[1]
            _rowTag.addContent ( _col_2 )   
            
            # column: question
            _col_3 =  HtmlTemplate.Tag ( "td" )
            _tooltip = HtmlTemplate.Tag ( "a" )
            _tooltip.setAttribute ( "href", "#hint" )
            _tooltip.setAttribute ( "class", "tooltip" )
            _tooltip.addContent ( unicode( row[2] ) )
            
            _info = HtmlTemplate.Tag ( "span" )
            _info.setAttribute ( "class", "info" )
            _info.addContent ( u'<b>Erläuterung:</b> ')
            _info.addContent ( unicode ( row[3] ) )
            _tooltip.addContent ( _info )
            
            _col_3.addContent ( _tooltip )
            _rowTag.addContent ( _col_3 )   
            
            # column: answer
            _col_4 =  HtmlTemplate.Tag ( "td" )
            
            _select = HtmlTemplate.Tag ( "select" )
            _select.setAttribute ( "name", u'answer_' + unicode ( row[0] ) )
            _select.setAttribute ( "size", "1" )
            
            for _optionenline in _answer_optionen :
                _option = HtmlTemplate.Tag ( "option" )
                _option.setAttribute ( "value", unicode ( _optionenline[0] ) )
                _option.addContent ( _optionenline[1] )
                _select.addContent ( _option )
                
            _col_4.addContent ( _select ) 
            _rowTag.addContent ( _col_4 )            

            # column: wight
            _col_5 =  HtmlTemplate.Tag ( "td" )
            
            _select_wight = HtmlTemplate.Tag ( "select" )
            _select_wight.setAttribute ( "name", u'wichtung_' + unicode ( row[0] ) )
            _select_wight.setAttribute ( "size", "1" )
            
            _option_1 = HtmlTemplate.Tag ( "option" )
            _option_1.setAttribute ( "value","0" )
            _option_1.addContent ( u'normal' )
            _select_wight.addContent ( _option_1 )
            
            _option_2 = HtmlTemplate.Tag ( "option" )
            _option_2.setAttribute ( "value","1" )
            _option_2.addContent ( u'sehr wichtig' )
            _select_wight.addContent ( _option_2 )
            
            _col_5.addContent ( _select_wight ) 
            _rowTag.addContent ( _col_5 )    
            _table.addContent ( _rowTag )
            
        #_appbox.addContent ( _table  )
        _form.addContent ( _table  )
        _p_form = HtmlTemplate.Tag ( "p" )    
        #_p_form.addContent ( _table )   
        _p_form.addContent ( u'<br>' )   
        
        _button = HtmlTemplate.Tag ( "button" )
        _button.addContent ( u'Auswerten' )
        _button.setAttribute ( "id", "okay" )
        _button.setAttribute ( "name", "okay" )
        _p_form.addContent ( _button )
        
        #_p_form.addContent ( form.Button('Auswerten').render() )
        _form.addContent ( _p_form )
        _appbox.addContent ( _form )
            

        _htmlcode = self.htemp.getCompleteSite( "belieftest", _appbox )
        web.header('Content-Type','text/html; charset=utf-8', unique=True)
        return self.htemp.convertGermanChar( _htmlcode )
        
    def POST(self): 

        _appbox = HtmlTemplate.Tag ( "div" )
        _appbox.setAttribute ( "class", "appbox" )
        _table = self.matchingTable()
        _appbox.addContent ( _table )
        _htmlcode = self.htemp.getCompleteSite( "belieftest", _appbox )
        web.header('Content-Type','text/html; charset=utf-8', unique=True)
        return self.htemp.convertGermanChar( _htmlcode )