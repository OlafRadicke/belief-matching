
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
import VisitLog

class sqlgenerator:
    
    htemp = HtmlTemplate.HtmlTemplate()
    
    # get back a array of anser options
    def getAnswers (self):
        _answers = list()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute( ''' 
            SELECT answers_nr, deno_statement 
            FROM answers 
            ORDER BY answers_nr ; ''' )
        for row in cur:
             _answers.append( [ row[0], row[1] ] )
        return _answers

        
    # Gibt ein dict zurück mit gewichtungsnummer und gewichtungsbeschreibung.   
    def getWeightings ( self ):
        
        weightingsNames = dict()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute( '''
            SELECT weighting_nr, description 
            FROM weightings 
            ORDER BY weighting_nr ASC; ''')
        for row in cur:
             weightingsNames [ str(row[0]) ] = str(row[1]) 
        return weightingsNames        
        
    # get bach the highest id from denomination
    def getHighestID( self ):
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute( '''
            SELECT MAX( denomination_id )
            FROM denominations ;''')
        for row in cur:
             maxID = row[0]
        return maxID
        

        
    # vergleicht die Antworten des Benutzer mit den der Konfessionen.
    def getSqlCode (self):
        _htmlcode = u''
        _highestID = self.getHighestID()
        _highestID += 1
        
        _max_weighting_points = 0
        max_points = 0
        denomination_points = dict()
        denomination_weighting_points = dict()
        user_answers = dict()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute("SELECT question_id FROM questions;")  
        
        widgetlist = web.input(groups = []) 
        _denomination = widgetlist['denomination'] 
        _denominationURL = widgetlist['denominationurl'] 
        
        _sqlcode = u'BEGIN; \n\n'
        _sqlcode += u'INSERT INTO denominations ( denomination_id, denomination, url ) \n'
        _sqlcode += u' VALUES ( \n'
        _sqlcode += u'     ' + str( _highestID) + u',  \n'
        _sqlcode += u'     \'' + _denomination + '\', \n'
        _sqlcode += u'     \'' + _denominationURL + '\'); \n\n'
        

        for row in cur:  
            q_no = row[0]    
            _sqlcode += u'INSERT INTO denomination_answers ( \n'
            _sqlcode += u'        question_id, \n'
            _sqlcode += u'        denomination_id, \n'
            _sqlcode += u'        answer_nr, \n'
            _sqlcode += u'        commentary ) \n '
            _sqlcode += u'    VALUES ( \n '
            _sqlcode += u'        ' + str( q_no ) + ', \n'
            _sqlcode += u'        ' + str( _highestID) + ', \n'
            _sqlcode += u'        ' +   widgetlist['answer_' + str(q_no)]  + ', \n'
            _sqlcode += u'        \'' +  widgetlist['comment_'  + str(q_no)]  + '\'); \n \n'

        _sqlcode += u'COMMIT;; \n\n'
        return _sqlcode
        
        
    def GET(self):
        _ip = unicode ( web.ctx['ip'] )
        VisitLog.VisitLog().write ( _ip, 'Neuer Datensatz' )
        
        _sqlBackend = SQLBackend.SQLBackend()
        _answer_optionen = self.getAnswers ()
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
        _section_1.addContent ( u'''SQL-Code-Generator''')
        _appbox.addContent ( _section_1 )        
        
        
        _form = HtmlTemplate.Tag ( "form" )
        _form.setAttribute ( "method", "POST" )
        _form.setAttribute ( "name", "test" )
        _form.setAttribute ( "action", "sqlgenerator" )
        
        _intro = HtmlTemplate.Tag ( "p" )
        
        _intro.addContent ( u'''Hier kannst du auf einfache weise den SQL-Code generieren
           um in die Datenbankt Informationen über Konfessionen hinzuzufügen.
           Den generierten SQL-Code kannst du mir dann per E-Mail an ''')
           
        _mail = HtmlTemplate.Tag ( "a" )
        _mail.setAttribute ( "href", "mailto:briefkasten@olaf-radicke.de" )
        _mail.addContent ( u'briefkasten@olaf-radicke.de' )       
        _intro.addContent ( _mail )
        
        _intro.addContent ( u' schicken.' )
        _form.addContent ( _intro )
        
        _section_glossar = HtmlTemplate.Tag ( "h3" )      
        _section_glossar.addContent ( u'''Glossar - Erleuterung zu den Aussagen.''')
        _form.addContent ( _section_glossar )    
        
        _list = HtmlTemplate.Tag ( "ul" )
        for _row in _sqlBackend.getAnswersDescriptions () :
            _item = HtmlTemplate.Tag ( "li" )
            _item.addContent ( u'<b>' + unicode(_row[3]) + ':</b> ')
            _item.addContent ( unicode(_row[4]) )
            _list.addContent ( _item )
            
        _form.addContent ( _list )          
        
        _section_newdata = HtmlTemplate.Tag ( "h2" )      
        _section_newdata.addContent ( u'''Der neuer Datensatz''')
        _form.addContent ( _section_newdata )        
        
        _p_2 = HtmlTemplate.Tag ( "p" )
        _p_2.addContent ( u'<b>Name der Konfession:</b><br>' )
        _donname = HtmlTemplate.TagSingle ( "input" )
        _donname.setAttribute ( "name", "denomination" )
        _donname.setAttribute ( "type", "text" )
        _donname.setAttribute ( "size", "40" )
        _p_2.addContent ( _donname )   
        _p_2.addContent ( u'<br>' )
        
        _p_2.addContent ( u'<b>URL zu weiterführenden Informationen:</b><br>' )
        _donURL = HtmlTemplate.TagSingle ( "input" )
        _donURL.setAttribute ( "name", "denominationurl" )
        _donURL.setAttribute ( "type", "text" )
        _donURL.setAttribute ( "size", "40" )
        _p_2.addContent ( _donURL )        
        _p_2.addContent ( u'<br><br>' )  
        
        _form.addContent ( _p_2 )
        
        _table =  HtmlTemplate.Tag ( "table" )
        
        _table_titles =   HtmlTemplate.Tag ( "tr" )
        
        _title_1 =   HtmlTemplate.Tag ( "th" )  
        _title_1.addContent ( u'Nr.' )   
        _table_titles.addContent ( _title_1 )
        
        #_title_2 =   HtmlTemplate.Tag ( "th" )  
        #_title_2.addContent ( u'Kategorie' )   
        #_table_titles.addContent ( _title_2 )
        
        _title_3 =   HtmlTemplate.Tag ( "th" )  
        _title_3.addContent ( u'Kommentar zu Aussage' )   
        _table_titles.addContent ( _title_3 )
        
        _title_4 =   HtmlTemplate.Tag ( "th" )  
        _title_4.addContent ( u'Ja/Nein' )   
        _table_titles.addContent ( _title_4 )
        
        _table.addContent ( _table_titles )        
    
    
        _odd = 0
        _line_count = 1
        for row in cur:
            if _last_kat != row[1] :
                _table.addContent (  u'''<tr><td class="category" colspan="3">
                    ''' + unicode ( row[1] ) + u'''</td></tr>''' )
                _last_kat = unicode ( row[1] )           
            
            _rowTag  =  HtmlTemplate.Tag ( "tr" )
            
            if _odd == 1:
                _rowTag.setAttribute ( "class", "oddrow" )
                _odd = 0
            else:
                _odd = 1
            # column: number
            _col_1 =  HtmlTemplate.Tag ( "td" )
            _col_1.addContent ( str(_line_count) )
            _rowTag.addContent ( _col_1 )            
            _line_count = _line_count + 1
            
            # column: category
            #_col_2 =  HtmlTemplate.Tag ( "td" )
            #if _last_kat == row[1] :
                #pass
            #else:
                #_col_2.addContent ( row[1] ) 
                #_last_kat = row[1]
            #_rowTag.addContent ( _col_2 )   
            
            # column: question & comment
            _col_3 =  HtmlTemplate.Tag ( "td" )
            _tooltip = HtmlTemplate.Tag ( "a" )
            _tooltip.setAttribute ( "href", "#hint" )
            _tooltip.setAttribute ( "class", "tooltip" )
            _tooltip.addContent ( u'<b>Aussge:</b> ' + unicode( row[2] ) )
            
            _info = HtmlTemplate.Tag ( "span" )
            _info.setAttribute ( "class", "info" )
            _info.addContent ( u'<b>Erläuterung:</b> ')
            _info.addContent ( unicode ( row[3] ) )
            _tooltip.addContent ( _info )
            _col_3.addContent ( _tooltip )
            _col_3.addContent ( "<br>" )
            
            # column: comment
            
            _comment = HtmlTemplate.Tag ( "textarea" )
            _comment.setAttribute ( "name", "comment_" + str ( row[0] )  )
            _comment.setAttribute ( "cols", "60" )
            _comment.setAttribute ( "rows", "2" )
            _comment.addContent ( u'(Noch) Kein Kommentar' )
            _col_3.addContent ( _comment )

            _rowTag.addContent ( _col_3 )   
            
            # column: answer
            _col_4 =  HtmlTemplate.Tag ( "td" )
            
            _select = HtmlTemplate.Tag ( "select" )
            _select.setAttribute ( "name", u'answer_' + unicode ( row[0] ) )
            _select.setAttribute ( "size", "1" )
            
            for _optionenline in _sqlBackend.getAnswersDescriptions () :
                _option = HtmlTemplate.Tag ( "option" )
                _option.setAttribute ( "value", unicode ( _optionenline[0] ) )
                _option.addContent ( _optionenline[3] )
                _select.addContent ( _option )
                
            _col_4.addContent ( _select ) 
            _rowTag.addContent ( _col_4 )            
 
            _table.addContent ( _rowTag )
            
        _form.addContent (  _table )
        
        _p_button = HtmlTemplate.Tag ( "p" )
        _p_button.addContent ( u'<br>' )
               
        _button = HtmlTemplate.Tag ( "button" )
        _button.addContent ( u'SQL-Code Generieren' )
        _button.setAttribute ( "id", "generieren" )
        _button.setAttribute ( "name", "generieren" )
        _p_button.addContent ( _button )
        _form.addContent ( _p_button )
        _appbox.addContent ( _form )
            

        _htmlcode = self.htemp.getCompleteSite( "sqlgenerator", _appbox )
        web.header('Content-Type','text/html; charset=utf-8', unique=True)
        return self.htemp.convertGermanChar( _htmlcode )
        
    def POST(self): 
        _ip = unicode ( web.ctx['ip'] )
        VisitLog.VisitLog().write ( _ip, 'SQL-Code des Neuer Datensatzes' )

        _appbox = HtmlTemplate.Tag ( "div" )
        _appbox.setAttribute ( "class", "appbox" )
        
        _h2 = HtmlTemplate.Tag ( "h2" )
        _h2.addContent ( "SQL-Code" )
        _appbox.addContent ( _h2 )
        
        _p_1 = HtmlTemplate.Tag ( "p" )
        _p_1.addContent ( u'''Diesen SQL-Code kannst du an 
            <a href="mailto:briefkasten@olaf-radicke.de">
            briefkasten@olaf-radicke.de</a> senden. Möglichst noch mit einem 
            Kommentar wo die Änderungen sind und warum du die Änderungen wünschst.
            Oder du Machst ein so genanntes <i>Ticket</i> auf unter: 
            <a href="http://sourceforge.net/p/belief-matching/tickets/">
            http://sourceforge.net/p/belief-matching/tickets/</a>
            <br>
            <b>Vielen Dank!</b>''' )
        _appbox.addContent ( _p_1 )
        
        _editor = HtmlTemplate.Tag ( "textarea" )
        _editor.setAttribute ( "class", "result"  )
        _editor.setAttribute ( "cols", "80" )
        _editor.setAttribute ( "rows", "40" )
        _editor.addContent ( self.getSqlCode() )
        _appbox.addContent ( _editor )
        _appbox.addContent ( _p_1 )
        
        _htmlcode = self.htemp.getCompleteSite( "sqlgenerator", _appbox )
        web.header('Content-Type','text/html; charset=utf-8', unique=True)
        return self.htemp.convertGermanChar( _htmlcode )