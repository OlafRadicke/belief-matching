BEGIN;


-- ###########################################################################
-- #################### insert denomination_answers #######################################
-- ###########################################################################

-- ===================== Konservative Quaker =================================


-- ################ Eindeutige ID für Konfession setzen #####################
INSERT INTO denominations ( denomination_id, denomination, url ) VALUES (
7,
"Reformierte Kirchen",
"http://de.wikipedia.org/wiki/Reformierte_Kirche");

-- ################  Frage mit Konfession verknüpfen. #######################
-- 0 = Trifft nicht zu
-- 1 = Trifft zu
-- 2 = Persönliche Entscheidung
-- 3 = Keine Meinung

-- ======= kat "Gott" beginnend mit 11... ====================================
-- "Ich glaube an die Dreifaltigkeit"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 111, 7, 1, 
"Es wird die Lehre der Dreifaltigkeit vertreten.");

-- "Jesus ist nicht Gott sondern nur ein (besonderer) Mensch"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 112, 7, 0, 
"Nein er ist Teil der Dreifaltigkeit.");

-- "Gott offenbart sich direkt jedem Menschen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 113, 7, 0, 
"Nein. Der persönliche Offenbarung wird keine große Rolle beigemessen.");

--"Gott offenbart sich durch die Bibel."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 114, 7, 1, 
"Die Bibel ist die einzige Grundlage für das theologische Urteilen oder Verurteilen. 
 Das Alte und das Neue Testament werden gleichermaßen betont.");

-- "Gottes offenbart sich nur bestimmten Menschen (Propheten) und diese dienen 
-- haben die Aufgabe den Anderen Gotteswillen zu verkünden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 115, 7, 0, 
"Dem Prophetisch wird keine große Bedeutung zugeschrieben.");

-- ======== Kat "Taufe" beginnend mit 12... ==================================
-- "Die Taufe (mit Wasser/liturgisch) ist Voraussetzung für die 
-- Erlösung/Errettung"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 121, 7, 1, 
"Die Taufe ist <i>heilig</i> also ein Sakrament und Voraussetzung für die Errettung");

-- "Die Taufe wird äußerlich durch Wasser vollzogen"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 122, 7, 1, "Ja, aber nicht durch untertauchen.");

-- "Ich lehne Kindertaufe ab"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 123, 7, 0, "Die Kindertaufe ist sehr gebräuchlich und die Regel.");

-- ============ Kat Abendmahl beginnend mit 13... ============================

-- "Bei dem Abendmahl findet eine Umwandlung des Brotes in den Leib Christi statt"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 131, 7, 0, "In reformierten Kirchen wird das Abendmahl als reines 
 Gedächtnismahl verstanden.");

-- "Zum Abendmahl sollten nur Mitglieder der eigenen Konfession zugelassen sein"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 132, 7, 0, "Die reformierten Kirchen der Schweiz lassen Kinder zu. In
 der Regel ist zugelassen, wer an Jesus Christus glaubt.");

-- "Zum Abendmahl sollten nur wer getauft ist zugelassen werden"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 133, 7, 0, "Die Taufe ist in der Regel nicht das Kriterium.");

-- "Dem Abendmahl messe ich keine Bedeutung zu."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 134, 7, 1, "Die Abendmalfeier hat keinen so großen Stellenwert wie bei
 Lutheranern oder Katholiken beigemessen.");

-- "Das Abendmahl ist heilig (ein Sakrament)."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 135, 7, 1, "Ja, wie in den meisten protestantischen Kirchen 
 erkennen die Kirchen der reformierten Tradition mit Taufe und Abendmahl zwei 
 Sakramente an. (Wikipedia)");

-- ======================= Bibel beginnend mit 14... =========================
-- "Als <i>Bibeltreu</i> kann sich nur jemand bezeichnen, der ich die Bibel 
-- wortwörtlich nimmt."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 141, 7, 0, 
"Die Bibel ist sehr wichtig, aber sie wird in der Regel nicht Wort-wörtlich ausgelegt.");

