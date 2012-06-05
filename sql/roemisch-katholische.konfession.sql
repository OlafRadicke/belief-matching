BEGIN;


-- ###########################################################################
-- #################### insert denomination_answers #######################################
-- ###########################################################################

-- ===================== Konservative Quaker =================================


-- ################ Eindeutige ID für Konfession setzen #####################
INSERT INTO denominations ( denomination_id, denomination, url ) VALUES (
5,
"Römisch-katholische Kirche",
"http://de.wikipedia.org/wiki/R%C3%B6misch-katholische_Kirche");

-- ################  Frage mit Konfession verknüpfen. #######################
-- 0 = Trifft nicht zu
-- 1 = Trifft zu
-- 2 = Persönliche Entscheidung
-- 3 = Keine Meinung

-- ======= kat "Gott" beginnend mit 11... ====================================
-- "Ich glaube an die dreifaltigkeit"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr ) 
VALUES ( 111, 5, 1 );
-- "Jesus ist nicht Gott sondern nur ein (besonderer) Mensch"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr ) 
VALUES ( 112, 5, 0 );
-- "Gott offenbart sich direkt jedem Menschen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr ) 
VALUES ( 113, 5, 0 );
--"Gott offenbart sich durch die Bibel."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr ) 
VALUES ( 114, 5, 1 );
-- "Gottes offenbart sich nur bestimmten Menschen (Propheten) und diese dienen 
-- haben die Aufgabe den Anderen Gotteswillen zu verkünden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr ) 
VALUES ( 115, 5, 1 );

-- ======== Kat "Taufe" beginnend mit 12... ==================================
-- "Die Taufe (mit Wasser/liturgisch) ist Voraussetzung für die 
-- Erlösung/Errettung"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 121, 5, 1 );
-- "Die Taufe wird äußerlich durch Wasser vollzogen"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 122, 5, 1 );
-- "Ich lehne Kindertaufe ab"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 123, 5, 0 );

-- ============ Kat Abendmahl beginnend mit 13... ============================

-- "Bei dem Abendmahl findet eine Umwandlung des Brotes in den Leib Christi statt"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 131, 5, 1 );
-- "Zum Abendmahl sollten nur Mitglieder der eigenen Konfession zugelassen sein"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 132, 5, 1 );
-- "Zum Abendmahl sollten nur wer getauft ist zugelassen werden"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 133, 5, 1 );
-- "Dem Abendmahl messe ich keine Bedeutung zu."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 134, 5, 0 );
-- "Das Abendmahl ist heilig (ein Sakrament)."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 135, 5, 1 );

-- ======================= Bibel beginnend mit 14... =========================
-- "Als <i>Bibeltreu</i> kann sich nur jemand bezeichnen, der ich die Bibel 
-- wortwörtlich nimmt."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 141, 5, 0 );
-- "Ich akzeptiere nur die Bibel als Grundlage des Glaubens und als alleiniger 
-- Maßstab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 142, 5, 0 );
-- "Für mich gibt es noch über den Bibelkanon hinaus Bücher 
-- die von Gott inspiriert sind."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 143, 5, 0 );
-- "Die Bibel bedarf immer einer Auslegung. Dabei muss der historische Kontext 
-- beachtet werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 144, 5, 1 );
-- "Die Bibel bedarf immer einer Auslegung. Dabei muss man sich dem Geist der 
-- Bibel öffnen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 145, 5, 0 );
-- "Ich glaube, dass die Welt in 7 Tagen erschaffen wurde und nicht älter 
-- ist als 10.000 Jahre."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 146, 5, 0 );
-- "Ich glaube an eine von Gott gesteuerte Evolution."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 147, 5, 1 );

-- ==================== Kat Gemeinde beginnend mit 15... =====================

-- "Ich glaube an das Priestertum Aller und will das die Gemeinde von Allen 
-- gemeinsam geleitet wird (demokratische Abstimmungenen oder ähnliches).")."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 151, 5, 0 );
-- "Mir ist wichtig, das eine Gemeinde autonom ist."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 152, 5, 0 );
-- "Ich glaube ein Gottesdienst sollte von Priestern (oder Hauptamtlichen) 
-- geleitet werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 153, 5, 1 );
-- "Bei (wiederholten) Verfehlungen sollten (uneinsichtige) Mitglied auch aus 
-- der Gemeinde ausgeschlossen werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 154, 5, 0 );
-- "Frauen sollen alle Aufgabe in der Gemeinde (einschließlich das 
-- Predigen) übernehmen können."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 155, 5, 0 );
-- "Zu den Pflichten in der Gemeinde gehört auch das man 
-- regelmäßig in Erscheinung tritt und sich aktiv einbringt."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 156, 5, 0 );
-- "Die Gemeinde sollte von den Ältesten und/oder Predigern und/oder 
-- Diakonen geleitete werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 157, 5, 0 );
-- "Die Gemeindeleitung sollte von einer Höheren Instanz bestimmt werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 158, 5, 1 );

