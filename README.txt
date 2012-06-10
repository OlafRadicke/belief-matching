belief-matching
===============

Kleines Web-Programm das dem Besucher nach der Prüfung seiner Glaubensgrundsätze eine Glaubensgemeinschaft empfiehlt.

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

    logging

Der Server log die Verbindungen nach  /var/log/belief-maching.logging

TODOs
-----

Konfessionen in die Datenbank einpflegen. Z.B.:

* Evangelisch-lutherische Kirchen
 - Review / Überprüfung steht noch aus
* Konservative Quäker
 - Review / Überprüfung steht noch aus
* Liberale Quäker
 - Review / Überprüfung steht noch aus
* Mennoniten
 - Review / Überprüfung steht noch aus
* Reformierte Kirchen
 - Review / Überprüfung steht noch aus
* Römisch-katholische Kirche
 - Review / Überprüfung steht noch aus
* Zeugen Jehovas
 - Review / Überprüfung steht noch aus
* Röm.-Kath.-Kirche 
 - Review / Überprüfung steht noch aus
 - Kommentare fehlen
* Lutheraner 
 - Review / Überprüfung steht noch aus
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