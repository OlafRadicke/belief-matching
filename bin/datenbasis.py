
# -*- coding: utf_8 -*-

import sys
import sqlite3
import web
from web import form

import HtmlTemplate

class datenbasis:    

    htemp = HtmlTemplate.HtmlTemplate()  
    
    def getUrlOfDenomination ( self, _id ):
        
        sqlcommand = "SELECT url  "
        sqlcommand += " FROM denominations "
        sqlcommand += " WHERE denomination_id = "  + str( _id ) + ";"
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute ( sqlcommand )       
        for row in cur:
            return row[0] 
        return ""

    def getIntro(self):
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute("SELECT denomination_id, denomination FROM denominations ORDER BY denomination;")
        intro = u'        <h2>Datenbasis des Test</h2>'
        intro += u'<p>Hier kannst du sehen, welche Glaubensgemeinschaften in der Datenbank erfasst sind,'
        intro += u'und mit welchen &Uuml;berzeugungen. Gut m&ouml;glich das du einen Fehler entdeckst,'
        intro += u'oder du noch Daten &uuml;ber eine noch fehlende Glaubensgemeinschaft hinterlegen willst.'
        intro += u'Dann nimmt mit mir Kontakt auf: <a href="mailto:briefkasten@olaf-radicke.de">'
        intro += u'briefkasten@olaf-radicke.de</a></p>'
        
        intro += u'        <h2>Hinterlegte Datens&auml;tze ansehen</h2></p>'
        intro += u'          <form method="POST" name="test">'   
        intro += u'W&auml;hle die Glaubensgemeinschaft:'   
        intro += u'            <select name="glaubensgemeinschaft" size="1">'
        for row in cur:
            intro += u'              <option value="' + str(row[0]) + '">' + str(row[1]) + '</option>'
        intro += u'            </select>'
        intro += form.Button('anzeigen').render()
        intro += u'          </form> <br>'
        conn.close()
        return intro

    def GET(self):
        htmlcode = self.htemp.top("datenbasis") 
        htmlcode += self.getIntro()
        htmlcode += self.htemp.bottom
        return htmlcode  
        
    def POST(self):
        widgetlist = web.input(groups = []) 
        _id = widgetlist['glaubensgemeinschaft']
        sqlcommand = "SELECT questions.question, denomination_answers.answer_nr "
        sqlcommand += " FROM denomination_answers, questions "
        sqlcommand += " WHERE denomination_answers.denomination_id = "  + str( _id )
        sqlcommand += " AND denomination_answers.question_id = questions.question_id"
        sqlcommand += " ORDER BY questions.kat, questions.question;"
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute ( sqlcommand )        

        htmlcode = self.htemp.top("datenbasis")
        htmlcode += self.getIntro()       
        htmlcode += '            <table>'
        htmlcode += '              <tr>'
        htmlcode += '                <th>Aussage zum Glauben (Mehr Infos unter '
        htmlcode += '                  <a href="' + self.getUrlOfDenomination ( _id )  + '">'
        htmlcode +=                      self.getUrlOfDenomination ( _id )
        htmlcode += '                  </a>)'
        htmlcode += '              </th>'
        htmlcode += '              </tr>'
        #odd = 0
        #for row in cur:
            #if odd == 1:
                #htmlcode += '       <tr id="odd">'
                #odd = 0
            #else:
                #htmlcode += '       <tr>'
                #odd = 1
            #htmlcode += '            <td>' + row[0] + '</td>'
            #htmlcode += '          </tr>'  
            
        for row in cur:
            if int(row[1]) == 0:
                htmlcode += '       <tr id="no">'
                htmlcode += '            <td><b>Trift nicht zu:</b> ' + row[0] + '</td>'
            elif int(row[1]) == 1:
                htmlcode += '       <tr id="yes">'
                htmlcode += '            <td><b>Trift zu:</b> ' + row[0] + '</td>'
            else:
                htmlcode += '       <tr id="void">'
                htmlcode += '            <td><b>Keine Aussage:</b> ' + row[0] + '</td>'
            htmlcode += '          </tr>'              
        htmlcode += '           </table>'        
        htmlcode += self.htemp.bottom
        return htmlcode           