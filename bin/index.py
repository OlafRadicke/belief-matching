
# -*- coding: utf_8 -*-

import HtmlTemplate
import sqlite3

class index:
    
    htemp = HtmlTemplate.HtmlTemplate()
    
    def GET(self):
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute("SELECT denomination_id, denomination FROM denominations ORDER BY denomination;")
        
        htmlcode = self.htemp.top("home")
        htmlcode += '        <h2>Willkommen auf dem BELIEF MATCHING</h2>'
        htmlcode += '<p>Ein Tool um herauszufinden mit welchen Glaubensgemeinschaften '
        htmlcode += u'deine eigene &Uuml;berzeugeng am meisten &uuml;bereinstimmt.</p>'
        htmlcode += '<p>Es gibt bekanntlich <i>sehr</i> verschiedene Glaubensgemeinschaften. '
        htmlcode += 'Diese Programm konzentriert sich auf die christlichen Konfessionen, '
        htmlcode += 'die im deutschsprachigem Raum anzutreffen sind. Und auch das d&uuml;rften '
        htmlcode += 'schon dutzende sein. </p>'
        htmlcode += '<p>Es wird noch einige Zeit brauchen bis alle Konfessionen in die Datenbank'
        htmlcode += 'eingepflegt sind. Du kannst aber mithelfen den Prozess zu beschleunigen'
        htmlcode += 'und die Quallit&auml; zu verbessern, in dem du deine Anmerkungen und'
        htmlcode += 'Voerschl&auml;ge an mich schickst. Oder wenn du sogar mit SQL umgehen kannst,'
        htmlcode += 'kannst du auch direkt &uuml;ber GitHub am Code mitarbeiten.</p>'
        htmlcode += '<p>Kontakt-Adresse und den Link zum Quell-Code findest du unten in der Fusszeile.'
        htmlcode += 'Bisher wurden die folgenden Konfessionen in die Datenbank eingepflegt:</p>'
        htmlcode += '<ul>'
        for row in cur:
            htmlcode += u'    <li>' + str(row[1]) + '</li>'
        htmlcode += '</ul>'
        htmlcode += self.htemp.bottom
        return htmlcode 