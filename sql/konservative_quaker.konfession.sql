BEGIN;


-- ###########################################################################
-- #################### insert denomination_answers #######################################
-- ###########################################################################

-- ===================== Konservative Quaker =================================


-- ################ Eindeutige ID für Konfession setzen #####################
INSERT INTO denominations ( denomination_id, denomination, url ) VALUES (
1,
"Konservative Quäker",
"http://de.wikipedia.org/wiki/Quäkertum");

-- ################  Frage mit Konfession verknüpfen. #######################
-- 0 = Trifft nicht zu
-- 1 = Trifft zu
-- 2 = Persönliche Entscheidung
-- 3 = Keine Meinung

-- ======= kat "Gott" beginnend mit 11... ====================================
-- "Ich glaube an die dreifaltigkeit"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 
111, 
1, 
2, 
"Das ist bei kein Wichtiger Punkt bei Konservativen Quäkern, aber die meisten
 werden die Frage wahrscheinlich bejahen.");

-- "Jesus ist nicht Gott sondern nur ein (besonderer) Mensch"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 
112, 
1, 
2, 
"Die Frage nach der Historischen Person wird nicht viel Bedeutung beigemessen. 
 Wichtiger ist für Quäker der s.g. <i>innere Christus</i>.");

-- "Gott offenbart sich direkt jedem Menschen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 
113, 
1, 
1, 
"Das ist einer der wichtigsten Kernaussagen im Quäkertum. Hier wird oft von dem
 s.g. <i>Innerem Licht</i> gesprochen von dem man gerichtet, geführt und erlöst
 wird.");

--"Gott offenbart sich durch die Bibel."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 
114, 
1, 
1, 
"Dem werden die meisten konservativen Quäker zustimmen. Allerdings ist der persönliche
 Zugang über das s.g. <i>Innere Licht</i> gleichbedeutend oder sogar höher.");

-- "Gottes offenbart sich nur bestimmten Menschen (Propheten) und diese dienen 
-- haben die Aufgabe den Anderen Gotteswillen zu verkünden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 
115, 
1, 
0, 
"Quäker glauben schon, das es ausgewählte Menschen gibt, die besonders befähigt
 sind zum Lehr- und Predigt-Amt, aber die Fähigkeit Gottes Willen zuerkennen
 haben grundsätzlich erst mal alle Menschen, ist die Auffassung der Quäker.");

-- ======== Kat "Taufe" beginnend mit 12... ==================================
-- "Die Taufe (mit Wasser/liturgisch) ist Voraussetzung für die 
-- Erlösung/Errettung"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 121, 1, 0, "Die Taufe hat für Quäker im Allgemeinen keine Bedeutung");
-- "Die Taufe wird äußerlich durch Wasser vollzogen"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 122, 1, 0, "Die Taufe hat für Quäker im Allgemeinen keine Bedeutung");
-- "Ich lehne Kindertaufe ab"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 123, 1, 1, "Die Taufe hat für Quäker im Allgemeinen keine Bedeutung");

-- ============ Kat Abendmahl beginnend mit 13... ============================

-- "Bei dem Abendmahl findet eine Umwandlung des Brotes in den Leib Christi statt"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 131, 1, 0, "Die Abendmalfeier hat für Quäker im Allgemeinen keine Bedeutung");
-- "Zum Abendmahl sollten nur Mitglieder der eigenen Konfession zugelassen sein"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 132, 1, 2, "Die Abendmalfeier hat für Quäker im Allgemeinen keine Bedeutung");
-- "Zum Abendmahl sollten nur wer getauft ist zugelassen werden"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 133, 1, 2, "Die Abendmalfeier hat für Quäker im Allgemeinen keine Bedeutung");
-- "Dem Abendmahl messe ich keine Bedeutung zu."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 134, 1, 1, "Die Abendmalfeier hat für Quäker im Allgemeinen keine Bedeutung");
-- "Das Abendmahl ist heilig (ein Sakrament)."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 135, 1, 0, "Die Abendmalfeier hat für Quäker im Allgemeinen keine Bedeutung");

