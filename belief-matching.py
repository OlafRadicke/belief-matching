
# -*- coding: utf_8 -*-


import sys
import sqlite3
import web
from web import form

urls = (
  '/', 'index',
  '/test', 'test',
  '/datenbasis','datenbasis')

app = web.application(urls, globals())#, web.reloader)
render = web.template.render('templates/')

test_form = form.Form( 
    form.Checkbox("yes_or_no", 
                  description="trifft zu", 
                  class_="standard", 
                  value="", 
                  checked=False),                      
    #form.Textbox('source',
                 #form.notnull,
                 ##form.regexp('^-?\d+$', 'Not a number.'),
                 ##form.Validator('Not greater 10.', lambda x: int(x)>10),
                 #description='Enter a source:'),
    form.Button('go')
    )
    


class HtmlTemplate:
    
    def top(self, aktivtab):
    
        top =     u'<link rel="stylesheet" href="static/home.css" type="text/css" media="screen" charset="utf-8"/>'
        top +=    '<div class="all">'
        top +=    '    <div class="bannerbox" >'
        top +=    '        <h1>BELIEF MATCHING - Was gaubst du?</h1>'
        top +=    '        <h3>Und welche Glaubensgemeinschaft passt dazu?</h3>'
        #top +=    '        <img src="static/image.jpg" >'
        top +=    '    </div>'
        top +=    '    <div class="mainmenue" >'
        top +=    '        <div class="line" ></div>'
        top +=    '           <ul id="portal-globalnav">'
        if ( aktivtab == "home"):
            top +=    '            <li id="tableft_activ"><a href="/">Start</a></li>'
        else:
            top +=    '            <li id="tableft" ><a href="/">home</a></li>'
        if ( aktivtab == "test"):
            top +=    '            <li id="tabmiddle_activ"><a href="test">Test</a></li>'
        else:
            top +=    '            <li id="tabmiddle"><a href="test">test</a></li>'
        if ( aktivtab == "datenbasis"):
            top +=    '            <li id="tabright_activ"><a href="datenbasis">datenbasis</a></li>'
        else:
            top +=    '            <li id="tabright"><a href="datenbasis">datenbasis</a></li>'
        top +=    '           </ul>'
        top +=    '        </div>'
        top +=    '    <div class="appbox">'  
        return top
    
    bottom =  '    </div>'
    bottom += '    <div class="footer">'
    bottom += 'BELIEF MATCHING | <a href="https://github.com/OlafRadicke/belief-matching">'
    bottom += 'Auf GitHub</a> | <a href="mailto:briefkasten@olaf-radicke.de">'
    bottom += 'briefkasten@olaf-radicke.de</a>'
    bottom += '    <div>'
    bottom += '<div>'


htemp = HtmlTemplate()



class index:
    
       def GET(self):
        
        htmlcode = htemp.top("home")
        htmlcode += '        <h2>Willkommen auf dem BELIEF MATCHING</h2>'
        htmlcode += 'Ein Tool um herauszufinden mit welchen Glaubensgemeinschaften '
        htmlcode += u'deine eigene Überzeugeng am meisten übereinstimmt.'
        htmlcode += htemp.bottom
        return htmlcode 

class test:
 
    def GET(self):
        _form = test_form()
        #return render.index(my_form)
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute("SELECT question_id, kat, question FROM questions order by kat;")
        
        htmlcode = htemp.top("test") 
        htmlcode += '        <h2>Test</h2>'
        htmlcode += '          <form method="POST" name="test">'      
        htmlcode += '            <table>'
        htmlcode += '              <tr>'
        htmlcode += '                <th>Kategorie</th>'
        htmlcode += u'                <th>&Uuml;berzeugnung</th>'
        htmlcode += '                <th>Trift zu</th>'
        htmlcode += '                <th>Gewichtung</th>'
        htmlcode += '              </tr>'
        for row in cur:
            print row
            htmlcode += '          <tr>'
            htmlcode += '            <td>' + row[1] + '</td>'
            htmlcode += u'            <td>' + unicode(row[2]) + '</td>'
            htmlcode += '            <td>Trift zu:<input type="checkbox" name="question-' + str(row[0]) \
                + '" value="question-' + str(row[0]) + '" /></td>'
            htmlcode += '            <td><select name="' + str(row[0]) + '-wichtung" size="1">'
            htmlcode += '                  <option value="1">mittel</option>'
            htmlcode += '                  <option value="2">sehr wichtig</option>'
            htmlcode += '                  <option value="0">unwichtig</option>'
            htmlcode += '                </select>'
            htmlcode += '            </td>'
            htmlcode += '          </tr>'  
        htmlcode += '           </table>'
        htmlcode += form.Button('go').render()
        htmlcode += '            </form>'
        htmlcode += htemp.bottom
        return htmlcode  
        
    def POST(self): 
        #_form = test_form() 

        #hiltirepo = _form['source'].value
        #yes_or_no = _form['yes_or_no'].value
        #print "value:" + yes_or_no
        #searchTerms = web.input()
        
        htmlcode = htemp.top("test")
        htmlcode += '        <h2>Ergebnis</h2>'
        
        widgetlist = web.input(groups = []) 
        print "widgetlist: " 
        print  widgetlist
        for i in range(1, 6):  
            if "question-" + str(i) in widgetlist: 
                htmlcode += 'YES' + str(i) + '<br>'
            else:
                htmlcode += 'NO' + str(i) + '<br>'
            htmlcode += 'WICHTUNG: ' + widgetlist[ str(i) + '-wichtung'] + '<br>'
                
            #str(i) + "-wichtung"
                #-wichtung
                #htmlcode += 'YES' + str(i) + '<br>'
            #else:
                #htmlcode += 'NO' + str(i) + '<br>'
                
        htmlcode += htemp.bottom
        return htmlcode        
         
