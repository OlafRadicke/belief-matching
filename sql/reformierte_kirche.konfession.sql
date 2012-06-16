BEGIN;


-- ###########################################################################
-- #################### insert denomination_answers ##########################
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

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 111, 7, 1, 
"Es wird die Lehre der Dreifaltigkeit vertreten.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 112, 7, 0, 
"Nein er ist Teil der Dreifaltigkeit.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 113, 7, 0, 
"Nein. Der persönliche Offenbarung wird keine große Rolle beigemessen.");

--"Gott offenbart sich durch die Bibel."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 114, 7, 1, 
"Die Bibel ist die einzige Grundlage für das theologische Urteilen oder Verurteilen. 
 Das Alte und das Neue Testament werden gleichermaßen betont.");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 115, 7, 0, 
"Dem Prophetisch wird keine große Bedeutung zugeschrieben.");

-- ======== Kat "Taufe" beginnend mit 12... ==================================


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 121, 7, 1, 
"Die Taufe ist <i>heilig</i> also ein Sakrament und Voraussetzung für die Errettung");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 122, 7, 1, "Ja, aber nicht durch untertauchen.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 123, 7, 0, "Die Kindertaufe ist sehr gebräuchlich und die Regel.");

-- ============ Kat Abendmahl beginnend mit 13... ============================


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 131, 7, 0, "In reformierten Kirchen wird das Abendmahl als reines 
 Gedächtnismahl verstanden.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 132, 7, 0, "Die reformierten Kirchen der Schweiz lassen Kinder zu. In
 der Regel ist zugelassen, wer an Jesus Christus glaubt.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 133, 7, 0, "Die Taufe ist in der Regel nicht das Kriterium.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 134, 7, 1, "Die Abendmalfeier hat keinen so großen Stellenwert wie bei
 Lutheranern oder Katholiken beigemessen.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 135, 7, 1, "Ja, wie in den meisten protestantischen Kirchen 
 erkennen die Kirchen der reformierten Tradition mit Taufe und Abendmahl zwei 
 Sakramente an. (Wikipedia)");

-- ======================= Bibel beginnend mit 14... =========================


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 141, 7, 0, 
"Die Bibel ist sehr wichtig, aber sie wird in der Regel nicht Wort-wörtlich ausgelegt.");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 142, 7, 1, 
"Ja: <i>sola scriptura</i>!");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 143, 7, 0, 
"");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 144, 7, 1,
"Die wissenschaftliche Betrachtung (historisch-kritisch) wird in der Regel propagiert.");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 145, 7, 0, 
"Die Notwendigkeit einer Auslegung wird zwar bejaht, aber aus einer wissenschaftlichen
 (historisch-kritischen) Perspektive. Das Konzept - <i>Geist der Bibel</i> - ist
 dem er fremd.");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 146, 7, 0, 
"Nein, das widerspricht dem Stand der Wissenschaft. Auch wenn auf dem Grundsatz 
 <i>sola scriptura</i> viel Wert gelegt wird.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 147, 7, 1, 
"Ja, Gott wir eine Bedeutung für die Schöpfung/Evolution beigemessen.");

-- ==================== Kat Gemeinde beginnend mit 15... =====================



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 151, 7, 1, 
"I den reformierten Gemeinden werden die Ämter von der Gemeinde gewählt/vergeben.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 152, 7, 1, 
"Die Gemeinden sind weitestgehend selbständig, auch wenn sie überregional vernetzt
 und organisiert sind.");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 153, 7, 1, "Liturgische Handlungen werden in aller
 Regel von Priestern durchgeführt auch wen das <i>Priestertum Aller</i> stärker
 als bei den Lutheranern betont wird..");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 2004, 7, 0, "Sehr unwahrscheinlich");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 155, 7, 1, "Frauen können alle Ämter bekleiden.");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 2006, 7, 0, "Die meisten Mitglieder gehen selten bis gar nicht zum
 Gottesdienst oder beteiligen sich nicht am Gemeinde Leben. Oft werden nur die wichtigen
 Veranstaltungen wahrgenommen: Taufe, Heirat, Weihnachten und Beerdigung...");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 157, 7, 0, "Die Gemeinden werden von Hauptamtlichen (Pfarrern) geleitet
 bzw. betreut.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 158, 7, 0, "Nein, die Gemeinden entscheiden selbst über ihre Ämterbesetzungen.");

