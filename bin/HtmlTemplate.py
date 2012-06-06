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

import string 

class Tag:
    
    ## tag type
    m_type = "div"
    ## tag attributes
    m_attribute = None
    ## content
    m_content = None
    
    ## constructor
    ## @param _type typ of tag as string.
    def __init__ ( self, _type ) :
        self.m_type = _type
        self.m_attribute = dict()
        self.m_content = list()
        
        
    ## set type of tag.
    def setType (self, _type ) :
        self.m_type = _type

    ## add a content 
    def addContent( self, _cont ):
        self.m_content.append ( _cont )
        
    ## add a attribute
    ## @parm _attName name of attribute
    ## @parm _attValue value of attribute
    def setAttribute ( self, _attName, _attValue ) :
        self.m_attribute [_attName] = _attValue
        
    def getHTML ( self ) :
        _outString = u''
        _outString += u'<' + self.m_type 
        for _key in self.m_attribute.keys() :
            _outString += u' ' + _key + u'="' + self.m_attribute [ _key ] + u'" '
        _outString += u'>'
        print "self.self.m_content.count: " + str ( len( self.m_content ) )
        _count = 0
        for _cont in self.m_content :
            _count += 1
            print _count
            if isinstance(_cont, Tag ) :
                _outString += _cont.getHTML ()
                #_outString += "..."
            else:
                _outString += _cont
        _outString += u'<' + self.m_type + u'>'
        return _outString


class HtmlTemplate:
    
    #  convert german characters
    def convertGermanChar(self, _input ) :
        string.replace( _input, u"ä", "&auml;")
        string.replace( _input, u"Ä", "&Auml;")
        string.replace( _input, u"ö", "&ouml;")
        string.replace( _input, u"Ö", "&Ouml;")
        string.replace( _input, u"ü", "&uuml;")
        string.replace( _input, u"Ü", "&Uuml;")
        string.replace( _input, u"ß", "&szlig;")
        return _input
        
    
    def top(self, aktivtab):
        top =     u'<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"'
        top +=    '       "http://www.w3.org/TR/html4/loose.dtd">'
        top +=    '<html>'
        top +=    '  <head>'
        top +=    '    <meta http-equiv="content-type" content="text/html; charset=utf-8" />'
        top +=    '  </head>'
        top +=   u'<body>'
        top +=   u'<link rel="stylesheet" href="static/home.css" type="text/css" media="screen" charset="utf-8" />'
        top +=    '<div class="all">'
        #top +=    '    <div class="line" ></div>'
        top +=    '    <div class="bannerbox" >'
        top +=    u'        <h1>Womit deckt sich dein Glaube?</h1>'
        top +=    '        <h3><i>BELIEF MATCHING</i> (beta)</h3>'
        #top +=    '        <img src="static/image.jpg" >'
        top +=    '    </div>'
        top +=    '    <div class="line" ></div>'
        top +=    '    <div class="mainmenue" >'
        top +=    '           <ul id="portal-globalnav">'
        if ( aktivtab == "home"):
            top +=    '            <li id="tableft_activ"><a href="/">Start</a></li>'
        else:
            top +=    '            <li id="tableft" ><a href="/">Start</a></li>'
        if ( aktivtab == "test"):
            top +=    '            <li id="tabmiddle_activ"><a href="test">Test</a></li>'
        else:
            top +=    '            <li id="tabmiddle"><a href="test">Test</a></li>'
        if ( aktivtab == "datenbasis"):
            top +=    '            <li id="tabright_activ"><a href="datenbasis">Datenbasis</a></li>'
        else:
            top +=    '            <li id="tabright"><a href="datenbasis">Datenbasis</a></li>'
        top +=    '           </ul>'
        top +=    '        </div>'
        top +=    '    <div class="line" ></div>'
        top +=    '    <div class="appbox">'  
        return top
    
    bottom =  '    </div>'
    bottom += '    <div class="footer">'
    bottom += 'BELIEF MATCHING | <a href="https://github.com/OlafRadicke/belief-matching">'
    bottom += 'Auf GitHub</a> | <a href="mailto:briefkasten@olaf-radicke.de">'
    bottom += 'briefkasten@olaf-radicke.de</a>'
    bottom += '    </div>'
    bottom += '</div></body></html>'