# from http://maestric.com/doc/python/recursive_w3c_html_validator
# Author: Jérôme Jaglale 


import HTMLParser
import urllib
import sys
import urlparse
 
##################################################
# config
 
base_url = 'http://konfessionsvergleich.the-independent-friend.de/'
depth = 100
 
w3c_validator = 'http://validator.w3.org/'
 
##################################################
# classes and functions
 
# HTML parser class
class parseLinks(HTMLParser.HTMLParser):
        def handle_starttag(self, tag, attrs):
                if tag == 'a':
                        for name,value in attrs:
                                if name == 'href':
                                        url = url_normalize(value)
                                        if url != "" and not(l.has_key(url)):
                                                l[url] = True;
 
# HTML parsing function (use the class)
def parse_links(url):
        try:
                lParser = parseLinks()
                lParser.feed(urllib.urlopen(url).read())
                lParser.close()
        except:
                pass
 
# clean/normalize/reject url
def url_normalize(url):
        url= url.strip()
 
        # check it's not an email address
        if url.startswith('mailto:'):
                return ""
 
        # remove any anchor
        url = url.partition('#')[0]
 
        # check it's not an outside-of-the-tree link
        url = urlparse.urljoin(current_url, url)
        if not(url.startswith(base_url)):
                return ""
 
        # check it's an HTML page
        if urllib.urlopen(url).info().gettype() != 'text/html':
                return ""
 
        return url
 
# W3C validation
def url_w3c_validate(url):
        return urllib.urlopen(w3c_validator + 'check?uri=' + url).info().getheader('x-w3c-validator-status') == 'Valid'
 
##################################################
# main
##################################################
l = {base_url: True}
l_error = []
n = 0
for i in range(depth):
        for url in l.copy():
                if l[url]:
                        n += 1
                        current_url = url
                        print n,
                        print "-",
                        print current_url,
 
                        print " parsing...",
                        parse_links(url)
                        print "done -",
 
                        print "validating...",
                        is_valid = url_w3c_validate(url)
                        print "done ->",
                        if is_valid:
                                print "Valid"
                        else:
                                l_error.append(url)
                                print "Invalid"
 
                        l[url] = False
 
#report
print """
-------------------------------------
URLs parsed: %d
URLS with invalid HTML: %d""" % (len(l), len(l_error))
 
for url in l_error:
        print url