-- ==================== Kat. Sexualität beginnend mit 16... ===================
-- "Sex vor der Ehe lehene ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 161, 5, 1 );
-- "Die Ehe ist heilig."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 162, 5, 1 );
-- "Erneutes heiraten nach einer Scheidung lehne ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 163, 5, 1 );
-- "Gleichgeschlechtliche Ehen lehne ich ab."); 
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 164, 5, 1 );
-- "Ich halte (gelebte) Homosexualität für eine Sünde.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 165, 5, 1 );
-- "Schwangerschaftsverhütung lehne ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 166, 5, 1 );
-- "Schwangerschaftsabbrüche lehne ich kategorisch ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 167, 5, 1 );

-- ============================= Kat. Gottesdienst beginnend mit 17... =======
--- "Ein Gottesdienst muss ein bestimmten Ablauf (Liturgie) folgen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 171, 5, 1 );
-- "Stille und Besinnung sind mir auch im Gottesdienst sehr wichtig."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 173, 5, 0 );
--- "Mir ist wichtig das Musik (Worship) modern ist, berührt und 
-- mitreißt."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 173, 5, 0 );
-- "Freies Gebet im Gottesdienst ist für mich Zeichen von lebendigen und 
-- authentischem Glauben."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 175, 5, 0 );
-- "In <i>Zungenreden</i> ist für mich ein Zeichen der Gnadengabe des 
-- Heiligen Geistes."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 176, 5, 0 );

-- ====================== Kat. Erlösung beginnend mit 18... ==================
-- "Ich glaube das für jeden Menschen kommt eine Zeit, wo er von Gott 
-- gerichtet wird."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 181, 5, 1 );
-- "Ich glaube es gibt eine Hölle mit ewiger Verdammnis."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 182, 5, 1 );
-- "Menschen können auch noch nach ihrem Tod Busse tun um der Verdammnis
-- zu entgehen (Fegefeuer)."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 183, 5, 1 );
-- "Auf die Erlösung hat man keinen Einfluss, Sie wird einem durch die 
-- Gnade Gottes zu Teil."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 184, 5, 0 );
-- "Wirtschaftlicher Erfolg ist ein Zeichen das man in der Gnade Gottes steht."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 185, 5, 0 );
-- "Leid ist eine Strafe Gottes.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 186, 5, 0 );
-- "Es kann nur eine Wahrheit geben und deshalb nur ein Weg zur Erlösung 
-- führen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 187, 5, 1 );
-- "Das Reich Gottes ist schon da. Es ist aber (noch) nicht (für alle) 
-- sichtbar."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 188, 5, 0 );
-- "Eine Erlösung ist schon im Diesseits möglich."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 189, 5, 0 );

-- ========================= Kat. Sonstiges beginnend mit 19... ==============
-- "Politische Aktivitäten oder Themen haben in der Gemeinde keinen 
-- Platz."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 191, 5, 1 );
-- "Soziales angemahnt (in der Welt) sind existenzieller 
-- Bestandteil des Evangeliums."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 192, 5, 0 );
-- "Der Missionsauftrag ist ein wichtiger Bestandteil des Evangeliums."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 193, 5, 2 );
-- "Ich glaube an Geistheilung."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 194, 5, 1 );
-- "Kino, Theater, Konzerte und andere Künste bergen immer die Gefahr von 
-- wichtigen Dingen abgelenkt zu werden.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 195, 5, 0 );
-- "Alkohol und andere Drogen versperren den Weg zu spiritueller Entwicklung."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 196, 5, 0 );
-- "Gläubige Menschen sollten sich von Weltlichen Dingen/Gesellschaft
--  fern halten."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 197, 5, 0 );
-- "In Heilgenbilder und -Skulpturen kann ich Halt und Trost finden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 198, 5, 1 );
-- "Wehrdienst lehne ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 199, 5, 0 );
-- "Ich schwöre nicht und lege keine Eide ab.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr )
VALUES ( 1910, 5, 0 );


COMMIT;