-- "Ich akzeptiere nur die Bibel als Grundlage des Glaubens und als alleiniger 
-- Maßstab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 142, 7, 1, 
"Ja: <i>sola scriptura</i>!");

-- "Für mich gibt es noch über den Bibelkanon hinaus Bücher 
-- die von Gott inspiriert sind."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 143, 7, 0, 
"");

-- "Die Bibel bedarf immer einer Auslegung. Dabei muss der historische Kontext 
-- beachtet werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 144, 7, 1,
"Die wissenschaftliche Betrachtung (historisch-kritisch) wird in der Regel propagiert.");

-- "Die Bibel bedarf immer einer Auslegung. Dabei muss man sich dem Geist der 
-- Bibel öffnen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 145, 7, 0, 
"Die Notwendigkeit einer Auslegung wird zwar bejaht, aber aus einer wissenschaftlichen
 (historisch-kritischen) Perspektive. Das Konzept - <i>Geist der Bibel</i> - ist
 dem er fremd.");

-- "Ich glaube, dass die Welt in 7 Tagen erschaffen wurde und nicht älter 
-- ist als 10.000 Jahre."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 146, 7, 0, 
"Nein, das widerspricht dem Stand der Wissenschaft. Auch wenn auf dem Grundsatz 
 <i>sola scriptura</i> viel Wert gelegt wird.");

-- "Ich glaube an eine von Gott gesteuerte Evolution."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 147, 7, 1, 
"Ja, Gott wir eine Bedeutung für die Schöpfung/Evolution beigemessen.");

-- ==================== Kat Gemeinde beginnend mit 15... =====================

-- "Ich glaube an das Priestertum Aller und will das die Gemeinde von Allen 
-- gemeinsam geleitet wird (demokratische Abstimmungenen oder ähnliches).")."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 151, 7, 1, 
"I den reformierten Gemeinden werden die Ämter von der Gemeinde gewählt/vergeben.");

-- "Mir ist wichtig, das eine Gemeinde autonom ist."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 152, 7, 1, 
"Die Gemeinden sind weitestgehend selbständig, auch wenn sie überregional vernetzt
 und organisiert sind.");

-- "Ich glaube ein Gottesdienst sollte von Priestern (oder Hauptamtlichen) 
-- geleitet werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 153, 7, 1, "Liturgische Handlungen werden in aller
 Regel von Priestern durchgeführt auch wen das <i>Priestertum Aller</i> stärker
 als bei den Lutheranern betont wird..");

-- "Bei (wiederholten) Verfehlungen sollten (uneinsichtige) Mitglied auch aus 
-- der Gemeinde ausgeschlossen werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 154, 7, 0, "Sehr unwahrscheinlich");

-- "Frauen sollen alle Aufgabe in der Gemeinde (einschließlich das 
-- Predigen) übernehmen können."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 155, 7, 1, "Frauen können alle Ämter bekleiden.");

-- "Zu den Pflichten in der Gemeinde gehört auch das man 
-- regelmäßig in Erscheinung tritt und sich aktiv einbringt."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 156, 7, 0, "Die meisten Mitglieder gehen selten bis gar nicht zum
 Gottesdienst oder beteiligen sich nicht am Gemeinde Leben. Oft werden nur die wichtigen
 Veranstaltungen wahrgenommen: Taufe, Heirat, Weihnachten und Beerdigung...");

-- "Die Gemeinde sollte von den Ältesten und/oder Predigern und/oder 
-- Diakonen geleitete werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 157, 7, 0, "Die Gemeinden werden von Hauptamtlichen (Pfarrern) geleitet
 bzw. betreut.");

-- "Die Gemeindeleitung sollte von einer Höheren Instanz bestimmt werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 158, 7, 0, "Nein, die Gemeinden entscheiden selbst über ihre Ämterbesetzungen.");

