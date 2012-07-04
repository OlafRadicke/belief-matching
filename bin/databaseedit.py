
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
import VisitLog

class databaseedit:    

    htemp = HtmlTemplate.HtmlTemplate() 
    last_category = ""
    
    # get back a 2D-array of questions
    # that ist exist not a Answers
    # @ _id a id of a denomination
    def getNoAnswers ( self, _id ):
        _answers = list()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute( ''' 
            SELECT question_id, question, kat, commentary
            FROM questions 
            WHERE question_id NOT IN (
                SELECT question_id
                FROM denomination_answers
                WHERE denomination_id = ? )
            ORDER BY question_id ; ''', ( _id, ) )
        for _row_array in cur:
            _array = list()
            #questions.question_id,
            _array.append ( _row_array[0] )
            #questions.question, 
            _array.append ( _row_array[1] )
            #questions.kat,
            _array.append ( _row_array[2] )
            #questions.commentary,
            _array.append ( _row_array[3] )
            #denomination_answers.answer_nr, 
            _array.append ( 0 )
            #denomination_answers.commentary         
            _array.append ( "" )
            
            _answers.append( _array )
        return _answers    
        
    
    # get back a 2D-array of anser options
    def getAnswers (self):
        _answers = list()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute( ''' 
            SELECT answers_nr, deno_statement 
            FROM answers 
            ORDER BY answers_nr ; ''' )
        for _row_array in cur:
             _answers.append( [ _row_array[0], _row_array[1] ] )
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
            ''', ( _id, ) )
        for _row_array in cur:
             denominationName = _row_array[0]
        return denominationName    
    
    def getUrlOfDenomination ( self, _id ):
        
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()  
        cur.execute ( u'''
            SELECT url
            FROM denominations 
            WHERE denomination_id = ? ;        
        ''', ( _id, ) )       
        for _row_array in cur:
            return _row_array[0] 
        return ""
        
    # formular for editing data.
    def getSQLResulte ( self, _widgetlist ) :
        
        _id =  _widgetlist['gen_sql']
        
        _max_weighting_points = 0
        max_points = 0
        denomination_points = dict()
        denomination_weighting_points = dict()
        user_answers = dict()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute(u'''SELECT question_id ,
                               kat
                        FROM questions
                        ORDER BY questions.kat, 
                                 question_id ;''')  
        
        widgetlist = web.input(groups = []) 
        
        _sqlcode = u'BEGIN; \n\n'
        _sqlcode += u'INSERT INTO denominations ( denomination_id, denomination, url ) \n'
        _sqlcode += u' VALUES ( \n'
        _sqlcode += u'     ' + str( _id ) + u',  \n'
        _sqlcode += u'     \'' + self.getDenominationName ( _id ) + '\', \n'
        _sqlcode += u'     \'' + self.getUrlOfDenomination ( _id ) + '\'); \n\n'
        
        _last_category = u''
        for _row_array in cur:  
            q_no = _row_array[0] 
            _category_name = unicode( _row_array[1] )
            if _last_category != _category_name:
                _last_category = _category_name
                _sqlcode += u'\n-- ##################### Kategorie : ' 
                _sqlcode += _category_name + ' #####################\n\n'
            _answer_key = u'answer_' + unicode( q_no )
            _comment_key = u'comment_'  + unicode( q_no )
            
            _sqlcode += u'INSERT INTO denomination_answers ( \n'
            _sqlcode += u'        question_id, \n'
            _sqlcode += u'        denomination_id, \n'
            _sqlcode += u'        answer_nr, \n'
            _sqlcode += u'        commentary ) \n '
            _sqlcode += u'    VALUES ( '
            _sqlcode += u'        ' + unicode( q_no ) + ', '
            _sqlcode += u'        ' + unicode( _id) + ', '
            _sqlcode += u'        ' + unicode(  widgetlist[ _answer_key ] )  + ', \n'
            _sqlcode += u'        \'' + unicode(  widgetlist[ _comment_key] )  + '\'); \n \n'

        _sqlcode += u'COMMIT;; \n\n' 
        
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
            <b>Vielen Dank!</b>''' )
        _appbox.addContent ( _p_1 )
        
        _editor = HtmlTemplate.Tag ( "textarea" )
        _editor.setAttribute ( "class", "result"  )
        #_editor.setAttribute ( "cols", "80" )
        _editor.setAttribute ( "rows", "40" )
        _editor.addContent ( unicode( _sqlcode ) )
        _appbox.addContent ( _editor )
         
        return _appbox       
        
    # get back a tr-tag
    # @_row_array 
    def getEditRow (self, _isOdd, _row_array ):
        
        _answer_optionen = self.getAnswers()
        _rowTag  =  HtmlTemplate.Tag ( "tr" )
        
        if int( _isOdd ) == int ( 1 ) :
            _rowTag.setAttribute ( "class", "oddrow" )

        # column: number
        _col_1 =  HtmlTemplate.Tag ( "td" )
        _col_1.addContent ( '<small>' + unicode( _row_array[0] ) + '</small>' )
        _rowTag.addContent ( _col_1 )  
        
        
        # column: question & comment
        _col_3 =  HtmlTemplate.Tag ( "td" )
        _tooltip = HtmlTemplate.Tag ( "a" )
        _tooltip.setAttribute ( "href", "#hint" )
        _tooltip.setAttribute ( "class", "tooltip" )
        _tooltip.addContent ( u'<b>Aussge:</b> ' + unicode( _row_array[1] ) )
        
        _info = HtmlTemplate.Tag ( "span" )
        _info.setAttribute ( "class", "info" )
        _info.addContent ( u'<b>Erläuterung:</b> ')
        _info.addContent ( unicode ( _row_array[3] ) )
        _tooltip.addContent ( _info )
        _col_3.addContent ( _tooltip )
        _col_3.addContent ( "<br>" )
        
        # column: comment
        
        _comment = HtmlTemplate.Tag ( "textarea" )
        _comment.setAttribute ( "name", "comment_" + str ( _row_array[0] )  )
        _comment.setAttribute ( "cols", "60" )
        _comment.setAttribute ( "rows", "2" )
        _comment.addContent ( unicode( _row_array[5] ) )
        _col_3.addContent ( _comment )

        _rowTag.addContent ( _col_3 )   
        
        # column: answer
        _col_4 =  HtmlTemplate.Tag ( "td" )
        
        _select = HtmlTemplate.Tag ( "select" )
        _select.setAttribute ( "name", u'answer_' + str ( _row_array[0] ) )
        _select.setAttribute ( "size", "1" )
        
        for _optionenline in _answer_optionen :
            _option = HtmlTemplate.Tag ( "option" )
            _option.setAttribute ( "value", str ( _optionenline[0] ) )
            if str(_optionenline[0]) ==  str ( _row_array[4] ) :
                    _option.setAttribute ( "selected", "selected" )
            _option.addContent ( unicode( _optionenline[1] ) )
            _select.addContent ( _option )
            
        _col_4.addContent ( _select ) 
        _rowTag.addContent ( _col_4 )  
        return _rowTag
    
        
    # formular for editing data.
    def getEditForm ( self, _widgetlist ) :
        
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
                    ''', (  _id, ))

        htmlcode = ""
        
        _appbox = HtmlTemplate.Tag ( "div" )
        _appbox.setAttribute ( "class", "appbox" )
        
        _section_1 = HtmlTemplate.Tag ( "h2" )      
        _section_1.addContent ( u'''SQL-Code-Generator für ''')
        _section_1.addContent ( self.getDenominationName ( _id ) )
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
        
        _title_3 =   HtmlTemplate.Tag ( "th" )  
        _title_3.addContent ( u'Kommentar zu Aussage' )   
        _table_titles.addContent ( _title_3 )
        
        _title_4 =   HtmlTemplate.Tag ( "th" )  
        _title_4.addContent ( u'Ja/Nein' )   
        _table_titles.addContent ( _title_4 )
        
        _table.addContent ( _table_titles )        
    
        # loop with exist answers
        _odd = 0
        _count = 1
        _last_kat = u''
        for _row_array in cur:
            if _last_kat != _row_array[2] :
                _table.addContent (  u'''<tr><td class="category" colspan="3">
                    ''' + unicode ( _row_array[2] ) + u'''</td></tr>''' )
                _last_kat = unicode ( _row_array[2] )
    
            
            _count += 1
            if _odd == 1:
                _odd = 0
            else:
                _odd = 1
            _rowTag  =  self.getEditRow ( _odd, _row_array )
            _table.addContent ( _rowTag )
            
        # loop with not exist answers
        
        _cur = self.getNoAnswers ( _id )
        if len( _cur ) > 0 :
            _table.addContent ( u'<tr><th colspan="4">Bisher nicht hinterlegte Aussagen:</th></tr>' )
        _odd = 0
        _count = 1
        for _row_array in _cur:
            if _last_kat != _row_array[2] :
                _table.addContent (  u'''<tr><td class="category" colspan="3">
                    ''' + unicode ( _row_array[2] ) + u'''</td></tr>''' )
                _last_kat = unicode ( _row_array[2] )
 
            
            _count += 1
            if _odd == 1:
                _odd = 0
            else:
                _odd = 1
            _rowTag  =  self.getEditRow ( _odd, _row_array )
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
        _ip = unicode ( web.ctx['ip'] )
        VisitLog.VisitLog().write ( _ip, 'Datenbearbeitungsstart' )
        _appbox = HtmlTemplate.Tag ( "div" )
        _appbox.setAttribute ( "class", "appbox" )
        _htmlcode = self.htemp.getCompleteSite( "databaseedit", _appbox )
        web.header('Content-Type','text/html; charset=utf-8', unique=True)
        return self.htemp.convertGermanChar( _htmlcode )
        
    def POST(self):
        
        _widgetlist = web.input(groups = []) 
        _appbox = ""
        if "edit_denomination" in _widgetlist:
            _ip = unicode ( web.ctx['ip'] )
            VisitLog.VisitLog().write ( _ip, 'Datenbearbeitungsauswahl' )
            _appbox = self.getEditForm ( _widgetlist )
        else:
            _ip = unicode ( web.ctx['ip'] )
            VisitLog.VisitLog().write ( _ip, 'DatenbearbeitungsSQLCode' )
            _appbox = self.getSQLResulte ( _widgetlist )
        
        _htmlcode = self.htemp.getCompleteSite( "databaseedit", _appbox )
        web.header('Content-Type','text/html; charset=utf-8', unique=True)
        return self.htemp.convertGermanChar( _htmlcode )