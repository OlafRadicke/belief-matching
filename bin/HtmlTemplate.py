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
import SQLBackend


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
        if isinstance(_cont, Tag ) :
            self.m_content.append ( _cont )
            #_outString += "..."
        elif isinstance(_cont, TagSingle ) :
            self.m_content.append ( _cont )
        else:
            self.m_content.append ( _cont + u'' )
        
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
        _outString += u'>\n'
        for _cont in self.m_content :
            if isinstance(_cont, Tag ) :
                _outString += _cont.getHTML ()
                #_outString += "..."
            elif isinstance(_cont, TagSingle ) :
                _outString += _cont.getHTML ()
            else:
                _outString += _cont

        _outString += u'</' + self.m_type + u'>\n'
        return _outString


class TagSingle:
    
    ## tag type
    m_type = "div"
    ## tag attributes
    m_attribute = None
    
    ## constructor
    ## @param _type typ of tag as string.
    def __init__ ( self, _type ) :
        self.m_type = _type
        self.m_attribute = dict()
        
        
    ## set type of tag.
    def setType (self, _type ) :
        self.m_type = _type
        
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
        _outString += u' >\n'
        return _outString
        
        

class TagSingleXHTML:
    
    ## tag type
    m_type = "div"
    ## tag attributes
    m_attribute = None
    
    ## constructor
    ## @param _type typ of tag as string.
    def __init__ ( self, _type ) :
        self.m_type = _type
        self.m_attribute = dict()
        
        
    ## set type of tag.
    def setType (self, _type ) :
        self.m_type = _type
        
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
        _outString += u' />\n'
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
        
    
    def getCompleteSite(self, aktivtab, _appBoxValue ):
        _sqlBackend = SQLBackend.SQLBackend()
        
        _htmlTag = Tag ( "html" )
        _head = Tag ( "head" )
        
        # css
        _link = TagSingle ( "link" )
        _link.setAttribute ( "rel", "stylesheet" )
        _link.setAttribute ( "href", "static/home.css" )
        _link.setAttribute ( "type", "text/css" )
        #_link.setAttribute ( "charset", "utf-8" )
        _head.addContent ( _link )
        
        _title = Tag ( "title" )
        _title.addContent ( u'belief-matching' )
        _head.addContent ( _title )
        
        _charset = TagSingle ( "meta" )
        _charset.setAttribute ( "http-equiv", "content-type" )
        _charset.setAttribute ( "content", "text/html;  charset=utf-8" )
        _head.addContent ( _charset )
        
        #<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
        _link_2 = TagSingle ( "link" )
        _link_2.setAttribute ( "rel", "shortcut icon" )
        _link_2.setAttribute ( "href", "static/favicon.ppm" )
        _link_2.setAttribute ( "type", "image/x-icon" )
        _head.addContent ( _link_2 )
        
        _htmlTag.addContent ( _head )
        
        _body = Tag ( "body" )
        

        
        _all = Tag ( "div" )
        _all.setAttribute ( "class", "all" )
        
        _bannerbox = Tag ( "div" )
        _bannerbox.setAttribute ( "class", "bannerbox" )
        
        _h1 = Tag ( "h1" )
        _h1.addContent ( u'Womit deckt sich dein Glaube?' )
        _bannerbox.addContent ( _h1 )
        
        _h3 = Tag ( "h3" )
        _h3.addContent ( u'<i>BELIEF MATCHING</i> (beta)' )
        _bannerbox.addContent ( _h3 )
        
        _bannerbox.addContent ( u'Letztes Update: ' )
        _bannerbox.addContent ( _sqlBackend.getDateOfLastUpdate() )
        
        _all.addContent ( _bannerbox )

        _line = Tag ( "div" )
        _line.setAttribute ( "class", "small_line" )
        _all.addContent ( _line )
        
        _line = Tag ( "div" )
        _line.setAttribute ( "class", "line" )
        _all.addContent ( _line )

        _menu = Tag ( "div" )
        _menu.setAttribute ( "class", "mainmenue" )
        
        _liste = Tag ( "ul" )
        _liste.setAttribute ( "id", "portal-globalnav" )
        
        # ######### menu begin ###########################################
        _item_home = Tag ( "li" )
        if ( aktivtab == "home"):
            _item_home.setAttribute ( "class", "tableft_activ" )
        else:
            _item_home.setAttribute ( "class", "tableft" )
        _item_home.addContent ( u'<a href="/">Start</a>' )
        _liste.addContent ( _item_home )
        
        # test
        _item_test = Tag ( "li" )
        if ( aktivtab == "test"):
            _item_test.setAttribute ( "class", "tabmiddle_activ" )
        else:
            _item_test.setAttribute ( "class", "tabmiddle" )
        _item_test.addContent ( u'<a href="test">Test</a>' )
        _liste.addContent ( _item_test )
            
        # database
        _item_database = Tag ( "li" )
        if ( aktivtab == "datenbasis"):
            _item_database.setAttribute ( "class", "tabmiddle_activ" )
        else:
            _item_database.setAttribute ( "class", "tabmiddle" )
        _item_database.addContent ( u'<a href="databaseview">Datenbasis</a>' )
        _liste.addContent ( _item_database )
        
        # participate

        _item_database = Tag ( "li" )
        if ( aktivtab == "participate"):
            _item_database.setAttribute ( "class", "tabmiddle_activ" )
        else:
            _item_database.setAttribute ( "class", "tabmiddle" )
        _item_database.addContent ( u'<a href="participate">Mitmachen</a>' )
        _liste.addContent ( _item_database )        
        
        # sqlgenerator

        _item_database = Tag ( "li" )
        if ( aktivtab == "sqlgenerator"):
            _item_database.setAttribute ( "class", "tabright_activ" )
        else:
            _item_database.setAttribute ( "class", "tabright" )
        _item_database.addContent ( u'<a href="sqlgenerator">SQL-Generator</a>' )
        _liste.addContent ( _item_database )        
        
        # ############ menu end #############################################
        
        _menu.addContent ( _liste )
        _all.addContent ( _menu )
        
        _line = Tag ( "div" )
        _line.setAttribute ( "class", "line" )
        _all.addContent ( _line )
        
        _line = Tag ( "div" )
        _line.setAttribute ( "class", "small_line" )
        _all.addContent ( _line )
        

        _all.addContent ( _appBoxValue )
        
        _footer = Tag ( "div" )
        _footer.setAttribute ( "class", "footer" )
        _footer.addContent ( u'BELIEF MATCHING | ' )
        
        _gitHub = Tag ( "a" )
        _gitHub.setAttribute ( "href", "https://github.com/OlafRadicke/belief-matching" )
        _gitHub.addContent ( u'Auf GitHub' )
        _footer.addContent ( _gitHub )
        
        _footer.addContent ( u' | ' )
        
        _mail = Tag ( "a" )
        _mail.setAttribute ( "href", "mailto:briefkasten@olaf-radicke.de" )
        _mail.addContent ( u'briefkasten@olaf-radicke.de' )
        _footer.addContent ( _mail )
        _all.addContent ( _footer )
        
        _body.addContent ( _all )
        _htmlTag.addContent ( _body )
        
        _htmlcode = u'<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">'
        _htmlcode +=  _htmlTag.getHTML ()
        return _htmlcode
        
        