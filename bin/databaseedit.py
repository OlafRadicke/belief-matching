
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

class databaseedit:    

    htemp = HtmlTemplate.HtmlTemplate()  
    
    # get back a array of anser options
    def getAnswers (self):
        _answers = list()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute( ''' 
            SELECT answers_nr, description 
            FROM answers 
            ORDER BY answers_nr ; ''' )
        for row in cur:
             _answers.append( [ row[0], row[1] ] )
        return _answers    
    
    # Gibt den Namen einer Konfessions-id zurück.
    def getDenominationName (self, _id):
        
        denominationName = "unbekannter Name"
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute( '''
            SELECT denomination 
            FROM denominations 
            WHERE denomination_id = ?;
            ''', ( _id ) )
        for row in cur:
             denominationName = row[0]
        return denominationName    
    
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
        
    # formular for editing data.
    def getSQLResulte ( self, _widgetlist ) :
        
        _appbox = HtmlTemplate.Tag ( "div" )
        _appbox.setAttribute ( "class", "appbox" )
        
        _p_1 = HtmlTemplate.Tag ( "p" )
        
        _editor = HtmlTemplate.Tag ( "textarea" )
        _editor.setAttribute ( "class", "result"  )
        #_editor.setAttribute ( "cols", "80" )
        _editor.setAttribute ( "rows", "40" )
        #_editor.addContent ( self.getSqlCode() )
        _editor.addContent ( unicode(_widgetlist) )
        _p_1.addContent ( _editor )
        
        _appbox.addContent ( _p_1 )    
        
        
        
    # formular for editing data.
    def getEditForm ( self, _widgetlist ) :
        
        _answer_optionen = self.getAnswers()
        _id = _widgetlist['edit_denomination']
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()  
        cur.execute ( '''
            SELECT questions.question_id,
                   questions.question, 
                   questions.kat,
                   questions.commentary,
                   denomination_answers.answer_nr, 
                   denomination_answers.commentary
            FROM denomination_answers, 
                 questions 
            WHERE denomination_answers.denomination_id = ?
            AND denomination_answers.question_id = questions.question_id
            ORDER BY questions.kat, 
                    denomination_answers.answer_nr;
                    ''', (  _id ))

        htmlcode = ""
        
        _appbox = HtmlTemplate.Tag ( "div" )
        _appbox.setAttribute ( "class", "appbox" )
        
        _section_1 = HtmlTemplate.Tag ( "h2" )      
        _section_1.addContent ( u'''SQL-Code-Generator''')
        _appbox.addContent ( _section_1 )        
        
        
        _form = HtmlTemplate.Tag ( "form" )
        _form.setAttribute ( "method", "POST" )
        _form.setAttribute ( "name", "test" )
        _form.setAttribute ( "action", "databaseedit" )
        
        _table =  HtmlTemplate.Tag ( "table" )
        
        _table_titles =   HtmlTemplate.Tag ( "tr" )
        
        _title_1 =   HtmlTemplate.Tag ( "th" )  
        _title_1.addContent ( u'ID' )   
        _table_titles.addContent ( _title_1 )
        
        _title_2 =   HtmlTemplate.Tag ( "th" )  
        _title_2.addContent ( u'Kategorie' )   
        _table_titles.addContent ( _title_2 )
        
        _title_3 =   HtmlTemplate.Tag ( "th" )  
        _title_3.addContent ( u'Kommentar zu Aussage' )   
        _table_titles.addContent ( _title_3 )
        
        _title_4 =   HtmlTemplate.Tag ( "th" )  
        _title_4.addContent ( u'Ja/Nein' )   
        _table_titles.addContent ( _title_4 )
        
        _table.addContent ( _table_titles )        
    
        _last_kat = ""
        _odd = 0
        for row in cur:
            _rowTag  =  HtmlTemplate.Tag ( "tr" )
            
            if _odd == 1:
                _rowTag.setAttribute ( "class", "oddrow" )
                _odd = 0
            else:
                _odd = 1
            # column: number
            _col_1 =  HtmlTemplate.Tag ( "td" )
            _col_1.addContent ( unicode( row[0] ) )
            _rowTag.addContent ( _col_1 )  
            
            # column: category
            _col_2 =  HtmlTemplate.Tag ( "td" )
            if _last_kat == row[2] :
                pass
            else:
                _col_2.addContent ( row[2] ) 
                _last_kat = row[2]
            _rowTag.addContent ( _col_2 )   
            
            # column: question & comment
            _col_3 =  HtmlTemplate.Tag ( "td" )
            _tooltip = HtmlTemplate.Tag ( "a" )
            _tooltip.setAttribute ( "href", "#hint" )
            _tooltip.setAttribute ( "class", "tooltip" )
            _tooltip.addContent ( u'<b>Aussge:</b> ' + unicode( row[1] ) )
            
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
            _comment.addContent ( unicode( row[5] ) )
            _col_3.addContent ( _comment )

            _rowTag.addContent ( _col_3 )   
            
            # column: answer
            _col_4 =  HtmlTemplate.Tag ( "td" )
            
            _select = HtmlTemplate.Tag ( "select" )
            _select.setAttribute ( "name", u'answer_' + str ( row[0] ) )
            _select.setAttribute ( "size", "1" )
            
            for _optionenline in _answer_optionen :
                _option = HtmlTemplate.Tag ( "option" )
                _option.setAttribute ( "value", str ( _optionenline[0] ) )
                if str(_optionenline[0]) ==  str ( row[4] ) :
                     _option.setAttribute ( "selected", "selected" )
                _option.addContent ( unicode( _optionenline[1] ) )
                _select.addContent ( _option )
                
            _col_4.addContent ( _select ) 
            _rowTag.addContent ( _col_4 )            
 
            _table.addContent ( _rowTag )
            
            
        _form.addContent (  _table )
        
        _p_editdb = HtmlTemplate.Tag ( "p" )
        _p_editdb.addContent ( u'''<br>''')
               
        _button = HtmlTemplate.Tag ( "button" )
        _button.addContent ( u'SQL-Code generieren' )
        _button.setAttribute ( "id", "gen_sql" )
        _button.setAttribute ( "name", "gen_sql" )
        _button.setAttribute ( "value", _id )
        _p_editdb.addContent ( _button )
        _form.addContent ( _p_editdb )  

        _appbox.addContent ( _form )
        return _appbox


    def GET(self):
        _appbox = HtmlTemplate.Tag ( "div" )
        _appbox.setAttribute ( "class", "appbox" )
        _htmlcode = self.htemp.getCompleteSite( "datenbasis", _appbox )
        return self.htemp.convertGermanChar( _htmlcode )
        
    def POST(self):
        
        _widgetlist = web.input(groups = []) 
        _appbox = ""
        print _widgetlist
        if "edit_denomination" in _widgetlist:
            _appbox = self.getEditForm ( _widgetlist )
        else:
            return "SQL"
        
        _htmlcode = self.htemp.getCompleteSite( "datenbasis", _appbox )
        return self.htemp.convertGermanChar( _htmlcode )