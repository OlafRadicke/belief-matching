belief-matching
===============

Kleines Web-Programm das dem Besucher nach der Prüfung seiner Glaubensgrundsätze 
eine Glaubensgemeinschaft empfiehlt.

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

* Evangelikale Gemeinden
 - Review / Überprüfung steht noch aus
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
 - Review / Überprüfung steht noch aus
* Methodisten
* Orthodoxe Kirchen
 - Review / Überprüfung steht noch aus
* Pfingstbewegung
* Neuapostolische Kirche
* Christliche Wissenschaft
* Unitarier
* Pietisten
* Altkatholische Kirchen
* Anglikanische Kirchen 
* Siebenten-Tags-Adventisten
 - Review / Überprüfung steht noch aus

== Administration / Leitung ==

J) Aussage: Für Leitungs- und Schulungsaufgaben ist eine formelle theologische
Ausbildung nicht unbedingt erforderlich.

K) Aussage: Frauen können Leitungsaufgaben und geistlichen Ämtern innerhalb der
Gemeinde bekleiden.

== Mission / Ökumene / Außenbeziehung ==

L) Aussage: Ich halte andere Religionen (z. B. Islam, Buddhismus) und z.T. auch
bestimmte christlichen Gemeinschaften für Irrwege. Ich glaube
nicht das eine "Dialog auf Augenhöhe" richtig wäre.
L) Kommentar: Hier ist die Frage, ob man glaubt, das einem die Begegnung mit
anderen Überzeugungen im eigenen Glauben befruchtet. Oder ob sie
vielleicht sogar für gefährlich gehalten werden, wenn sie nicht
mit der Absicht der Missionierung durchgeführt werden..


M) Aussage: Es ist wichtig den eigenen Glauben gegenüber allen nicht- oder
andersgläubigen zu bezeugen und die (biblische) Erlösungsbotschaft
zu verbreiten.