
# -*- coding: utf_8 -*-

import HtmlTemplate

class index:
    
    htemp = HtmlTemplate.HtmlTemplate()
    
    def GET(self):
        htmlcode = self.htemp.top("home")
        htmlcode += '        <h2>Willkommen auf dem BELIEF MATCHING</h2>'
        htmlcode += 'Ein Tool um herauszufinden mit welchen Glaubensgemeinschaften '
        htmlcode += u'deine eigene &Uuml;berzeugeng am meisten &uuml;bereinstimmt.'
        htmlcode += self.htemp.bottom
        return htmlcode 