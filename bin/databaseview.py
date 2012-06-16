
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

class databaseview:    

    htemp = HtmlTemplate.HtmlTemplate()  
    
    def getNoAnswersCount ( self, _id ):
        print "_id: " + _id
        _answers = list()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute( ''' 
            SELECT count ( question_id )
            FROM questions 
            WHERE question_id NOT IN (
                SELECT question_id
                FROM denomination_answers
                WHERE denomination_id = ? )
            ORDER BY question_id ; ''', ( _id ) )
        for _row_array in cur:
            return _row_array[0]
        return 0      
    
    def getUrlOfDenomination ( self, _id ):
        
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()  
        cur.execute ( u'''
            SELECT url
            FROM denominations 
            WHERE denomination_id = ? ;        
        ''', str( _id ) )       
        for row in cur:
            return row[0] 
        return ""

    def getIntro ( self, _preSelect):
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute(''' SELECT denomination_id, 
                               denomination 
                        FROM denominations 
                        ORDER BY denomination;''')
                        
        
        _intro = HtmlTemplate.Tag ( "div" )
        _intro.setAttribute ( "class", "intro" )
        
        _section_1 = HtmlTemplate.Tag ( "h2" )      
        _section_1.addContent ( u'''Datenbasis des Test''')
        _intro.addContent ( _section_1 )
        
        _p_1 = HtmlTemplate.Tag ( "p" )
        _p_1.addContent ( u'''Hier kannst du sehen, welche 
            Glaubensgemeinschaften in der Datenbank erfasst sind, und mit welchen 
            Überzeugungen. Gut möglich das du einen Fehler entdeckst, oder du 
            noch Daten &uuml;ber eine noch fehlende Glaubensgemeinschaft 
            hinterlegen willst. Dann nimmt mit mir Kontakt auf: 
            <a href="mailto:briefkasten@olaf-radicke.de">briefkasten@olaf-radicke.de</a>''')
        _intro.addContent ( _p_1 )
        
        _section_2 = HtmlTemplate.Tag ( "h2" )      
        _section_2.addContent ( u'''Hinterlegte Datensätze ansehen''')
        _intro.addContent ( _section_2 )
        
        #_p_2 = HtmlTemplate.Tag ( "p" )
        
        _form = HtmlTemplate.Tag ( "form" )
        _form.setAttribute ( "method", "POST" )
        _form.setAttribute ( "name", "databaseview" )
        _form.setAttribute ( "action", "databaseview" )
        _p_3 = HtmlTemplate.Tag ( "p" )
        _p_3.addContent ( u'''Wähle die Glaubensgemeinschaft:''')
       
        _select = HtmlTemplate.Tag ( "select" )
        _select.setAttribute ( "name", "glaubensgemeinschaft" )
        _select.setAttribute ( "size", "1" )
        
        for row in cur:
            if int(_preSelect) == int(row[0]) :
                _option = u'<option  ' 
                _option += u' value="' + unicode ( row[0] ) + '" '
                _option += u'  selected  >' 
                _option += row[1]
                _option += u'</option>'
            else :
                _option = HtmlTemplate.Tag ( "option" )
                _option.setAttribute ( "value", unicode( row[0] ) )
                _option.addContent ( row[1] )
            _select.addContent ( _option )
            
        _p_3.addContent ( _select )

        _p_3.addContent ( form.Button('anzeigen').render() )
        _form.addContent ( _p_3 ) 
        
        _intro.addContent ( _form )
        conn.close()
        return _intro

    def GET(self):
        _appbox = HtmlTemplate.Tag ( "div" )
        _appbox.setAttribute ( "class", "appbox" )
        _intro = self.getIntro( 0 )
        _appbox.addContent ( _intro )
        _htmlcode = self.htemp.getCompleteSite( "datenbasis", _appbox )
        return self.htemp.convertGermanChar( _htmlcode )
        
    def POST(self):
        widgetlist = web.input(groups = []) 
        _id = widgetlist['glaubensgemeinschaft']
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()  
        cur.execute ( '''
            SELECT questions.question, 
                   denomination_answers.answer_nr, 
                   denomination_answers.commentary
            FROM denomination_answers, 
                 questions 
            WHERE denomination_answers.denomination_id = ?
            AND denomination_answers.question_id = questions.question_id
            ORDER BY denomination_answers.answer_nr, 
                    questions.kat, 
                    questions.question;
                    ''', (  _id ))

        htmlcode = ""
        
        _appbox = HtmlTemplate.Tag ( "div" )
        _appbox.setAttribute ( "class", "appbox" )
        
        _intro = self.getIntro( _id )
        _appbox.addContent ( _intro )
        _appbox.addContent ( u'<br/>' )
       
        _table =   HtmlTemplate.Tag ( "table" )
        
        _table_titles =   HtmlTemplate.Tag ( "tr" )
        _title =   HtmlTemplate.Tag ( "th" )
        _title.addContent ( u'Aussage zum Glauben (Mehr Infos unter ' )
        
        _titleLink =  HtmlTemplate.Tag ( "a" )
        _titleLink.setAttribute ( "href", self.getUrlOfDenomination ( _id ) )
        _titleLink.addContent ( self.getUrlOfDenomination ( _id ) )
        _title.addContent ( _titleLink )
        _table_titles.addContent ( _title )
        _title.addContent ( u")" )
        _table.addContent ( _table_titles )
            
        for row in cur:
            _row  =  HtmlTemplate.Tag ( "tr" )
            _col =  HtmlTemplate.Tag ( "td" )
            if int(row[1]) == 0:
                _row.setAttribute ( "class", "no" )
                _col.addContent ( u'<b>Trift nicht zu:</b> ')
            elif int(row[1]) == 1:
                _row.setAttribute ( "class", "yes" )
                _col.addContent ( u'<b>Trift zu:</b> ')
            elif int(row[1]) == 2:
                _row.setAttribute ( "class", "void" )
                _col.addContent ( u'<b>Persönliche Entscheidung:</b> ')
            else:
                _row.setAttribute ( "class", "void" )
                _col.addContent ( u'<b>Keine Aussage:</b> ') 
                
            _tooltip = HtmlTemplate.Tag ( "a" )
            _tooltip.setAttribute ( "href", "#hint" )
            _tooltip.setAttribute ( "class", "tooltip" )
            _tooltip.addContent ( unicode(row[0] ) )
            
            _info = HtmlTemplate.Tag ( "span" )
            _info.setAttribute ( "class", "info" )
            _info.addContent ( u'<b>Erläuterung:</b> ')
            _info.addContent ( unicode(row[2]) )
            _tooltip.addContent ( _info )
            
            _col.addContent ( _tooltip )
            _row.addContent ( _col ) 
            _table.addContent ( _row )   

        _appbox.addContent ( _table )
        
        
        _form = HtmlTemplate.Tag ( "form" )
        _form.setAttribute ( "method", "POST" )
        _form.setAttribute ( "name", "databaseedit" )
        _form.setAttribute ( "action", "databaseedit" )
        
        _noAnswersCount = self.getNoAnswersCount ( _id )
        if _noAnswersCount > 0 :
            _p_noAnswers = HtmlTemplate.Tag ( "p" )
            if _noAnswersCount > 2 :
                _p_noAnswers.addContent ( u'Es gibt noch ' ) 
                _p_noAnswers.addContent ( unicode ( _noAnswersCount ) ) 
                _p_noAnswers.addContent ( u''' Aussagen zu der noch keine 
                Antworten hinterlegt wurde.''' ) 
            else :
                _p_noAnswers.addContent ( u'''Es gibt noch eine Aussage zu der 
                noch keine Antwort hinterlegt wurde.''' ) 
            _form.addContent ( _p_noAnswers )
        
        _h2_editdb = HtmlTemplate.Tag ( "h2" )
        _h2_editdb.addContent ( u'Änderungswünsche')
        _form.addContent ( _h2_editdb )
            
        _p_editdb = HtmlTemplate.Tag ( "p" )
        _p_editdb.addContent ( u'''<b>Du bist nicht mit allen Punkten einverstanden?</b>
        oder es gibt noch Aussage zu denen noch keine Antwort hinterlegt wurde.
        Dann sende mir deine Liste mit den Änderungswünsche: ''')
               
        _button = HtmlTemplate.Tag ( "button" )
        _button.addContent ( u'Jetzt erstellen' )
        _button.setAttribute ( "id", "edit_denomination" )
        _button.setAttribute ( "name", "edit_denomination" )
        _button.setAttribute ( "value", _id )
        _p_editdb.addContent ( _button )
        _form.addContent ( _p_editdb )
        _appbox.addContent ( _form )
        
        htmlcode += self.htemp.getCompleteSite( "datenbasis", _appbox )
        return self.htemp.convertGermanChar( htmlcode )