
# -*- coding: utf_8 -*-

import sys
import sqlite3
import web
from web import form

import HtmlTemplate

class belieftest:
    
    #test_form = form.Form( 
    #form.Checkbox("yes_or_no", 
                  #description="trifft zu", 
                  #class_="standard", 
                  #value="", 
                  #checked=False), 
    #form.Button('go')
    #)
    
    htemp = HtmlTemplate.HtmlTemplate()
 
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
        print "denominationName:" + denominationName
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
        max_points = 0
        denomination_points = dict()
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
        print "user_answers: "
        print user_answers
        cur.execute("SELECT COUNT( question_id ) FROM questions;") 
        for row in cur:  
            max_points = row[0]
            print "Anzahl Fragen: " + str( max_points )
            
        cur.execute("SELECT denomination_id FROM denominations;") 
        # denomination loop
        for row in cur:  
            _denomination_id = row[0]
            denomination_points [ str(_denomination_id) ] = 0
            # user answer loop
            for user_answer_key in user_answers.keys() :
                print "frage: "
                print user_answer_key
                deno_answer = self.getAnswersOfDenomination( _denomination_id, user_answer_key )
                print "antwort von Kofession: " + str( deno_answer )
                print "antwort user: " + str( user_answers [ user_answer_key ] [ "answer" ] )
                if user_answers [ user_answer_key ] [ "answer" ] == deno_answer :
                    if user_answers [ user_answer_key ] [ "wichtung" ] == "1" :
                        denomination_points [ str(_denomination_id) ] = \
                            int(denomination_points [ str(_denomination_id) ]) + 5
                    else:
                        denomination_points [ str(_denomination_id) ] = \
                            int(denomination_points [ str(_denomination_id) ]) + 1
                else:
                    denomination_points [ str(_denomination_id) ] = \
                        int(denomination_points [ str(_denomination_id) ]) + 0
                     
        _htmlcode += '            <table>'
        _htmlcode += '              <tr>'
        _htmlcode += '                <th>Konfession </th>'
        _htmlcode += '                <th>Punkte</th>'
        _htmlcode += '              </tr>'    
        odd = 0
        for denomination_points_key in denomination_points.keys():
            
            if odd == 1:
                _htmlcode += '       <tr id="odd">'
                odd = 0
            else:
                _htmlcode += '       <tr>'
                odd = 1
            _htmlcode += '            <td>' + self.getDenominationName( denomination_points_key ) + '</td>'
            _bigest_value = int ( max ( denomination_points.values() ) )
            _sum_denomination_points = int ( denomination_points [denomination_points_key] )
            print "ein prozent: " +  str ( float(_bigest_value) / float ( 100 ) )
            _relativ =  _sum_denomination_points / ( float(_bigest_value) / float ( 100 ) ) 
            _htmlcode += '            <td>' 
            _htmlcode += '            <div class="points" style="width:' + str ( _relativ ) + '%;">'
            _htmlcode +=                  str ( _bigest_value ) + ' Punkte </div></td>'
            _htmlcode += '          </tr>'  
        _htmlcode += '           </table>'          
        
            
        
        return _htmlcode
        
        
    def GET(self):

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
            htmlcode += '            <td>' + row[1] + '</td>'
            htmlcode += u'            <td>' + unicode(row[2]) + '</td>'
            htmlcode += '            <td>'
            htmlcode += '                <select name="answer-' + str(row[0]) + '"'
            htmlcode += '                        size="1">'
            htmlcode += '                  <option value="0">trifft nicht zu</option>'
            htmlcode += '                  <option value="1">trifft zu</option>'
            htmlcode += '                  <option value="2">keine Meinung</option>'
            htmlcode += '                </select>'
                
            htmlcode += '</td>'
            htmlcode += '            <td>'
            htmlcode += '                <select name="wichtung-' + str(row[0]) + '" size="1">'
            htmlcode += '                   <option value="0">normal</option>'
            htmlcode += '                   <option value="1">sehr wichtig</option>'
            
#            for key in weightingsDict.keys():
#                htmlcode += '              <option value="' + key + '">' 
#                htmlcode +=                     weightingsDict[key] + '</option>'
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