-- ======================= Bibel beginnend mit 14... =========================
-- "Als <i>Bibeltreu</i> kann sich nur jemand bezeichnen, der ich die Bibel 
-- wortwörtlich nimmt."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 
141, 
1, 
0, 
"Im konservativem Quäkertum hat die Bibel noch ein hohen Stellenwert. 
 Allerdings wird betont, das der Geist der Bibel verstanden werden muss und dazu
 muss man nich dem s.g. <i>Inneren Licht</i> öffnen. Eine Wort-Wörtliche Auslegung
 wird also abgelehnt.");

-- "Ich akzeptiere nur die Bibel als Grundlage des Glaubens und als alleiniger 
-- Maßstab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 
142, 
1, 
0, 
"Nein, im Quäkertum spielt die persönliche Gotteserfahrung (Offenbarung) eine 
 sehr große Rolle. Was aber nicht heißt, das diese im Widerspruch stehen darf.");

-- "Für mich gibt es noch über den Bibelkanon hinaus Bücher 
-- die von Gott inspiriert sind."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 
143, 
1, 
2, 
"Das wird unter Quäkern unterschiedlich gesehen. In der Regel wird es bei konservativen
 Quäkern verneint und bei liberalen bejat.");

-- "Die Bibel bedarf immer einer Auslegung. Dabei muss der historische Kontext 
-- beachtet werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 
144, 
1, 
1, 
"Die wissenschaftliche Betrachtung (historisch-kritisch) wird nicht gänzlich
 abgelehnt, aber im Vordergrund steht doch er die Ergründung des Geistes in
 der die Bibel geschrieben wurde.");

-- "Die Bibel bedarf immer einer Auslegung. Dabei muss man sich dem Geist der 
-- Bibel öffnen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 
145, 
1, 
1, 
"Ja, das ist die Position der meisten konservativen Quäker. ");

-- "Ich glaube, dass die Welt in 7 Tagen erschaffen wurde und nicht älter 
-- ist als 10.000 Jahre."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 
146, 
1, 
2, 
"Darüber gibt es keine gemeinsame Position.");

-- "Ich glaube an eine von Gott gesteuerte Evolution."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 
147, 
1, 
2, 
"Darüber gibt es keine gemeinsame Position.");

-- ==================== Kat Gemeinde beginnend mit 15... =====================

-- "Ich glaube an das Priestertum Aller und will das die Gemeinde von Allen 
-- gemeinsam geleitet wird (demokratische Abstimmungenen oder ähnliches).")."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 
151, 
1, 
1, 
"Hier sind Quäker sehr radikal. Beschlüsse werden von der gesamten Gemeinschaft
 gefasst, und das nicht im Mehrheitsverfahren sondern im Konsensverfahren. Hier
 bei wird der Anspruch erhoben, den Willen Gottes für die Gemeinde gemeinschaftlich
 erkennen und umsetzen zu wollen. Es verwundert nicht, das dieses Verfahren in der 
 Regel sehr Zeitaufwendig ist.");

-- "Mir ist wichtig, das eine Gemeinde autonom ist."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 
152, 
1, 
1, 
"Das ist traditionell so, das jede Gemeinde völlig autonom ist und nur sehr lose
 überregional vernetzt und organisiert ist.");

-- "Ich glaube ein Gottesdienst sollte von Priestern (oder Hauptamtlichen) 
-- geleitet werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 153, 1, 0, "");
-- "Bei (wiederholten) Verfehlungen sollten (uneinsichtige) Mitglied auch aus 
-- der Gemeinde ausgeschlossen werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 154, 1, 1, "");
-- "Frauen sollen alle Aufgabe in der Gemeinde (einschließlich das 
-- Predigen) übernehmen können."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 155, 1, 1, "");
-- "Zu den Pflichten in der Gemeinde gehört auch das man 
-- regelmäßig in Erscheinung tritt und sich aktiv einbringt."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 156, 1, 1, "");
-- "Die Gemeinde sollte von den &Auml;ltesten und/oder Predigern und/oder 
-- Diakonen geleitete werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 157, 1, 0, "");
-- "Die Gemeindeleitung sollte von einer Höheren Instanz bestimmt werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 158, 1, 0, "");

