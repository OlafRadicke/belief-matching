BEGIN;


-- ###########################################################################
-- #################### insert denomination_answers #######################################
-- ###########################################################################

-- ===================== Konservative Quaker =================================


-- ################ Eindeutige ID für Konfession setzen #####################
INSERT INTO denominations ( denomination_id, denomination, url ) VALUES (
3,
"Mennoniten",
"http://de.wikipedia.org/wiki/Mennoniten");

-- ################  Frage mit Konfession verknüpfen. #######################
-- 0 = Trifft nicht zu
-- 1 = Trifft zu
-- 2 = Persönliche Entscheidung
-- 3 = Keine Meinung

-- ======= kat "Gott" beginnend mit 11... ====================================
-- "Ich glaube an die dreifaltigkeit"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr ) 
VALUES ( 111, 3, 1 );
-- "Jesus ist nicht Gott sondern nur ein (besonderer) Mensch"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr ) 
VALUES ( 112, 3, 0 );
-- "Gott offenbart sich direkt jedem Menschen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr ) 
VALUES ( 113, 3, 2 );
--"Gott offenbart sich durch die Bibel."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr ) 
VALUES ( 114, 3, 1 );
-- "Gottes offenbart sich nur bestimmten Menschen (Propheten) und diese dienen 
-- haben die Aufgabe den Anderen Gotteswillen zu verkünden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr ) 
VALUES ( 115, 3, 3 );

-- ======== Kat "Taufe" beginnend mit 12... ==================================
-- "Die Taufe (mit Wasser/liturgisch) ist Voraussetzung f&uuml;r die 
-- Erl&ouml;sung/Errettung"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 121, 3, 1 );
-- "Die Taufe wird &auml;u&szlig;erlich durch Wasser vollzogen"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 122, 3, 1 );
-- "Ich lehne Kindertaufe ab"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 123, 3, 1 );

-- ============ Kat Abendmahl beginnend mit 13... ============================

-- "Bei dem Abendmahl findet eine Umwandlung des Brotes in den Leib Christi statt"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 131, 3, 0 );
-- "Zum Abendmahl sollten nur Mitglieder der eigenen Konfession zugelassen sein"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 132, 3, 2 );
-- "Zum Abendmahl sollten nur wer getauft ist zugelassen werden"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 133, 3, 2 );
-- "Dem Abendmahl messe ich keine Bedeutung zu."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 134, 3, 0 );
-- "Das Abendmahl ist heilig (ein Sakrament)."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 135, 3, 0 );

-- ======================= Bibel beginnend mit 14... =========================
-- "Als <i>Bibeltreu</i> kann sich nur jemand bezeichnen, der ich die Bibel 
-- wortw&ouml;rtlich nimmt."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 141, 3, 2 );
-- "Ich akzeptiere nur die Bibel als Grundlage des Glaubens und als alleiniger 
-- Ma&szlig;stab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 142, 3, 1 );
-- "F&uuml;r mich gibt es noch &uuml;ber den Bibelkanon hinaus B&uuml;cher 
-- die von Gott inspiriert sind."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 143, 3, 0 );
-- "Die Bibel bedarf immer einer Auslegung. Dabei muss der historische Kontext 
-- beachtet werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 144, 3, 2 );
-- "Die Bibel bedarf immer einer Auslegung. Dabei muss man sich dem Geist der 
-- Bibel &ouml;ffnen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 145, 3, 2 );
-- "Ich glaube, dass die Welt in 7 Tagen erschaffen wurde und nicht &auml;lter 
-- ist als 10.000 Jahre."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 146, 3, 2 );
-- "Ich glaube an eine von Gott gesteuerte Evolution."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 147, 3, 2 );

-- ==================== Kat Gemeinde beginnend mit 15... =====================

-- "Ich glaube an das Priestertum Aller und will das die Gemeinde von Allen 
-- gemeinsam geleitet wird (demokratische Abstimmungenen oder &auml;hnliches).")."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 151, 3, 1 );
-- "Mir ist wichtig, das eine Gemeinde autonom ist."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 152, 3, 1 );
-- "Ich glaube ein Gottesdienst sollte von Priestern (oder Hauptamtlichen) 
-- geleitet werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 153, 3, 0 );
-- "Bei (wiederholten) Verfehlungen sollten (uneinsichtige) Mitglied auch aus 
-- der Gemeinde ausgeschlossen werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 154, 3, 1 );
-- "Frauen sollen alle Aufgabe in der Gemeinde (einschlie&szlig;lich das 
-- Predigen) &uuml;bernehmen k&ouml;nnen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 155, 3, 2 );
-- "Zu den Pflichten in der Gemeinde geh&ouml;rt auch das man 
-- regelm&auml;&szlig;ig in Erscheinung tritt und sich aktiv einbringt."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 156, 3, 2 );
-- "Die Gemeinde sollte von den &Auml;ltesten und/oder Predigern und/oder 
-- Diakonen geleitete werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 157, 3, 0 );
-- "Die Gemeindeleitung sollte von einer H&ouml;heren Instanz bestimmt werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 158, 3, 0 );

