
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
import VisitLog

class SQLBackend :

    ## get back descriptions of answers
    def getAnswersDescriptions ( self ):
        _conn = sqlite3.connect('belief-matching.sqlite')
        _cur = _conn.cursor()
        _cur.execute( ''' 
            SELECT     
                answers_nr, 
                user_statement,   
                user_description,
                deno_statement,
                deno_description
            FROM answers; ''' )
        return _cur   
        

    ## get back descriptions of answers
    def getDateOfLastUpdate ( self ):
        _conn = sqlite3.connect('belief-matching.sqlite')
        _cur = _conn.cursor()
        _cur.execute( 'select update_date FROM version;' )
        for _row in _cur :
            return _row [ 0 ]
        
        return u'unbekannt'      

    # Gibt den Namen einer Konfessions-id zurück.
    def getDenominationName ( self, _id ):
        
        denominationName = "unbekannter Name"
        conn = sqlite3.connect( 'belief-matching.sqlite' )
        cur = conn.cursor()
        cur.execute( '''
            SELECT denomination 
            FROM denominations 
            WHERE denomination_id=?;''', (_id , ) )
            
        for row in cur:
             denominationName = row[0]
        conn.close()   
        return denominationName
        
    ## get back a dict with a statistic of visitors
    def getVisitStatistic ( self ) :
        _statList = list ()
        for _year in self.getAllExistYear () :
            for _month in self.getAllExistMonth ( _year ) :
                for _day in self.getAllExistDays ( _year, _month ):
                    #print unicode ( _day ) + u'-' + unicode ( _month ) + u'-' + unicode ( _year )
                    #print self.getCountOfVisiter ( _year, _month, _day )
                    _statDict = dict ()
                    _statDict [ 'date' ] = unicode ( _day ) + u'-' + unicode ( _month ) + u'-' + unicode ( _year )
                    _statDict [ 'visiters' ] = unicode ( self.getCountOfVisiter ( _year, _month, _day ) )
                    _statList.append ( _statDict )
        print  _statList
        return _statList
        
    ## get count of visiter per day.
    def getCountOfVisiter ( self,  _year, _month, _day ):
        _count = 0
        _listOfYears = list ()
        conn = sqlite3.connect( VisitLog.VisitLog.logFileDB )
        cur = conn.cursor()
        cur.execute( '''SELECT COUNT ( DISTINCT  visiter_ip )
            FROM visits
            WHERE year=?
            AND 
            month=? 
            AND
            day=?
            ;''', ( _year, _month, _day  )  ) 
        for _item in cur :
            _count = _item[0]
        conn.close ()
        return _count
        
        
    ## get all existed Years
    def getAllExistYear ( self ) :
        _listOfYears = list ()
        conn = sqlite3.connect( VisitLog.VisitLog.logFileDB )
        cur = conn.cursor()
        cur.execute( '''SELECT DISTINCT year 
            FROM visits
            ORDER BY year;''' ) 
        #cur.commit ()
        for _item in cur :
            _listOfYears.append ( _item[0] )
        conn.close ()
        return _listOfYears
            
    ## get all existing month
    # @param _year the year of selected
    def getAllExistMonth ( self, _year ) :
        _listOfMonth = list ()
        conn = sqlite3.connect( VisitLog.VisitLog.logFileDB )
        cur = conn.cursor()
        cur.execute( '''SELECT DISTINCT month
            FROM visits
            WHERE year=?
            ORDER BY month;''', ( unicode ( _year ), ) ) 
        #_sqlcode = "SELECT DISTINCT month "
        #_sqlcode += " FROM visits"
        #_sqlcode += " WHERE year='" +  _year  + "';"
        #print "_sqlcode: " + _sqlcode
        #cur.execute( _sqlcode ) 
        for _item in cur :
            _listOfMonth.append ( _item[0] )
        conn.close ()
        return _listOfMonth      
        
       
    ## get all existing days
    # @param _year the year of selected
    # @param __month the selected month
    def getAllExistDays ( self, _year, _month ) :
        _listOfDays = list ()
        conn = sqlite3.connect( VisitLog.VisitLog.logFileDB )
        cur = conn.cursor()
        cur.execute( '''SELECT DISTINCT day 
            FROM visits
            WHERE year=?
            AND 
            month=?
            ORDER BY day;''', ( _year, _month ) ) 
        for _item in cur :
            _listOfDays.append ( _item[0] )
        conn.close ()
        return _listOfDays   