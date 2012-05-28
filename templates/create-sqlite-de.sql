BEGIN;

-- ########## create tables ################

CREATE TABLE questions (
    question_id         INTEGER PRIMARY KEY NOT NULL,
    question            TEXT    NOT NULL,
    kat                 TEXT    NOT NULL
);

CREATE TABLE denominations (
    denomination_id     INTEGER PRIMARY KEY NOT NULL,
    denomination        TEXT    NOT NULL
);

CREATE TABLE answers (
    answer_id           INTEGER PRIMARY KEY AUTOINCREMENT,
    question_id         INTEGER NOT NULL,
    denomination_id     INTEGER NOT NULL,
-- value is "y" or "n"
    yes_or_no           TEXT    NOT NULL,
-- wichtung
    weighting_nr        INTEGER NOT NULL,
    FOREIGN KEY ( question_id ) REFERENCES question ( question_id ),
    FOREIGN KEY ( question_id ) REFERENCES denominations ( denomination_id )
);

CREATE TABLE weightings (
    weighting_nr        INTEGER PRIMARY KEY NOT NULL,
    description         TEXT    NOT NULL
);

-- ###########################################################################
-- ######### insert questions ################################################
-- ###########################################################################

-- ======= kat "Gott" ========================================================

INSERT INTO questions (question_id, kat, question) VALUES (
1,
"Gott",
"Ich glaube an die dreifaltigkeit");

INSERT INTO questions (question_id, kat, question) VALUES (
2,
"Gott",
"Jesus ist nicht Gott sondern nur ein (besonderer) Mensch");

INSERT INTO questions (question_id, kat, question) VALUES (
3,
"Gott",
"Gott offenbart sich direkt, auch ohne die Bibel und Klerus");

-- ======== Kat "Taufe" ======================================================
INSERT INTO questions (question_id, kat, question) VALUES (
4,
"Taufe",
"Die Taufe ist Voraussetzung f&uuml;r die Erl&ouml;sung/Errettung");

INSERT INTO questions (question_id, kat, question) VALUES (
5,
"Taufe",
"Die Taufe wird &auml;u&szuml;erlich durch Wasser vollzogen");

INSERT INTO questions (question_id, kat, question) VALUES (
6,
"Taufe",
"Ich lehne Kindertaufe ab");

-- ============ Kat Abendmahl ================================================

INSERT INTO questions (question_id, kat, question) VALUES (
7,
"Abendmahl",
"Bei dem Abendmahl findet eine Umwandlung des Brotes in den Leib Christi statt");

INSERT INTO questions (question_id, kat, question) VALUES (
8,
"Abendmahl",
"Zum Abendmahl sollten nur Mitglieder der eigenen Konfession zugelassen sein");

INSERT INTO questions (question_id, kat, question) VALUES (
9,
"Abendmahl",
"Zum Abendmahl sollten nur wer getauft ist zugelassen werden");

-- ======================= Bibel =============================================

INSERT INTO questions (question_id, kat, question) VALUES (
10,
"Bibel",
"Als <i>Bibeltreu</i> kann sich nur jemand bezeichnen, der ich die Bibel wortw&ouml;rtlich nimmt.");

INSERT INTO questions (question_id, kat, question) VALUES (
11,
"Bibel",
"Ich akzeptiere die Bibel ist Grundlage des Glaubens und als alleiniger Ma&szuml;stab.");

INSERT INTO questions (question_id, kat, question) VALUES (
12,
"Bibel",
"F&uuml;r mich gibt es noch &uuml;ber den Bibelkanon hinaus B&uuml;cher die von Gott inspiriert sind.");

-- ==================== Kat Gemeinde =========================================


INSERT INTO questions (question_id, kat, question) VALUES (
13,
"Gemeinde",
"Ich glaube an das Priestertum Aller und will das die Gemeinde von Allen gemeinsam geleitet wird.");

INSERT INTO questions (question_id, kat, question) VALUES (
14,
"Gemeinde",
"Mir ist wichtig, das eine Gemeinde autonom ist.");

INSERT INTO questions (question_id, kat, question) VALUES (
15,
"Gemeinde",
"Ich glaube ein Gottesdienst sollte von Priestern (oder Hauptamtlichen) geleitet werden.");

INSERT INTO questions (question_id, kat, question) VALUES (
16,
"Gemeinde",
"Bei (wiederholten) Verfehlungen sollten (uneinsichtige) Mitglied auch aus der Gemeinde ausgeschlossen werden.");

INSERT INTO questions (question_id, kat, question) VALUES (
17,
"Gemeinde",
"Frauen sollen alle Aufgabe in der Gemeinde (einschlie&szlig;lich das Predigen) &uuml;bernehmen k&ouml;nnen.");

INSERT INTO questions (question_id, kat, question) VALUES (
18,
"Gemeinde",
"Zu den Pflichten in der Gemeinde geh&ouml;rt auch das man regelm&auml;&szuml;ig in Erscheinung tritt und sich aktiv einbringt.");

-- ###################### Sexualität #########################################
       
INSERT INTO questions (question_id, kat, question) VALUES (
19,
"Sexualit&auml;t",
"Sex vor der Ehe lehene ich ab.");
       
INSERT INTO questions (question_id, kat, question) VALUES (
20,
"Sexualit&auml;t",
"Die Ehe muss von/vor einer bestimmten Person (Priester) geschlossen werden."); 
       
INSERT INTO questions (question_id, kat, question) VALUES (
21,
"Sexualit&auml;t",
"Erneutes heiraten nach einer Scheidung lehne ich ab."); 

