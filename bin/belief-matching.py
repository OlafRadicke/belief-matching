
# -*- coding: utf_8 -*-

import sys
import sqlite3
import web
from web import form

import HtmlTemplate
import index
import belieftest
import datenbasis

urls = (
  '/', 'index.index',
  '/test', 'belieftest.belieftest',
  '/datenbasis','datenbasis.datenbasis')

app = web.application(urls, globals())#, web.reloader)
render = web.template.render('templates/')



htemp = HtmlTemplate.HtmlTemplate()
         


if __name__ == "__main__":
    app.run()
