
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
 
    def getDictOfDenominationNames (self):
        
        denominationNames = dict()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute("SELECT denomination_id, denomination FROM denominations ORDER BY denomination;")
        for row in cur:
             denominationNames [ str(row[1]) ] = str(row[0]) 
        return denominationNames
        
        
    def getAnswersOfDenomination(self, question_id):
        questionAnswers = []
        id = widgetlist['glaubensgemeinschaft']
        sqlcommand = "SELECT question_id.question "
        sqlcommand += " FROM answers, questions "
        sqlcommand += " WHERE answers.denomination_id = "  + str( question_id )
        sqlcommand += " AND answers.question_id = questions.question_id"
        sqlcommand += " ORDER BY questions.kat, questions.question;"
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute ( sqlcommand )       
        for row in cur:
             questionAnswers.append ( str(row[0]) )
        return questionAnswers
        
        
    def GET(self):
        #_form = self.test_form()
        #return render.index(my_form)
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
            htmlcode += '            <td>Trift zu:<input type="checkbox" name="question-' + str(row[0]) \
                + '" value="question-' + str(row[0]) + '" /></td>'
            htmlcode += '            <td><select name="wichtung-' + str(row[0]) + '" size="1">'
            htmlcode += '                  <option value="1">mittel</option>'
            htmlcode += '                  <option value="2">sehr wichtig</option>'
            htmlcode += '                  <option value="0">unwichtig</option>'
            htmlcode += '                </select>'
            htmlcode += '            </td>'
            htmlcode += '          </tr>'  
        htmlcode += '           </table>'
        htmlcode += form.Button('Anfrage abschicken').render()
        htmlcode += '            </form>'
        htmlcode += self.htemp.bottom
        return htmlcode  
        
    def POST(self): 
        user_selection = dict()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute("SELECT question_id FROM questions;")  
        
        widgetlist = web.input(groups = []) 
       
        htmlcode = self.htemp.top("test")
        htmlcode += '        <h2>Ergebnis</h2>'
        htmlcode += '<b>Ihre Auswahl:</b> <br>'
        htmlcode += '<ul>'
        for row in cur:  
            i = row[0]
            if "question-" + str(i) in widgetlist: 
                htmlcode += '<li>Aussage Nr.: ' + str(i) + ' '
                htmlcode += 'WICHTUNG: id ' + widgetlist['wichtung-' + str(i)] + '</li>'
                user_selection[str(i)] =  widgetlist['wichtung-' + str(i)]
        htmlcode += '</ul>'
        
        htmlcode += self.htemp.bottom
        print "user_selection: "
        print user_selection
        return htmlcode   