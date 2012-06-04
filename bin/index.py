
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
        htmlcode += u'        <h2>Willkommen auf dem BELIEF MATCHING</h2>'
        htmlcode += u'<h2>Über dieser Projekt</h2>'
        htmlcode += u'<p>Diese Programm ist ein Tool um herauszufinden mit welchen '
        htmlcode += u' Glaubensgemeinschaften deine eigene Überzeugeng am meisten '
        htmlcode += u' übereinstimmt. Inspiriert ist das Projekt von dem '
        htmlcode += u'<a href="http://www.beliefnet.com/Entertainment/Quizzes/BeliefOMatic.aspx">'
        htmlcode += u'<i>Belief-O-Matic</i></a> (einer eingetragenen Marke).</p>'
        
        htmlcode += u'<p>Es gibt bekanntlich <i>sehr</i> viele verschiedene Glaubensgemeinschaften. '
        htmlcode += u'Diese Programm konzentriert sich auf die christlichen Konfessionen, '
        htmlcode += u'die im deutschsprachigem Raum anzutreffen sind. Und auch das dürften '
        htmlcode += u'schon viele dutzende sein. </p>'
        
        htmlcode += u'<p>Bisher wurden die folgenden Konfessionen in die Datenbank eingepflegt:</p>'
        htmlcode += u'<ul>'
        for row in cur:
            htmlcode += u'    <li>' + str(row[1]) + '</li>'
        htmlcode += u'</ul>'
        htmlcode += u'<p><b>Bitte nimm das Ergebnis des Test nicht all zu ernst!</b> Ein Computer-Programm'
        htmlcode += u' kann nur ein sehr begrenztes Spektrum der realen Welt abstrahieren. '
        htmlcode += u' Selbstverständlich ist eine (Glaubens-)Gemeinschaft mehr als die Summe'
        htmlcode += u' ihre Grundsätze. Das Programm soll viel mehr anregen über die eigenen'
        htmlcode += u' Anschauungen und die der anderen nachzudenken; Gemeinsamkeiten aber auch'
        htmlcode += u' Unterschiede zu entdecken.</p>'
        
        htmlcode += u'<h2>Stand der Arbeit</h2>'
        htmlcode += u'<p>Es wird noch einige Zeit brauchen bis alle - oder die meisten - Konfessionen in '
        htmlcode += u'die Datenbank eingepflegt sind. Du kannst aber mithelfen den Prozess zu beschleunigen'
        htmlcode += u'und die Quallitä zu verbessern, in dem du deine Anmerkungen und'
        htmlcode += u'Voerschläge an mich schickst (<a href=mailto:briefkasten@olaf-radicke.de">'
        htmlcode += u'briefkasten@olaf-radicke.de</a>. Oder wenn du sogar mit SQL umgehen kannst,'
        htmlcode += u'kannst du auch direkt über '
        htmlcode += u'<a href="https://github.com/OlafRadicke/belief-matching">GitHub'
        htmlcode += u'</a> am Code mitarbeiten. Die Software steht unter der '
        htmlcode += u'<a href="http://de.wikipedia.org/wiki/GNU_Affero_General_Public_License">'
        htmlcode += u'GNU Affero General Public License</a>, also also eine freie Software, '
        htmlcode += u'die du benutzen, verändern und weitergeben darfst. Vorausgesetzt, das '
        htmlcode += u'du allen Anderen die selben rechte einräumst.</p>'
        htmlcode += u'<p>Der Name des Projektes <i>belief-matching</i> ist nur ein '
        htmlcode += u'vorläufiger Arbeitstitel. Die suche nach einem geeigneten Namen ist noch'
        htmlcode += u'nicht abgeschlossen und für Vorschläge bin ich hier dankbar.</p>'
        htmlcode += self.htemp.bottom
        return self.htemp.convertGermanChar( htmlcode )