-- ==================== Kat. Sexualität beginnend mit 16... ===================
-- "Sex vor der Ehe lehene ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 161, 1, 2, "");
-- "Die Ehe ist heilig."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 162, 1, 0, "");
-- "Erneutes heiraten nach einer Scheidung lehne ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 163, 1, 0, "");
-- "Gleichgeschlechtliche Ehen lehne ich ab."); 
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 164, 1, 2, "");
-- "Ich halte (gelebte) Homosexualität für eine Sünde.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 165, 1, 2, "");
-- "Schwangerschaftsverhütung lehne ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 166, 1, 2, "");
-- "Schwangerschaftsabbrüche lehne ich kategorisch ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 167, 1, 2, "");

-- ============================= Kat. Gottesdienst beginnend mit 17... =======
--- "Ein Gottesdienst muss ein bestimmten Ablauf (Liturgie) folgen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 171, 1, 0, "");
-- "Stille und Besinnung sind mir auch im Gottesdienst sehr wichtig."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 173, 1, 1, "");
--- "Mir ist wichtig das Musik (Worship) modern ist, berührt und 
-- mitreißt."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 173, 1, 0, "");
-- "Freies Gebet im Gottesdienst ist für mich Zeichen von lebendigen und 
-- authentischem Glauben."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 175, 1, 1, "");
-- "In <i>Zungenreden</i> ist für mich ein Zeichen der Gnadengabe des 
-- Heiligen Geistes."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 176, 1, 0, "");

-- ====================== Kat. Erlösung beginnend mit 18... ==================
-- "Ich glaube das für jeden Menschen kommt eine Zeit, wo er von Gott 
-- gerichtet wird."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 181, 1, 1, "");
-- "Ich glaube es gibt eine Hölle mit ewiger Verdammnis."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 182, 1, 2, "");
-- "Menschen können auch noch nach ihrem Tod Busse tun um der Verdammnis
-- zu entgehen (Fegefeuer)."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 183, 1, 0, "");
-- "Auf die Erlösung hat man keinen Einfluss, Sie wird einem durch die 
-- Gnade Gottes zu Teil."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 184, 1, 0, "");
-- "Wirtschaftlicher Erfolg ist ein Zeichen das man in der Gnade Gottes steht."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 185, 1, 0, "");
-- "Leid ist eine Strafe Gottes.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 186, 1, 0, "");
-- "Es kann nur eine Wahrheit geben und deshalb nur ein Weg zur Erlösung 
-- führen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 187, 1, 2, "");
-- "Das Reich Gottes ist schon da. Es ist aber (noch) nicht (für alle) 
-- sichtbar."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 188, 1, 1, "");
-- "Eine Erlösung ist schon im Diesseits möglich."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 189, 1, 1, "");

-- ========================= Kat. Sonstiges beginnend mit 19... ==============
-- "Politische Aktivitäten oder Themen haben in der Gemeinde keinen 
-- Platz."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 191, 1, 0, "");
-- "Soziales Engagement (in der Welt) sind existenzieller 
-- Bestandteil des Evangeliums."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 192, 1, 1, "");
-- "Der Missionsauftrag ist ein wichtiger Bestandteil des Evangeliums."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 193, 1, 0, "");
-- "Ich glaube an Geistheilung."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 194, 1, 2, "");
-- "Kino, Theater, Konzerte und andere Künste bergen immer die Gefahr von 
-- wichtigen Dingen abgelenkt zu werden.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 195, 1, 1, "");
-- "Alkohol und andere Drogen versperren den Weg zu spiritueller Entwicklung."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 196, 1, 1, "");
-- "Gläubige Menschen sollten sich von Weltlichen Dingen/Gesellschaft
--  fern halten."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 197, 1, 0, "");
-- "In Heilgenbilder und -Skulpturen kann ich Halt und Trost finden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 198, 1, 0, "");
-- "Wehrdienst lehne ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 199, 1, 1, "");
-- "Ich schwöre nicht und lege keine Eide ab.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 1910, 1, 1, "");


COMMIT;