-- ==================== Kat. Sexualität beginnend mit 16... ===================
-- "Sex vor der Ehe lehene ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 161, 7, 3, "Die Frage ist de facto bedeutungslos und Privatangelegenheit
 der Mitglieder.");

-- "Die Ehe ist heilig."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 162, 7, 0, "Die Trauung wird in protestantischen Kirchen nicht als 
 Sakrament angesehen, gleichwohl wird nach den meisten agendarischen Vorgaben und 
 landeskirchlichen Ordnungen ein gegenseitiges, vor Gott und der Gemeinde bezeugtes 
 Versprechen abgenommen. (Quelle: http://de.wikipedia.org/wiki/Kirchliche_Trauung#Protestantische_Kirchen)");

-- "Erneutes heiraten nach einer Scheidung lehne ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 163, 7, 0, "Eine erneute Heirat ist möglich");

-- "Gleichgeschlechtliche Ehen lehne ich ab."); 
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 164, 7, 2, "Homosexuelle Paare können seid einiger Zeit getraut werden.
 (Quelle: http://de.wikipedia.org/wiki/Kirchliche_Trauung#Protestantische_Kirchen)");

-- "Ich halte (gelebte) Homosexualität für eine Sünde.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 165, 7, 0, "");

-- "Schwangerschaftsverhütung lehne ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 166, 7, 3, "Nein, das ist die Privatentscheidung der Mitglieder.");

-- "Schwangerschaftsabbrüche lehne ich kategorisch ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 167, 7, 3, "Nein, das ist die Privatentscheidung der Mitglieder.");

-- ============================= Kat. Gottesdienst beginnend mit 17... =======
-- "Ein Gottesdienst muss ein bestimmten Ablauf (Liturgie) folgen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 171, 7, 1, "Die Liturgie ist sehr sparsam aber vorhanden..");

-- "Stille und Besinnung sind mir auch im Gottesdienst sehr wichtig."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 173, 7, 0, "Keine Bedeutung");

-- "Mir ist wichtig das Musik (Worship) modern ist, berührt und 
-- mitreißt."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 173, 7, 0, "Keine zentrale Bedeutung. Oft konservative Musik.");

-- "Freies Gebet im Gottesdienst ist für mich Zeichen von lebendigen und 
-- authentischem Glauben."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 175, 7, 0, "Keine zentrale Bedeutung.");

-- "In <i>Zungenreden</i> ist für mich ein Zeichen der Gnadengabe des 
-- Heiligen Geistes."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 176, 7, 0, "");

-- ====================== Kat. Erlösung beginnend mit 18... ==================
-- "Ich glaube das für jeden Menschen kommt eine Zeit, wo er von Gott 
-- gerichtet wird."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 181, 7, 0, "Bedingt, durch die Prädestinationslehre ist der Mensch 
 in gewisser Hinsicht schon <i>gerichtet</i>");

-- "Ich glaube es gibt eine Hölle mit ewiger Verdammnis."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 182, 7, 1, "");

-- "Menschen können auch noch nach ihrem Tod Busse tun um der Verdammnis
-- zu entgehen (Fegefeuer)."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 183, 7, 0, "");

