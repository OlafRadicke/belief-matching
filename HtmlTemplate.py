

class HtmlTemplate:
    
    def top(self, aktivtab):
    
        top =     u'<link rel="stylesheet" href="static/home.css" type="text/css" media="screen" charset="utf-8"/>'
        top +=    '<div class="all">'
        #top +=    '    <div class="line" ></div>'
        top +=    '    <div class="bannerbox" >'
        top +=    '        <h1>Mit was deckt sich dein Glaube?</h1>'
        top +=    '        <h3>BELIEF MATCHING (beta)</h3>'
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
    bottom += '    <div>'
    bottom += '<div>'