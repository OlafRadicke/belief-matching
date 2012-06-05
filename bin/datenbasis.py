
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
        return self.htemp.convertGermanChar( htmlcode )
        
    def POST(self):
        widgetlist = web.input(groups = []) 
        _id = widgetlist['glaubensgemeinschaft']
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()  
        cur.execute ( '''
            SELECT questions.question, 
                denomination_answers.answer_nr, 
                questions.commentary 
            FROM denomination_answers, 
                questions 
            WHERE denomination_answers.denomination_id = ?
            AND denomination_answers.question_id = questions.question_id
            ORDER BY denomination_answers.answer_nr, 
                    questions.kat, 
                    questions.question;
                    ''', (  _id ))

        htmlcode = self.htemp.top("datenbasis")
        htmlcode += self.getIntro()       
        htmlcode += u'            <table>'
        htmlcode += u'              <tr>'
        htmlcode += u'                <th>Aussage zum Glauben (Mehr Infos unter '
        htmlcode += u'                  <a href="' + self.getUrlOfDenomination ( _id )  + '">'
        htmlcode +=                      self.getUrlOfDenomination ( _id )
        htmlcode += u'                  </a>)'
        htmlcode += u'              </th>'
        htmlcode += u'              </tr>'
        #odd = 0
        #for row in cur:
            #if odd == 1:
                #htmlcode += u'       <tr id="odd">'
                #odd = 0
            #else:
                #htmlcode += u'       <tr>'
                #odd = 1
            #htmlcode += u'            <td>' + row[0] + '</td>'
            #htmlcode += u'          </tr>'  
            
        for row in cur:
            if int(row[1]) == 0:
                htmlcode += u'       <tr id="no">'
                htmlcode += u'            <td><b>Trift nicht zu:</b> ' 
            elif int(row[1]) == 1:
                htmlcode += u'       <tr id="yes">'
                htmlcode += u'            <td><b>Trift zu:</b> ' 
            elif int(row[1]) == 2:
                htmlcode += u'       <tr id="void">'
                htmlcode += u'            <td><b>Persönliche Entscheidung:</b> ' 
            else:
                htmlcode += u'       <tr id="void">'
                htmlcode += u'            <td><b>Keine Aussage:</b> ' 

            htmlcode += u'                 <a href="#hint" class="tooltip">'
            htmlcode += u'                    ' + unicode(row[0])
            htmlcode += u'                    <span class="info">'
            htmlcode += u'                    <b>Erläuterung:</b> ' + unicode(row[2])
            htmlcode += u'                    </span>'
            htmlcode += u'                 </a>'
            
            htmlcode += u'                </td>'    
            htmlcode += u'           </tr>'              
        htmlcode += u'           </table>'        
        htmlcode += self.htemp.bottom
        return self.htemp.convertGermanChar( htmlcode )