belief-matching
===============

Kleines Web-Programm was dem Besucher eine Glaubensgemeinschaft empfiehlt.

Lizenz:
-------

AGPL


Installation:
-------------
    Abhängigkeiten: 
* webpy 
* sqlite3

    Neuinstallation:

Als root den Befehl "make && make install" ausführen und danach mit 
"/etc/init.d/belief-matching start" den Server starten. Danach im Browser unter
"http://localhost/"  aufrufen.

    Update

Server stoppen mit: "/etc/init.d/belief-matching stop" dann im Verzeichnis des
herunter geladenen Programms "make clean && make && make uninstall && make install" 
aufrufen und danach den starten mit: "/etc/init.d/belief-matching start"


TODOs
-----

Konfessionen in die Datenbank einpflegen. Z.B.:

* Röm.-Kath.-Kirche 
 - Review / Überprüfung steht noch aus
 - Kommentare fehlen
* Lutheraner 
 - Review / Überprüfung steht noch aus
* Reformierten/Calvinismus
* Baptisten
* Mormonen
* Methodisten
* Orthodoxe Kirchen
* Pfingstbewegung
* Neuapostolische Kirche
* Christliche Wissenschaft
* Unitarier
* Pietisten
* Altkatholische Kirchen
* Anglikanische Kirchen 