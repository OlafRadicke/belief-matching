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
import VisitLog
import sqlite3
import web
import SQLBackend

class index:
    
    htemp = HtmlTemplate.HtmlTemplate()
    
    def GET(self):
        _ip = unicode ( web.ctx['ip'] )
        VisitLog.VisitLog().write ( _ip, 'index' )
        SQLBackend.SQLBackend().getVisitStatistic ()
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute('''
            SELECT denomination_id, denomination, url
            FROM denominations 
            ORDER BY denomination;
            ''' )
        _deno_list = cur.fetchall()
        htmlcode = ""
        
        _appbox = HtmlTemplate.Tag ( "div" )
        _appbox.setAttribute ( "class", "appbox" )
        
        _h2 = HtmlTemplate.Tag ( "h2" )
        _h2.addContent ( u'Willkommen auf dem BELIEF MATCHING' )
        _appbox.addContent ( _h2 )
        
        _h3_aboud = HtmlTemplate.Tag ( "h3" )
        _h3_aboud.addContent ( u'Über dieser Projekt' )
        _appbox.addContent ( _h3_aboud )        
        
        _p_1 = HtmlTemplate.Tag ( "p" )
        _p_1.addContent ( u'''Dieses Programm ist ein Tool, um herauszufinden mit 
            welchen Glaubensgemeinschaften deine eigene Überzeugeng am meisten 
            übereinstimmt. Inspiriert ist das Projekt von dem ''' )
        
        _link = HtmlTemplate.Tag ( "a" )
        _link.setAttribute ( "href" , "http://www.beliefnet.com/Entertainment/Quizzes/BeliefOMatic.aspx" )
        _link.addContent ( u'<i>Belief-O-Matic</i>' )
        _link.addContent ( " (einer eingetragenen Marke)." )
        _p_1.addContent ( _link )
        _appbox.addContent ( _p_1 )         
        
        _p_2 = HtmlTemplate.Tag ( "p" )
        _p_2.addContent ( u'''Es gibt bekanntlich <i>sehr</i> viele verschiedene 
            Glaubensgemeinschaften. Dieses Programm konzentriert sich auf die 
            christlichen Konfessionen, die im deutschsprachigem Raum anzutreffen 
            sind. Und auch das dürften schon viele Dutzende sein.''' )
        _appbox.addContent ( _p_2 )   

        _p_3 = HtmlTemplate.Tag ( "p" )
        _p_3.addContent ( u'Bisher wurden die folgenden ' )
        _p_3.addContent ( unicode (  len( _deno_list ) ) )
        _p_3.addContent ( u' Konfessionen in die Datenbank eingepflegt:' )
        _appbox.addContent ( _p_3 )   
        
        _list = HtmlTemplate.Tag ( "ol" )
        for row in _deno_list:
            _item_link = HtmlTemplate.Tag ( "a" )
            _item_link.setAttribute ( "href" , row[2] )
            _item_link.addContent ( row[1] )
            
            _item = HtmlTemplate.Tag ( "li" )
            _item.addContent ( _item_link ) 
            
            _list.addContent ( _item ) 
        _appbox.addContent ( _list )
        
        _p_4 = HtmlTemplate.Tag ( "p" )
        _p_4.addContent ( u'''<b>Bitte nimm das Ergebnis des Test nicht all zu 
            ernst!</b> Ein Computer-Programm' kann nur ein sehr begrenztes 
            Spektrum der realen Welt abstrahieren. Selbstverständlich ist eine 
            (Glaubens-)Gemeinschaft mehr als die Summe ihre Grundsätze. Das 
            Programm soll viel mehr anregen, über die eigenen Anschauungen und 
            die der anderen nachzudenken; Gemeinsamkeiten aber auch Unterschiede 
            zu entdecken.''' )
        _appbox.addContent ( _p_4 )
      
        _h3_todo = HtmlTemplate.Tag ( "h3" )
        _h3_todo.addContent ( u'Stand der Arbeit' )
        _appbox.addContent ( _h3_todo )
        
        _p_5 = HtmlTemplate.Tag ( "p" )
        _p_5.addContent ( u'''Es wird noch einige Zeit brauchen, bis alle - oder 
            die meisten - Konfessionen in die Datenbank eingepflegt sind. Du 
            kannst aber mithelfen den Prozess zu beschleunigen und die Quallität 
            zu verbessern, indem du deine Anmerkungen und Vorschläge an mich 
            schickst (<a href="mailto:briefkasten@olaf-radicke.de">
            briefkasten@olaf-radicke.de</a>. Oder wenn du sogar mit SQL umgehen 
            kannst, kannst du auch direkt über 
            <a href="https://github.com/OlafRadicke/belief-matching">GitHub</a> 
            am Code mitarbeiten. Die Software steht unter der 
            <a href="http://de.wikipedia.org/wiki/GNU_Affero_General_Public_License">
            GNU Affero General Public License</a>, also also eine freie Software, 
            die du benutzen, verändern und weitergeben darfst. Vorausgesetzt, 
            das du allen Anderen die selben Rechte einräumst.'''  )
        _appbox.addContent ( _p_5 )

        _p_6 = HtmlTemplate.Tag ( "p" )
        _p_6.addContent ( u'''Der Name des Projektes <i>belief-matching</i> ist nur ein
            vorläufiger Arbeitstitel. Die Suche nach einem geeigneten Namen ist noch   
            nicht abgeschlossen. Für Vorschläge hierzu bin ich dankbar.'''   )  
        _appbox.addContent ( _p_6 )

        htmlcode += self.htemp.getCompleteSite( "home", _appbox )
        #return self.htemp.convertGermanChar( htmlcode )
        #print htmlcode
        web.header('Content-Type','text/html; charset=utf-8', unique=True)
        return htmlcode