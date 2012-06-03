
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
        htmlcode += '<p>Bisher wurden die folgenden Konfessionen in die Datenbank eingepflegt:</p>'
        htmlcode += '<ul>'
        for row in cur:
            htmlcode += u'    <li>' + str(row[1]) + '</li>'
        htmlcode += '</ul>'
        htmlcode += '<p>Es wird noch einige Zeit brauchen bis alle oder die meisten Konfessionen in '
        htmlcode += 'die Datenbank eingepflegt sind. Du kannst aber mithelfen den Prozess zu beschleunigen'
        htmlcode += 'und die Quallit&auml; zu verbessern, in dem du deine Anmerkungen und'
        htmlcode += 'Voerschl&auml;ge an mich schickst (<a href=mailto:briefkasten@olaf-radicke.de">'
        htmlcode += 'briefkasten@olaf-radicke.de</a>. Oder wenn du sogar mit SQL umgehen kannst,'
        htmlcode += 'kannst du auch direkt &uuml;ber '
        htmlcode += '<a href="https://github.com/OlafRadicke/belief-matching">GitHub'
        htmlcode += u'</a> am Code mitarbeiten. Die Software steht unter der '
        htmlcode += u'<a href="http://de.wikipedia.org/wiki/GNU_Affero_General_Public_License">'
        htmlcode += u'GNU Affero General Public License</a>, also also eine freie Software, '
        htmlcode += u'die du benutzen, ver&auml;ndern und weitergeben darfst. Vorausgesetzt, das '
        htmlcode += u'du allen Anderen die selben rechte einr&auml;umst.</p>'
        htmlcode += self.htemp.bottom
        return htmlcode 