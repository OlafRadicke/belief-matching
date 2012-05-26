#!/usr/bin/env python
# -*- coding: latin-1 -

import sys
import sqlite3
import web
from web import form

urls = (
  '/', 'index',
  '/test', 'test')

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
    
        top =     '<link rel="stylesheet" href="static/home.css" type="text/css" media="screen" charset="utf-8"/>'
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
            top +=    '            <li id="activ"><a href="/">Start</a></li>'
        else:
            top +=    '            <li><a href="/">home</a></li>'
        if ( aktivtab == "test"):
            top +=    '            <li id="activ"><a href="test">Test</a></li>'
        else:
            top +=    '            <li><a href="test">test</a></li>'
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
        htmlcode += 'deine eigene Überzeugeng am meisten übereinstimmt.'
        htmlcode += htemp.bottom
        return htmlcode 

class test:
 
    def GET(self):
        _form = test_form()
        #return render.index(my_form)
        
        htmlcode = htemp.top("test")
        htmlcode += '        <h2>Test</h2>'
        htmlcode += '            <form method="POST" name="test">'
        #htmlcode += _form.render()
        htmlcode += '<input type="checkbox" name="yes_or_no" value="yes_or_no" /> '
        htmlcode += form.Button('go').render()
        htmlcode += '            </form>'
        htmlcode += htemp.bottom
        return htmlcode       
        
    def POST(self): 
        _form = test_form() 
        if not _form.validates(): 
            htmlcode = htemp.top("test")
            htmlcode += '        <h2>Test</h2>'
            htmlcode += '            <form method="POST" name="test">'
            htmlcode +=  _form.render()
            htmlcode += '            </form>'
            htmlcode += htemp.bottom
            return htmlcode        
        else:
            #hiltirepo = _form['source'].value
            yes_or_no = _form['yes_or_no'].value
            #searchTerms = web.input()
            widgetlist = web.input(groups = []) 
            #print widgetlist["yes_or_no"]
            
            htmlcode = htemp.top("test")
            htmlcode += '        <h2>Ergebnis</h2>'
            #htmlcode +=  "yes_or_no=" + yes_or_no  
            if "yes_or_no" in widgetlist: 
                htmlcode += 'yes_or_no=YES'
            else:
                htmlcode += 'yes_or_no=NO'
            htmlcode += htemp.bottom
            return htmlcode        
         
        
        

if __name__ == "__main__":
    app.run()