INSERT INTO questions (question_id, kat, question) VALUES (
22,
"Sexualit&auml;t",
"Gleichgeschlechtliche Ehen lehne ich ab."); 

INSERT INTO questions (question_id, kat, question) VALUES (
23,
"Sexualit&auml;t",
"Ich halte (gelebte) Homosexualit&auml;t f&uuml;r eine S&uuml;nde."); 

-- ############################# Gottesdienst ###############################
        
INSERT INTO questions (question_id, kat, question) VALUES (
24,
"Gottesdienst",
"Ein Gottesdienst muss ein bestimmten Ablauf folgen."); 

INSERT INTO questions (question_id, kat, question) VALUES (
25,
"Gottesdienst",
"Stille und Besinnung sind auch im Gottesdienst sehr wichtig."); 

INSERT INTO questions (question_id, kat, question) VALUES (
26,
"Gottesdienst",
"Stille und Besinnung sind auch im Gottesdienst sehr wichtig."); 

INSERT INTO questions (question_id, kat, question) VALUES (
27,
"Gottesdienst",
"Stille und Besinnung sind auch im Gottesdienst sehr wichtig.");

INSERT INTO questions (question_id, kat, question) VALUES (
28,
"Gottesdienst",
"Mir ist wichtig das Musik (Worship) modern ist, ber&uuml;hrt und mitrei&szuml;t.");

INSERT INTO questions (question_id, kat, question) VALUES (
29,
"Gottesdienst",
"Freise Gebet im Gottesdienst ist f&uuml;r mich Zeichen von lebendigen und authentischem Glauben.");

INSERT INTO questions (question_id, kat, question) VALUES (
30,
"Gottesdienst",
"In <i>Zungenreden</i> ist f&uuml;r mich ein Zeichen der Gnadengabe des Heiligen Geistes.");

-- ##################### Erlösung ############################################

INSERT INTO questions (question_id, kat, question) VALUES (
31,
"Erl&ouml;sung",
"Ich glaube das f&uuml;r jeden Menschen kommt eine Zeit, wo er von Gott gerichtet wird.");

INSERT INTO questions (question_id, kat, question) VALUES (
32,
"Erl&ouml;sung",
"Ich glaube es gibt eine H&ouml;lle mit ewiger Verdammnis.");

INSERT INTO questions (question_id, kat, question) VALUES (
33,
"Erl&ouml;sung",
"Menschen k&ouml;nnen auch noch nach ihrem Tod Busse tun um der Verdammnis zu entgehen (Fegefeuer).");

INSERT INTO questions (question_id, kat, question) VALUES (
34,
"Erl&ouml;sung",
"Auf die Erl&ouml;sung hat man keinen Einfluss, Sie wird einem durch die Gnade Gottes zu Teil.");

INSERT INTO questions (question_id, kat, question) VALUES (
35,
"Erl&ouml;sung",
"Wirtschaftlicher Erfolg ist ein Zeichen das man in der Gnade Gottes steht.");

INSERT INTO questions (question_id, kat, question) VALUES (
36,
"Erl&ouml;sung",
"Leid ist eine Strafe Gottes.");

INSERT INTO questions (question_id, kat, question) VALUES (
37,
"Erl&ouml;sung",
"Es kann nur eine Wahrheit geben und deshalb nur ein Weg zur Erl&ouml;sung f&uuml;hren.");

INSERT INTO questions (question_id, kat, question) VALUES (
38,
"Erl&ouml;sung",
"Das Reich Gottes ist schon da. Es ist aber (noch) nicht (f&uuml;r alle) sichtbar.");

INSERT INTO questions (question_id, kat, question) VALUES (
39,
"Erl&ouml;sung",
"Eine Erl&ouml;sung ist schon im Diesseits m&ouml;glich.");

INSERT INTO questions (question_id, kat, question) VALUES (
40,
"Erl&ouml;sung",
"Wehrdienst lehne ich ab.");

-- ######################### Kat. Sonstiges ##################################

INSERT INTO questions (question_id, kat, question) VALUES (
41,
"Sonstiges",
"Politische Aktivit&auml;ten oder Themen haben in der Gemeinde keinen Platz.");

INSERT INTO questions (question_id, kat, question) VALUES (
42,
"Sonstiges",
"Soziales angemahnt sind existenzieller Bestandteil des Evangeliums.");

INSERT INTO questions (question_id, kat, question) VALUES (
43,
"Sonstiges",
"Der Missionsauftrag ist ein wichtiger Bestandteil des Evangeliums.");

INSERT INTO questions (question_id, kat, question) VALUES (
44,
"Sonstiges",
"Ich glaube an Geistheilung.");

INSERT INTO questions (question_id, kat, question) VALUES (
45,
"Sonstiges",
"Kino, Theater, Konzerte und andere K&uuml;nste bergen immer die Gefahr von wichtigen Dingen abgelenkt zu werden.");

INSERT INTO questions (question_id, kat, question) VALUES (
46,
"Sonstiges",
"Alkohol und andere Drogen versperren den Weg zu spiritueller Entwicklung.");

INSERT INTO questions (question_id, kat, question) VALUES (
47,
"Sonstiges",
"Gl&auml;ubige Menschen sollten sich von Weltlichen Dingen fern halten.");

INSERT INTO questions (question_id, kat, question) VALUES (
48,
"Sonstiges",
"In Heilgenbilder und -Skulpturen kann ich Halt und Trost finden.");


-- ########### insert answer ################


COMMIT;