
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