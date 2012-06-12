
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

class participate:
    
    htemp = HtmlTemplate.HtmlTemplate()
    
    def GET(self):
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute('''
            SELECT denomination_id, denomination 
            FROM denominations 
            ORDER BY denomination;
            ''' )
  
        htmlcode = ""
        
        _appbox = HtmlTemplate.Tag ( "div" )
        _appbox.setAttribute ( "class", "appbox" )
        _appbox.setAttribute ( "id", "participate" )
        
        
        _floatleft = HtmlTemplate.Tag ( "div" )
        _floatleft.setAttribute ( "class", "floatleft" )
        
        # ##############  text part ####################
        _text = HtmlTemplate.Tag ( "div" )
        _text.setAttribute ( "class", "col" )
        
        # ####################### section ##################################
        
        _h2 = HtmlTemplate.Tag ( "h2" )
        _h2.addContent ( u'Mitmachen bei BELIEF MATCHING' )
        _text.addContent ( _h2 )
        
        _h3_intro = HtmlTemplate.Tag ( "h3" )
        _h3_intro.addContent ( u'Schnelleinstieg zum mitmachen' )
        _text.addContent ( _h3_intro )        
        
        _p_1 = HtmlTemplate.Tag ( "p" )  
        _p_1.addContent ( u'''Du hast Spaß gefunden an dem Projekt und hast jetzt
            Lust das Programm aktiv zu verbessern? Super! Du muss noch nicht mal
            richtig programmieren, um ein wichtigen Betrag leisten zu können.
            Hier schildere ich, was du tun muss um Fehler in den Datensätzen zu
            beseitigen. Oder Daten zu ergänzen. Diese Anleitung ist besonders an 
            Nichtprogrammiere gerichtet.''' )
        _text.addContent ( _p_1 )        
             
            
        # ######################### section ##############################
        _h3_newaccount = HtmlTemplate.Tag ( "h3" )
        _h3_newaccount.addContent ( u'Einen neuen Account anlegen' )
        _text.addContent ( _h3_newaccount )         

        _p_2 = HtmlTemplate.Tag ( "p" )        
        _p_2.addContent ( u'''Zunächst solltest du auf die Seite von ''' )        
      
        _link_github = HtmlTemplate.Tag ( "a" )
        _link_github.setAttribute ( "href" , "https://github.com" )
        _link_github.addContent ( u'<i>GitHub</i>' )
        _p_2.addContent ( _link_github )
        
        _p_2.addContent ( u''' gehen um dir ein eigenes Konto einzurichten. Das ist 
            kostenlos (Siehe Bild 1) und in wenigen Minuten erledigt''' )   
        _text.addContent ( _p_2 )         
       
        # ######################## section   ###################################
        
        _h3_fork = HtmlTemplate.Tag ( "h3" )
        _h3_fork.addContent ( u'Eine Arbeitskopie anlegen' )
        _text.addContent ( _h3_fork )         
        
        _p_3 = HtmlTemplate.Tag ( "p" )             
        _p_3.addContent ( u'''Nach dem du dir erfolgreich ein Konto bei GitHub
            eingerichtet hast, kannst du dir eine Arbeitskopie des Projektes
            erstellen mit dem du später deine Änderungen erstellst. Dazu gehst
            du auf die ''' )        
      
        _link_github = HtmlTemplate.Tag ( "a" )
        _link_github.setAttribute ( "href" , "https://github.com/OlafRadicke/belief-matching" )
        _link_github.addContent ( u'<i>Projektseite bei GitHub.</i>' )
        _p_3.addContent ( _link_github )
        
        _p_3.addContent ( u''' Wie im Bild 2 kannst du recht oben den Knopf 
            "<i>Fork</i>" sehen. Hier klickst du drauf um deine Arbeitskopie zu 
            erstellen.''' )   
        _text.addContent ( _p_3 )           
        
        _p_4 = HtmlTemplate.Tag ( "p" )    
        _p_4.addContent ( u'''Deine Arbeitskopie ist völlig separat vom eigentlich
            Projekt. Du muss also keine angst haben etwas kaputt zu machen..''' ) 
             
        _text.addContent ( _p_4 )     
            
        # ######################################################################
 
        _h3_edit = HtmlTemplate.Tag ( "h3" )
        _h3_edit.addContent ( u'Die Arbeitskopie bearbeiten' )
        _text.addContent ( _h3_edit )         
        
        _p_5 = HtmlTemplate.Tag ( "p" )             
        _p_5.addContent ( u'''In deiner Projekt-Kopie kannst du dich bewegen wie
            in einem Datei-Browser und die einzelnen Verzeichnisse durchstöbern.
            In dem Ordner <b>"./sql"</b> liegen die Datensätze für die Datenbank.
            Wenn du einen Fehler entdeckt hast, der zu der Beschreibung einer 
            Konfession gehört, bis du hier richtig.''' )        
        _text.addContent ( _p_5 )                 
        
        _p_6 = HtmlTemplate.Tag ( "p" )    
        
        _p_6.addContent ( u'''Wenn du in den Ordner <b>"./sql"</b> gehst, siehst du
            eine Reihe von Dateien. Die beginnen immer mit dem Namen der Konfession,
            deren Informationen sie enthalten. Wenn du Eine - durch anklicken - 
            auswählst, hast du die Möglichkeit die Daten direkt im Browser zu editieren.
            Da zu klickst du auf den Button <b>"Edit this file"</b>, recht oben. Zusehen
            im Bild Nr. 3.''')       
        _text.addContent ( _p_6 )              
        
        # ######################################################################
           
        _h3_back = HtmlTemplate.Tag ( "h3" )
        _h3_back.addContent ( u'Wie deine Änderung in das Projekt zurückfließen' )
        _text.addContent ( _h3_back )         
        
        _p_7 = HtmlTemplate.Tag ( "p" )            
        
        _p_7.addContent ( u'''Als letzter Schritt sollen deine Verbesserungen 
            natürlich zurück in das Projekt fließen. Das geht auf zweierlei Weise:''' )        
        _text.addContent ( _p_7 )              
        
        _p_8 = HtmlTemplate.Tag ( "p" )     
           
        _p_8.addContent ( u'''<b>A) Über Webinterface:</b> Dazu klickst du auf
            den Knopf <b>"Pull Request"</b>, so wie es in dem untersten Bild zusehen
            ist. Darauf hin wird sich ein Dialog öffnen im dem du aufgevordert 
            wirst u.a. einen Kommentar zu hinterlassen. Hier wäre es gut, wenn
            du kurz beschreibst das du geändert hast ggf. warum. Ich werde dann
            vom System benachrichtigt, und gebe dir zeitnahe eine Rückmeldung,
            ob ich deine Änderungen übernommen habe, und wenn nicht, warum ich
            sie nicht übernommen habe.''' )      
        _text.addContent ( _p_8 )    
   
        _p_9 = HtmlTemplate.Tag ( "p" )                    
        
        _p_9.addContent ( u'''<b>B) Per E-Mail:</b> Wem der erste Weg noch zu
            anspruchsvoll ist, der kann mir auch einfach eine Mail schicken mit
            dem Link zu seiner Arbeitskopie. Ich werde mir dann die Änderungen
            gerne ansehen und dann auch übernehmen.''' )      
        _text.addContent ( _p_9 )    
        
        _p_10 = HtmlTemplate.Tag ( "p" )         
        
        _p_10.addContent ( u'''Nach dem ich eure Änderung in meinen Hauptzweig
            eingepflegt habe, stehen sie auch allen Anderen zur Verführung und
            natürlich auf dieser Website. Sollte noch irgend etwas unklar 
            geblieben sein, dann scheut euch nicht, mich anzuschreiben: ''')       
        _text.addContent ( _p_10 )              
        
        _mail = HtmlTemplate.Tag ( "a" )
        _mail.setAttribute ( "href", "mailto:briefkasten@olaf-radicke.de" )
        _mail.addContent ( u'briefkasten@olaf-radicke.de' )       
        _text.addContent ( _mail )
        
        
        _floatleft.addContent ( _text)          
        
        # ##############  pic part #############################################
        
        _pics = HtmlTemplate.Tag ( "div" )
        _pics.setAttribute ( "class", "col" )
        
        # bild 1
        
        _p_1 = HtmlTemplate.Tag ( "p" )
        
        _link_img1 = HtmlTemplate.Tag ( "a" )
        _link_img1.setAttribute ( "href" , "static/01_create_account.png" )       
        
        _img_01 = HtmlTemplate.TagSingle ( "img" )
        _img_01.setAttribute ( "class", "participate_img" )
        _img_01.setAttribute ( "src", "static/01_create_account.png" )
        _img_01.setAttribute ( "alt", "Accound erstellen bei gitHub" )
        _link_img1.addContent ( _img_01 ) 
        #_p_1.addContent ( _link_img1 )    
        _pics.addContent ( _link_img1) 
        
        # bild 2
        
        _link_img2 = HtmlTemplate.Tag ( "a" )
        _link_img2.setAttribute ( "href" , "static/02_fork_project.png" )       
        
        _img_02 = HtmlTemplate.TagSingle ( "img" )
        _img_02.setAttribute ( "class", "participate_img" )
        _img_02.setAttribute ( "src", "static/02_fork_project.png" )
        _img_02.setAttribute ( "alt", "Arbeitskopie anlegen" )
        _link_img2.addContent ( _img_02 ) 
        _pics.addContent ( _link_img2 )           
        
        
        # bild 4
        
        _link_img4 = HtmlTemplate.Tag ( "a" )
        _link_img4.setAttribute ( "href" , "static/04_edit_file.png" )       
        
        _img_04 = HtmlTemplate.TagSingle ( "img" )
        _img_04.setAttribute ( "class", "participate_img" )
        _img_04.setAttribute ( "src", "static/04_edit_file.png" )
        _img_04.setAttribute ( "alt", "Arbeitskopie anlegen" )
        _link_img4.addContent ( _img_04 )   
        _pics.addContent ( _link_img4 )           
        
         # bild 5
        
        _link_img5 = HtmlTemplate.Tag ( "a" )
        _link_img5.setAttribute ( "href" , "static/05_pull_request.png" )       
        
        _img_05 = HtmlTemplate.TagSingle ( "img" )
        _img_05.setAttribute ( "class", "participate_img" )
        _img_05.setAttribute ( "src", "static/05_pull_request.png" )
        _img_05.setAttribute ( "alt", "pull request" )
        _link_img5.addContent ( _img_05 ) 
        _pics.addContent ( _link_img5 )             
       
        _floatleft.addContent ( _pics ) 
        _appbox.addContent ( _floatleft )          
        
        # ######################################################################

        htmlcode += self.htemp.getCompleteSite( "participate", _appbox )
        #return self.htemp.convertGermanChar( htmlcode )
        #print htmlcode
        return htmlcode