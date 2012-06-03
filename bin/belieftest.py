
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

class belieftest:
    
    htemp = HtmlTemplate.HtmlTemplate()
    
    # get back a array of anser options
    def getAnswers (self):
        _answers = list()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        sqlcommand = "SELECT answers_nr, description "
        sqlcommand += "FROM answers ORDER BY answers_nr ;"
        cur.execute( sqlcommand )
        for row in cur:
             _answers.append( [ row[0], row[1] ] )
        return _answers
 
    # Gibt ein dict mit Konfessions-id und Konfessionsnamen zurück.
    def getDenominationName (self, _id):
        
        denominationName = "unbekannter Name"
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        sqlcommand = "SELECT denomination "
        sqlcommand += "FROM denominations WHERE denomination_id = " + str( _id  ) + " ;"
        cur.execute( sqlcommand )
        for row in cur:
             denominationName = str(row[0]) 
        return denominationName
        
    # Gibt ein dict zurück mit gewichtungsnummer und gewichtungsbeschreibung.   
    def getWeightings ( self ):
        
        weightingsNames = dict()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute("SELECT weighting_nr, description FROM weightings ORDER BY weighting_nr ASC;")
        for row in cur:
             weightingsNames [ str(row[0]) ] = str(row[1]) 
        return weightingsNames        
        
    # gibt die Antwort einer Konfession auf eine Frage zurück.
    # Ist keine Antwort hinterlegt wird "egal" also "2" zurückgegeben.
    def getAnswersOfDenomination( self, denomination_id, question_id ):
        questionAnswers = dict()
        sqlcommand = "SELECT denomination_answers.answer_nr "
        sqlcommand += " FROM denomination_answers, questions "
        sqlcommand += " WHERE denomination_answers.denomination_id = "  + str( denomination_id )
        sqlcommand += " AND denomination_answers.question_id = " + str( question_id ) + ";"
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute ( sqlcommand )
        # set default value
        _denomination_answer = "2"
        for row in cur:
            _denomination_answer = str(row[0])
        return _denomination_answer
        
    # vergleicht die Antworten des Benutzer mit den der Konfessionen.
    def matching (self):
        _htmlcode = ""
        _max_weighting_points = 0
        max_points = 0
        denomination_points = dict()
        denomination_weighting_points = dict()
        user_answers = dict()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute("SELECT question_id FROM questions;")  
        
        widgetlist = web.input(groups = []) 
        #print widgetlist       
        for row in cur:  
            i = row[0]
            user_answers[str(i)] =  {'answer'   :  str( widgetlist['answer-'   + str(i)] ), \
                                     'wichtung' :  str( widgetlist['wichtung-' + str(i)] ) }
          
        cur.execute("SELECT denomination_id FROM denominations;") 
        # denomination loop
        for row in cur:  
            _denomination_id = row[0]
            denomination_points [ str(_denomination_id) ] = 0
            denomination_weighting_points [ str(_denomination_id) ] = 0
            # user answer loop
            for user_answer_key in user_answers.keys() :
                deno_answer = self.getAnswersOfDenomination( _denomination_id, user_answer_key )

                if user_answers [ user_answer_key ] [ "answer" ] == deno_answer :
                    if user_answers [ user_answer_key ] [ "wichtung" ] == "1" :
                        denomination_points [ str(_denomination_id) ] = \
                            int( denomination_points [ str(_denomination_id) ]) + 1
                        denomination_weighting_points [ str(_denomination_id) ] = \
                            int( denomination_weighting_points [ str(_denomination_id) ] ) + 1
                    else:
                        denomination_points [ str(_denomination_id) ] = \
                            int( denomination_points [ str(_denomination_id) ] ) + 1
                            
        print "PRE _max_weighting_points: " + str(_max_weighting_points)
        for _key in user_answers.keys() :
            print '_answer [ "wichtung" ]: ' +  str ( user_answers [_key][ "wichtung" ] )
            if int( user_answers [_key][ "wichtung" ] ) == 1 :
                print "....true"
                _max_weighting_points = _max_weighting_points + 1        
        print "RESULT _max_weighting_points: " + str(_max_weighting_points)
                
        _htmlcode += '            <table>'
        _htmlcode += '              <tr>'
        _htmlcode += '                <th>Konfession </th>'
        _htmlcode += '                <th>&Uuml;bereinstimmung</th>'
        _htmlcode += '                <th>In wichtigen Fragen</th>'
        _htmlcode += '              </tr>'    
        odd = 0
        for denomination_points_key in denomination_points.keys():
            # Prozent zahlen allgemein
            _all = len ( user_answers.keys() )
            _sum_denomination_points = int ( denomination_points [denomination_points_key] )
            _relativ =  _sum_denomination_points / ( float( _all ) / float ( 100 ) ) 
            
            # Prozentzahl der Gewichtung
            _sum_denomination_weighting_points = float ( denomination_weighting_points [denomination_points_key] )
            #print "_sum_denomination_weighting_points: " + str( _sum_denomination_weighting_points )
            #print "_max_weighting_points: " + str(_max_weighting_points)
            if _max_weighting_points == 0 :
                _weighting_relativ = 0
            else :
                #print "_max_weighting_points : " + str(_max_weighting_points)
                _one_procent = float( _max_weighting_points ) / float ( 100 ) 
                #print "ein prozent: " +  str(_one_procent)
                _weighting_relativ =  _sum_denomination_weighting_points / _one_procent             
            
            #
            if odd == 1:
                _htmlcode += '       <tr id="odd">'
                odd = 0
            else:
                _htmlcode += '       <tr>'
                odd = 1
            _htmlcode += '            <td>' + self.getDenominationName( denomination_points_key ) + '</td>'

            _htmlcode += '            <td  class="tabpoints" >' 
            _htmlcode += '              <div class="points" style="width:' + str (int( _relativ )) + '%;">&nbsp;</div>'
            _htmlcode +=                  str ( int(_relativ) ) + ' %'
            _htmlcode += '            </td>'
            _htmlcode += '            <td  class="tabpoints-weighting">' 
            _htmlcode += '              <div class="points-weighting"  style="width:' + str (int( _weighting_relativ )) + '%;">&nbsp;</div>'
            _htmlcode +=                  str ( int(_weighting_relativ) ) + ' %'
            _htmlcode += '            </td>'
            _htmlcode += '          </tr>'  
        _htmlcode += '           </table>'          
        
            
        
        return _htmlcode
        
        
    def GET(self):
        _answer_optionen = self.getAnswers()
        _last_kat = ""
        weightingsDict = self.getWeightings ()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute("SELECT question_id, kat, question FROM questions order by kat;")
        
        htmlcode = self.htemp.top("test") 
        htmlcode += '        <h2>Test</h2>'
        htmlcode += '          <form method="POST" name="test">'      
        htmlcode += '            <table>'
        htmlcode += '              <tr>'
        htmlcode += '                <th>Kategorie</th>'
        htmlcode += u'                <th>&Uuml;berzeugnung</th>'
        htmlcode += '                <th>Ja/Nein</th>'
        htmlcode += '                <th>Gewichtung</th>'
        htmlcode += '              </tr>'
        odd = 0
        for row in cur:
            if odd == 1:
                htmlcode += '          <tr id="odd">'
                odd = 0
            else:
                htmlcode += '          <tr>'
                odd = 1
            if _last_kat == row[1] :
                htmlcode += '            <td></td>'
            else:
                htmlcode += '            <td>' + row[1] + '</td>'
                _last_kat = row[1]
            htmlcode += u'            <td>' + unicode(row[2]) + '</td>'
            htmlcode += '            <td>'
            htmlcode += '                <select name="answer-' + str(row[0]) + '"'
            htmlcode += '                        size="1">'
            for line in _answer_optionen :
                htmlcode += '                  <option value="' + str(line[0]) + '">' 
                htmlcode +=                        str(line[1])  + '</option>'

            htmlcode += '                </select>'
            htmlcode += '            </td>'
            htmlcode += '            <td>'
            htmlcode += '                <select name="wichtung-' + str(row[0]) + '" size="1">'
            htmlcode += '                   <option value="0">normal</option>'
            htmlcode += '                   <option value="1">sehr wichtig</option>'
            htmlcode += '                </select>'
            htmlcode += '            </td>'
            htmlcode += '          </tr>'  
        htmlcode += '           </table><br>'
        htmlcode += form.Button('Anfrage abschicken').render()
        htmlcode += '            </form>'
        htmlcode += self.htemp.bottom
        return htmlcode  
        
    def POST(self): 

       
        htmlcode = self.htemp.top("test")
        htmlcode += '        <h2>Ergebnis</h2>'
        htmlcode += self.matching()
        htmlcode += self.htemp.bottom
        return htmlcode