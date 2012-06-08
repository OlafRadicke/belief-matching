
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

import sys
import sqlite3
import web
from web import form

import HtmlTemplate
import index
import belieftest
import datenbasis
import participate

urls = (
  '/', 'index.index',
  '/test', 'belieftest.belieftest',
  '/datenbasis','datenbasis.datenbasis',
  '/participate','participate.participate')

app = web.application(urls, globals())#, web.reloader)
render = web.template.render('templates/')



htemp = HtmlTemplate.HtmlTemplate()
         


if __name__ == "__main__":
    app.run()
