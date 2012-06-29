
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

import sqlite3
import os.path
import datetime

class VisitLog:
    
    #logDir = '/var/belief-matching/'
    logFileDB = '/var/belief-matching/visits-log.sqlite'

    ## get back descriptions of answers
    def write ( self, _ip, _function ):
        if os.path.isfile ( self.logFileDB ) != True :
            self.createDB ()
            
        _date = datetime.datetime.date ( datetime.datetime.now() )
        _year = unicode ( _date.year )
        _month =  unicode ( _date.month ) 
        _day = unicode ( _date.day )
            
        _conn = sqlite3.connect ( self.logFileDB )
        _cur = _conn.cursor()
        _cur.execute( ''' 
            INSERT INTO  visits ( visiter_ip, year, month, day, use_funkction ) VALUES (
                ?, 
                ?,   
                ?, 
                ?,  
                ?) ; ''', ( ( _ip, _year, _month, _day, _function )) )
        _conn.commit()  
        _conn.close()    
        
    def createDB ( self ):
        #os.path.exists ( self.logDir )
        
        _conn = sqlite3.connect ( self.logFileDB )
        _cur = _conn.cursor()
        _cur.execute( ''' 
            CREATE TABLE visits (
                visit_id         INTEGER PRIMARY KEY NOT NULL,
                visiter_ip       TEXT    NOT NULL,
                year TEXT        TEXT    NOT NULL,
                month TEXT       TEXT    NOT NULL,
                day TEXT         TEXT    NOT NULL,
                use_funkction    TEXT    NOT NULL
            ); ''' )
        _conn.close()    
        
    