class datenbasis:      

    def getIntro(self):
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute("SELECT denomination_id, denomination FROM denominations ORDER BY denomination;")
        intro = u'        <h2>Basisdaten des Test</h2>'
        intro += u'Hier kannst du sehen, welche Glaubensgemeinschaften in der Datenbank erfasst sind,'
        intro += u'und mit welchen &Uuml;berzeugungen. Gut m&ouml;glich das du einen Fehler entdeckst,'
        intro += u'oder du noch Daten &uuml;ber eine noch fehlende Glaubensgemeinschaft hinterlegen willst.'
        intro += u'Dann nimmt mit mir Kontakt auf: <a href="mailto:briefkasten@olaf-radicke.de">'
        intro += u'briefkasten@olaf-radicke.de</a> <br>'
        intro += u'          <form method="POST" name="test">'   
        intro += u'Glaubensgemeinschaft:'   
        intro += u'            <select name="glaubensgemeinschaft" size="1">'
        for row in cur:
            print row    
            intro += u'              <option value="' + str(row[0]) + '">' + row[0] + '</option>'
        intro += u'            </select>'
        intro += form.Button('anzeigen').render()
        intro += u'          </form>'
        conn.close()
        return intro

    def GET(self):
        widgetlist = web.input(groups = []) 
        print "widgetlist: " 
        print  widgetlist
        #for i in range(1, 6):  
            #if str(i) in widgetlist: 
                #htmlcode += 'YES' + str(i) + '<br>'
            #else:
                #htmlcode += 'NO' + str(i) + '<br>'
            #htmlcode += 'WICHTUNG: ' + widgetlist[ str(i) + '-wichtung'] + '<br>'
            
        id = 1
        sqlcommand = "SELECT questions.question, weightings.description "
        sqlcommand += " FROM answers, questions, weightings "
        sqlcommand += " WHERE answers.denomination_id = "  + str(id )
        sqlcommand += " AND answers.question_id = questions.question_id"
        sqlcommand += " AND answers.weighting_nr = weightings.weighting_nr"
        sqlcommand += " ORDER BY questions.kat, questions.question;"
        print "sql: " + sqlcommand
        conn = sqlite3.connect('belief-matching.sqlite')
        cur = conn.cursor()
        cur.execute ( sqlcommand )
        
        htmlcode = htemp.top("datenbasis") 
        htmlcode += self.getIntro()
        
        htmlcode += htemp.bottom
        return htmlcode  
        
    def POST(self): 
    
        #_form = test_form() 

        #hiltirepo = _form['source'].value
        #yes_or_no = _form['yes_or_no'].value
        #print "value:" + yes_or_no
        #searchTerms = web.input()
        
        htmlcode = htemp.top("datenbasis")
        htmlcode += '        <h2>Datenbasis</h2>'
        
        widgetlist = web.input(groups = []) 
        print "widgetlist: " 
        print  widgetlist
        for i in range(1, 6):  
            if str(i) in widgetlist: 
                htmlcode += 'YES' + str(i) + '<br>'
            else:
                htmlcode += 'NO' + str(i) + '<br>'
            htmlcode += 'WICHTUNG: ' + widgetlist[ str(i) + '-wichtung'] + '<br>'
                
            #str(i) + "-wichtung"
                #-wichtung
                #htmlcode += 'YES' + str(i) + '<br>'
            #else:
                #htmlcode += 'NO' + str(i) + '<br>'
                
        htmlcode += htemp.bottom
        return htmlcode           

if __name__ == "__main__":
    app.run()