-- ==================== Kat. Sexualität beginnend mit 16... ===================

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 161, 7, 3, "Die Frage ist de facto bedeutungslos und Privatangelegenheit
 der Mitglieder.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 162, 7, 0, "Die Trauung wird in protestantischen Kirchen nicht als 
 Sakrament angesehen, gleichwohl wird nach den meisten agendarischen Vorgaben und 
 landeskirchlichen Ordnungen ein gegenseitiges, vor Gott und der Gemeinde bezeugtes 
 Versprechen abgenommen. (Quelle: http://de.wikipedia.org/wiki/Kirchliche_Trauung#Protestantische_Kirchen)");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 163, 7, 0, "Eine erneute Heirat ist möglich");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 164, 7, 2, "Homosexuelle Paare können seid einiger Zeit getraut werden.
 (Quelle: http://de.wikipedia.org/wiki/Kirchliche_Trauung#Protestantische_Kirchen)");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 165, 7, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 166, 7, 3, "Nein, das ist die Privatentscheidung der Mitglieder.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 167, 7, 3, "Nein, das ist die Privatentscheidung der Mitglieder.");

-- ============================= Kat. Gottesdienst beginnend mit 17... =======

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 171, 7, 1, "Die Liturgie ist sehr sparsam aber vorhanden..");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 173, 7, 0, "Keine Bedeutung");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 174, 7, 0, "Keine zentrale Bedeutung. Oft konservative Musik.");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 175, 7, 0, "Keine zentrale Bedeutung.");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 176, 7, 0, "");

-- ====================== Kat. Erlösung beginnend mit 18... ==================


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 181, 7, 0, "Bedingt, durch die Prädestinationslehre ist der Mensch 
 in gewisser Hinsicht schon <i>gerichtet</i>");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 182, 7, 1, "");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 183, 7, 0, "");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 184, 7, 1, "Wesentliches Charakteristikum reformierter Theologie ist ferner 
 die starke Betonung der Prädestinationslehre, des Gedankens einer Erwählung der 
 zum Heil (bzw. zur Verdammnis) bestimmten Menschen durch Gott ohne die Möglichkeit 
 der Beeinflussung durch den Menschen. (Quelle: http://de.wikipedia.org/wiki/Reformierte_Kirche)");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 185, 7, 1, "Es gibt eine gewisse Verwandtschaft mit dem <i>Wohlstandsevangelium</i> 
 dadurch das Askese gelehrt und in diesem Sinne unternehmerischer Erfolg im 
 reformiert-puritanischen Kapitalismus als Belohnung für Verzicht und Entsagung 
 aufgefasst wird. Ist aber in Deutschsprachigen Raum nicht mehr so ausgeprägt. 
 (Quelle: http://de.wikipedia.org/wiki/Wohlstandsevangelium)");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 186, 7, 1, "Teilweise ist die Lehre von der Prädestination anzutreffen, 
 um zu erklären, warum auch Christen, die augenscheinlich ihr Leben richtig führen, 
 den materiellen Segen nicht erlangen. (Quelle: http://de.wikipedia.org/wiki/Wohlstandsevangelium)");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 187, 7, 0, "Anderen Gemeinschaften wird nicht grundsätzlich abgesprochen
 das sie erlöst werden könnten. Es gibt aber Glaubensgemeinschaften (die 
 <i>Friedenskirchen</i>) die im <i>Confessio Augustana</i> verdammt werden. ");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 188, 7, 0, "Nein, die lutherische <i>Zwei-Reiche-Lehre</i> wird in reformierten 
 Kirchen nicht gelehrt. (Quelle: http://de.wikipedia.org/wiki/Reformierte_Kirche#Merkmale)");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 189, 7, 0, "");

-- ========================= Kat. Sonstiges beginnend mit 19... ==============


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 191, 7, 1, "Wird als meist als Privatangelegenheit der Mitglieder verstanden.
 gelegentlich gibt es aber politische Aussagen.");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 192, 7, 0, "Dem Thema wird keine große Bedeutung beigemessen. Bedingt
 durch die Prädestinationslehre");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 193, 7, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 194, 7, 0, "");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 195, 7, 1, "Besonders in der Vergangenheit wurde das einfache und schmucklose
 Leben propagiert.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 196, 7, 3, "");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 197, 7, 2, "Für die Vergangenheit hat ds auf alle Fälle gegolten. Heute 
 wenn dann nur noch in abgeschwächter Form und individuell.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 198, 7, 0, "Die Reformierten sind betont puritanisch und die Kirchen
 sehr schlicht gehalten.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 199, 7, 0, "Nein, gewiss nicht. Gerade in den Anfängen in den Amerikanischen
 Kolonien sind Puritanischer wiederholt durch ihren Blutrausch aufgefallen. Auch
 Heute tun Sie sich nicht durch eine besonders pazifistische Haltung hervor.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 1910, 7, 0, "");


COMMIT;