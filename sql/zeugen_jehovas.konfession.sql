BEGIN;


-- ###########################################################################
-- #################### insert denomination_answers #######################################
-- ###########################################################################

-- ===================== Konservative Quaker =================================


-- ################ Eindeutige ID für Konfession setzen #####################
INSERT INTO denominations ( denomination_id, denomination, url ) VALUES (
4,
"Zeugen Jehovas",
"http://de.wikipedia.org/wiki/Zeugen_Jehovas");

-- ################  Frage mit Konfession verknüpfen. #######################
-- 0 = Trifft nicht zu
-- 1 = Trifft zu
-- 2 = Persönliche Entscheidung
-- 3 = Keine Meinung

-- ======= kat "Gott" beginnend mit 11... ====================================
-- "Ich glaube an die dreifaltigkeit"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr ) 
VALUES ( 111, 4, 0 );
-- "Jesus ist nicht Gott sondern nur ein (besonderer) Mensch"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr ) 
VALUES ( 112, 4, 1 );
-- "Gott offenbart sich direkt jedem Menschen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr ) 
VALUES ( 113, 4, 0 );
--"Gott offenbart sich durch die Bibel."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr ) 
VALUES ( 114, 4, 1 );
-- "Gottes offenbart sich nur bestimmten Menschen (Propheten) und diese dienen 
-- haben die Aufgabe den Anderen Gotteswillen zu verkünden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr ) 
VALUES ( 115, 3, 1 );

-- ======== Kat "Taufe" beginnend mit 12... ==================================
-- "Die Taufe (mit Wasser/liturgisch) ist Voraussetzung f&uuml;r die 
-- Erl&ouml;sung/Errettung"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 121, 4, 1 );
-- "Die Taufe wird &auml;u&szlig;erlich durch Wasser vollzogen"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 122, 4, 1 );
-- "Ich lehne Kindertaufe ab"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 123, 4, 1 );
-- "Ich lehne die &auml;ussere Taufe ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 124, 4, 0 );
-- ============ Kat Abendmahl beginnend mit 13... ============================

-- "Bei dem Abendmahl findet eine Umwandlung des Brotes in den Leib Christi statt"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 131, 4, 0 );
-- "Zum Abendmahl sollten nur Mitglieder der eigenen Konfession zugelassen sein"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 132, 4, 2 );
-- "Zum Abendmahl sollten nur wer getauft ist zugelassen werden"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 133, 4, 2 );
-- "Dem Abendmahl messe ich keine Bedeutung zu."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 134, 4, 0 );
-- "Das Abendmahl ist heilig (ein Sakrament)."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 135, 4, 0 );

-- ======================= Bibel beginnend mit 14... =========================
-- "Als <i>Bibeltreu</i> kann sich nur jemand bezeichnen, der ich die Bibel 
-- wortw&ouml;rtlich nimmt."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 141, 4, 1 );
-- "Ich akzeptiere nur die Bibel als Grundlage des Glaubens und als alleiniger 
-- Ma&szlig;stab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 142, 4, 1 );
-- "F&uuml;r mich gibt es noch &uuml;ber den Bibelkanon hinaus B&uuml;cher 
-- die von Gott inspiriert sind."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 143, 4, 0 );
-- "Die Bibel bedarf immer einer Auslegung. Dabei muss der historische Kontext 
-- beachtet werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 144, 4, 0 );
-- "Die Bibel bedarf immer einer Auslegung. Dabei muss man sich dem Geist der 
-- Bibel &ouml;ffnen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 145, 4, 0 );
-- "Ich glaube, dass die Welt in 7 Tagen erschaffen wurde und nicht &auml;lter 
-- ist als 10.000 Jahre."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 146, 4, 1 );
-- "Ich glaube an eine von Gott gesteuerte Evolution."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 147, 4, 0 );

-- ==================== Kat Gemeinde beginnend mit 15... =====================

-- "Ich glaube an das Priestertum Aller und will das die Gemeinde von Allen 
-- gemeinsam geleitet wird (demokratische Abstimmungenen oder &auml;hnliches).")."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 151, 4, 0 );
-- "Mir ist wichtig, das eine Gemeinde autonom ist."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 152, 4, 0 );
-- "Ich glaube ein Gottesdienst sollte von Priestern (oder Hauptamtlichen) 
-- geleitet werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 153, 4, 0 );
-- "Bei (wiederholten) Verfehlungen sollten (uneinsichtige) Mitglied auch aus 
-- der Gemeinde ausgeschlossen werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 154, 4, 1 );
-- "Frauen sollen alle Aufgabe in der Gemeinde (einschlie&szlig;lich das 
-- Predigen) &uuml;bernehmen k&ouml;nnen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 155, 4, 2 );
-- "Zu den Pflichten in der Gemeinde geh&ouml;rt auch das man 
-- regelm&auml;&szlig;ig in Erscheinung tritt und sich aktiv einbringt."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 156, 4, 1 );
-- "Die Gemeinde sollte von den &Auml;ltesten und/oder Predigern und/oder 
-- Diakonen geleitete werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 157, 4, 1 );
-- "Die Gemeindeleitung sollte von einer H&ouml;heren Instanz bestimmt werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 158, 4, 0 );