-- "Auf die Erlösung hat man keinen Einfluss, Sie wird einem durch die 
-- Gnade Gottes zu Teil."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 184, 7, 1, "Wesentliches Charakteristikum reformierter Theologie ist ferner 
 die starke Betonung der Prädestinationslehre, des Gedankens einer Erwählung der 
 zum Heil (bzw. zur Verdammnis) bestimmten Menschen durch Gott ohne die Möglichkeit 
 der Beeinflussung durch den Menschen. (Quelle: http://de.wikipedia.org/wiki/Reformierte_Kirche)");

-- "Wirtschaftlicher Erfolg ist ein Zeichen das man in der Gnade Gottes steht."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 185, 7, 1, "Es gibt eine gewisse Verwandtschaft mit dem <i>Wohlstandsevangelium</i> 
 dadurch das Askese gelehrt und in diesem Sinne unternehmerischer Erfolg im 
 reformiert-puritanischen Kapitalismus als Belohnung für Verzicht und Entsagung 
 aufgefasst wird. Ist aber in Deutschsprachigen Raum nicht mehr so ausgeprägt. 
 (Quelle: http://de.wikipedia.org/wiki/Wohlstandsevangelium)");

-- "Leid ist eine Strafe Gottes.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 186, 7, 1, "Teilweise ist die Lehre von der Prädestination anzutreffen, 
 um zu erklären, warum auch Christen, die augenscheinlich ihr Leben richtig führen, 
 den materiellen Segen nicht erlangen. (Quelle: http://de.wikipedia.org/wiki/Wohlstandsevangelium)");

-- "Es kann nur eine Wahrheit geben und deshalb nur ein Weg zur Erlösung 
-- führen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 187, 7, 0, "Anderen Gemeinschaften wird nicht grundsätzlich abgesprochen
 das sie erlöst werden könnten. Es gibt aber Glaubensgemeinschaften (die 
 <i>Friedenskirchen</i>) die im <i>Confessio Augustana</i> verdammt werden. ");

-- "Das Reich Gottes ist schon da. Es ist aber (noch) nicht (für alle) 
-- sichtbar."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 188, 7, 0, "Nein, die lutherische <i>Zwei-Reiche-Lehre</i> wird in reformierten 
 Kirchen nicht gelehrt. (Quelle: http://de.wikipedia.org/wiki/Reformierte_Kirche#Merkmale)");

-- "Eine Erlösung ist schon im Diesseits möglich."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 189, 7, 0, "");

-- ========================= Kat. Sonstiges beginnend mit 19... ==============
-- "Politische Aktivitäten oder Themen haben in der Gemeinde keinen 
-- Platz."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 191, 7, 1, "Wird als meist als Privatangelegenheit der Mitglieder verstanden.
 gelegentlich gibt es aber politische Aussagen.");

-- "Soziales Engagement (in der Welt) sind existenzieller 
-- Bestandteil des Evangeliums."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 192, 7, 0, "Dem Thema wird keine große Bedeutung beigemessen. Bedingt
 durch die Prädestinationslehre");

-- "Der Missionsauftrag ist ein wichtiger Bestandteil des Evangeliums."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 193, 7, 0, "");

-- "Ich glaube an Geistheilung."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 194, 7, 0, "");

-- "Kino, Theater, Konzerte und andere Künste bergen immer die Gefahr von 
-- wichtigen Dingen abgelenkt zu werden.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 195, 7, 1, "Besonders in der Vergangenheit wurde das einfache und schmucklose
 Leben propagiert.");

-- "Alkohol und andere Drogen versperren den Weg zu spiritueller Entwicklung."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 196, 7, 3, "");

-- "Gläubige Menschen sollten sich von Weltlichen Dingen/Gesellschaft
--  fern halten."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 197, 7, 2, "Für die Vergangenheit hat ds auf alle Fälle gegolten. Heute 
 wenn dann nur noch in abgeschwächter Form und individuell.");

-- "In Heilgenbilder und -Skulpturen kann ich Halt und Trost finden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 198, 7, 0, "Die Reformierten sind betont puritanisch und die Kirchen
 sehr schlicht gehalten.");

-- "Wehrdienst lehne ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 199, 7, 0, "Nein, gewiss nicht. Gerade in den Anfängen in den Amerikanischen
 Kolonien sind Puritanischer wiederholt durch ihren Blutrausch aufgefallen. Auch
 Heute tun Sie sich nicht durch eine besonders pazifistische Haltung hervor.");

-- "Ich schwöre nicht und lege keine Eide ab.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 1910, 7, 0, "");


COMMIT;