-- ==================== Kat. Sexualität beginnend mit 16... ===================
-- "Sex vor der Ehe lehene ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 161, 3, 2 );
-- "Die Ehe ist heilig."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 162, 3, 2 );
-- "Erneutes heiraten nach einer Scheidung lehne ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 163, 3, 0 );
-- "Gleichgeschlechtliche Ehen lehne ich ab."); 
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 164, 3, 2 );
-- "Ich halte (gelebte) Homosexualit&auml;t f&uuml;r eine S&uuml;nde.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 165, 3, 2 );
-- "Schwangerschaftsverhütung lehne ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 166, 3, 2 );
-- "Schwangerschaftsabbrüche lehne ich kategorisch ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 167, 3, 2 );

-- ============================= Kat. Gottesdienst beginnend mit 17... =======
--- "Ein Gottesdienst muss ein bestimmten Ablauf (Liturgie) folgen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 171, 3, 0 );
-- "Stille und Besinnung sind mir auch im Gottesdienst sehr wichtig."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 173, 3, 0 );
--- "Mir ist wichtig das Musik (Worship) modern ist, ber&uuml;hrt und 
-- mitrei&szlig;t."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 173, 3, 2 );
-- "Freies Gebet im Gottesdienst ist f&uuml;r mich Zeichen von lebendigen und 
-- authentischem Glauben."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 175, 3, 2 );
-- "In <i>Zungenreden</i> ist f&uuml;r mich ein Zeichen der Gnadengabe des 
-- Heiligen Geistes."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 176, 3, 0 );

-- ====================== Kat. Erlösung beginnend mit 18... ==================
-- "Ich glaube das f&uuml;r jeden Menschen kommt eine Zeit, wo er von Gott 
-- gerichtet wird."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 181, 3, 1 );
-- "Ich glaube es gibt eine H&ouml;lle mit ewiger Verdammnis."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 182, 3, 2 );
-- "Menschen k&ouml;nnen auch noch nach ihrem Tod Busse tun um der Verdammnis
-- zu entgehen (Fegefeuer)."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 183, 3, 0 );
-- "Auf die Erl&ouml;sung hat man keinen Einfluss, Sie wird einem durch die 
-- Gnade Gottes zu Teil."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 184, 3, 0 );
-- "Wirtschaftlicher Erfolg ist ein Zeichen das man in der Gnade Gottes steht."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 185, 3, 0 );
-- "Leid ist eine Strafe Gottes.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 186, 3, 0 );
-- "Es kann nur eine Wahrheit geben und deshalb nur ein Weg zur Erl&ouml;sung 
-- f&uuml;hren."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 187, 3, 2 );
-- "Das Reich Gottes ist schon da. Es ist aber (noch) nicht (f&uuml;r alle) 
-- sichtbar."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 188, 3, 2 );
-- "Eine Erl&ouml;sung ist schon im Diesseits m&ouml;glich."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 189, 3, 0 );

-- ========================= Kat. Sonstiges beginnend mit 19... ==============
-- "Politische Aktivit&auml;ten oder Themen haben in der Gemeinde keinen 
-- Platz."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 191, 3, 2 );
-- "Soziales angemahnt (in der Welt) sind existenzieller 
-- Bestandteil des Evangeliums."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 192, 3, 1 );
-- "Der Missionsauftrag ist ein wichtiger Bestandteil des Evangeliums."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 193, 3, 2 );
-- "Ich glaube an Geistheilung."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 194, 3, 2 );
-- "Kino, Theater, Konzerte und andere K&uuml;nste bergen immer die Gefahr von 
-- wichtigen Dingen abgelenkt zu werden.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 195, 3, 2 );
-- "Alkohol und andere Drogen versperren den Weg zu spiritueller Entwicklung."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 196, 3, 2 );
-- "Gl&auml;ubige Menschen sollten sich von Weltlichen Dingen/Gesellschaft
--  fern halten."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 197, 3, 2 );
-- "In Heilgenbilder und -Skulpturen kann ich Halt und Trost finden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 198, 3, 0 );
-- "Wehrdienst lehne ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 199, 3, 1 );
-- "Ich schw&ouml;re nicht und lege keine Eide ab.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 1910, 3, 1 );


COMMIT;