-- ==================== Kat. Sexualität beginnend mit 16... ===================
-- "Sex vor der Ehe lehene ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 161, 4, 1 );
-- "Die Ehe ist heilig."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 162, 4, 0 );
-- "Erneutes heiraten nach einer Scheidung lehne ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 163, 4, 0 );
-- "Gleichgeschlechtliche Ehen lehne ich ab."); 
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 164, 4, 1 );
-- "Ich halte (gelebte) Homosexualit&auml;t f&uuml;r eine S&uuml;nde.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 165, 4, 1 );

-- ============================= Kat. Gottesdienst beginnend mit 17... =======
--- "Ein Gottesdienst muss ein bestimmten Ablauf (Liturgie) folgen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 171, 4, 1 );
-- "Stille und Besinnung sind mir auch im Gottesdienst sehr wichtig."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 173, 4, 0 );
--- "Mir ist wichtig das Musik (Worship) modern ist, ber&uuml;hrt und 
-- mitrei&szlig;t."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 173, 4, 0 );
-- "Freies Gebet im Gottesdienst ist f&uuml;r mich Zeichen von lebendigen und 
-- authentischem Glauben."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 175, 4, 0 );
-- "In <i>Zungenreden</i> ist f&uuml;r mich ein Zeichen der Gnadengabe des 
-- Heiligen Geistes."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 176, 4, 0 );

-- ====================== Kat. Erlösung beginnend mit 18... ==================
-- "Ich glaube das f&uuml;r jeden Menschen kommt eine Zeit, wo er von Gott 
-- gerichtet wird."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 181, 4, 1 );
-- "Ich glaube es gibt eine H&ouml;lle mit ewiger Verdammnis."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 182, 4, 1 );
-- "Menschen k&ouml;nnen auch noch nach ihrem Tod Busse tun um der Verdammnis
-- zu entgehen (Fegefeuer)."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 183, 4, 0 );
-- "Auf die Erl&ouml;sung hat man keinen Einfluss, Sie wird einem durch die 
-- Gnade Gottes zu Teil."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 184, 4, 1 );
-- "Wirtschaftlicher Erfolg ist ein Zeichen das man in der Gnade Gottes steht."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 185, 4, 0 );
-- "Leid ist eine Strafe Gottes.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 186, 4, 0 );
-- "Es kann nur eine Wahrheit geben und deshalb nur ein Weg zur Erl&ouml;sung 
-- f&uuml;hren."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 187, 4, 1 );
-- "Das Reich Gottes ist schon da. Es ist aber (noch) nicht (f&uuml;r alle) 
-- sichtbar."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 188, 4, 0 );
-- "Eine Erl&ouml;sung ist schon im Diesseits m&ouml;glich."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 189, 4, 0 );

-- ========================= Kat. Sonstiges beginnend mit 19... ==============
-- "Politische Aktivit&auml;ten oder Themen haben in der Gemeinde keinen 
-- Platz."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 191, 4, 1 );
-- "Soziales Engagement (in der Welt) sind existenzieller 
-- Bestandteil des Evangeliums."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 192, 4, 0 );
-- "Der Missionsauftrag ist ein wichtiger Bestandteil des Evangeliums."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 193, 4, 1 );
-- "Ich glaube an Geistheilung."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 194, 4, 2 );
-- "Kino, Theater, Konzerte und andere K&uuml;nste bergen immer die Gefahr von 
-- wichtigen Dingen abgelenkt zu werden.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 195, 4, 1 );
-- "Alkohol und andere Drogen versperren den Weg zu spiritueller Entwicklung."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 196, 4, 2 );
-- "Gl&auml;ubige Menschen sollten sich von Weltlichen Dingen/Gesellschaft
--  fern halten."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 197, 4, 1 );
-- "In Heilgenbilder und -Skulpturen kann ich Halt und Trost finden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 198, 4, 0 );
-- "Wehrdienst lehne ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 199, 4, 1 );
-- "Ich schw&ouml;re nicht und lege keine Eide ab.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 1910, 4, 1 );


COMMIT;