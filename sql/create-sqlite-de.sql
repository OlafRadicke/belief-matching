BEGIN;

-- ########## create tables ################

CREATE TABLE questions (
    question_id         INTEGER PRIMARY KEY NOT NULL,
    question            TEXT    NOT NULL,
    kat                 TEXT    NOT NULL
);

CREATE TABLE denominations (
    denomination_id     INTEGER PRIMARY KEY NOT NULL,
    denomination        TEXT    NOT NULL,
    url                 TEXT    NOT NULL
);

CREATE TABLE denomination_answers (
    answer_id           INTEGER PRIMARY KEY AUTOINCREMENT,
    question_id         INTEGER NOT NULL,
    denomination_id     INTEGER NOT NULL,
-- 0 = trifft nicht zu
-- 1 = trifft zu
-- 2 = keine Meinung
    answer_nr           INTEGER NOT NULL,
    FOREIGN KEY ( question_id )     REFERENCES question ( question_id ),
    FOREIGN KEY ( denomination_id ) REFERENCES denominations ( denomination_id )
    FOREIGN KEY ( answer_nr )       REFERENCES answers ( answer_nr )
);

CREATE TABLE weightings (
    weighting_nr        INTEGER PRIMARY KEY NOT NULL,
    description         TEXT    NOT NULL
);

CREATE TABLE answers (
    answers_nr        INTEGER PRIMARY KEY NOT NULL,
    description         TEXT    NOT NULL
);

-- ###########################################################################
-- ##-----------------------------------------------------------------------##
-- ##------------------ inserts --------------------------------------------##
-- ##-----------------------------------------------------------------------##
-- ###########################################################################

-- ############ Weigthtings ##################################################

-- INSERT INTO weightings ( weighting_nr, description ) VALUES (
-- 0,
-- "unwichtig");

INSERT INTO weightings ( weighting_nr, description ) VALUES (
0,
"normal");

INSERT INTO weightings ( weighting_nr, description ) VALUES (
1,
"sehr wichtig");

-- ############ Answers ##################################################

INSERT INTO answers ( answers_nr, description ) VALUES (
0,
"trifft nicht zu");

INSERT INTO answers ( answers_nr, description ) VALUES (
1,
"trifft zu");

INSERT INTO answers ( answers_nr, description ) VALUES (
2,
"keine Meinung");

-- ##################### insert questions ####################################
-- ======= kat "Gott" beginnend mit 11... ====================================

INSERT INTO questions (question_id, kat, question) VALUES (
111,
"Gott",
"Ich glaube an die dreifaltigkeit");

INSERT INTO questions (question_id, kat, question) VALUES (
112,
"Gott",
"Jesus ist nicht Gott sondern nur ein (besonderer) Mensch");

INSERT INTO questions (question_id, kat, question) VALUES (
113,
"Gott",
"Gott offenbart sich direkt, auch ohne die Bibel und Klerus");

-- ======== Kat "Taufe" beginnend mit 12... ==================================
INSERT INTO questions (question_id, kat, question) VALUES (
121,
"Taufe",
"Die Taufe (mit Wasser/liturgisch) ist Voraussetzung f&uuml;r die Erl&ouml;sung/Errettung");

INSERT INTO questions (question_id, kat, question) VALUES (
122,
"Taufe",
"Die Taufe wird &auml;u&szlig;erlich durch Wasser vollzogen");

INSERT INTO questions (question_id, kat, question) VALUES (
123,
"Taufe",
"Ich lehne Kindertaufe ab");

INSERT INTO questions (question_id, kat, question) VALUES (
124,
"Taufe",
"Ich lehne die &auml;ussere Taufe ab.");

-- ============ Kat Abendmahl beginnend mit 13... ============================

INSERT INTO questions (question_id, kat, question) VALUES (
131,
"Abendmahl",
"Bei dem Abendmahl findet eine Umwandlung des Brotes in den Leib Christi statt");

INSERT INTO questions (question_id, kat, question) VALUES (
132,
"Abendmahl",
"Zum Abendmahl sollten nur Mitglieder der eigenen Konfession zugelassen sein");

INSERT INTO questions (question_id, kat, question) VALUES (
133,
"Abendmahl",
"Zum Abendmahl sollten nur wer getauft ist zugelassen werden");

INSERT INTO questions (question_id, kat, question) VALUES (
134,
"Abendmahl",
"Dem Abendmahl messe ich keine Bedeutung zu.");

INSERT INTO questions (question_id, kat, question) VALUES (
135,
"Abendmahl",
"Das Abendmahl ist heilig (ein Sakrament).");

-- ======================= Bibel beginnend mit 14... =========================

INSERT INTO questions (question_id, kat, question) VALUES (
141,
"Bibel",
"Als <i>Bibeltreu</i> kann sich nur jemand bezeichnen, der ich die Bibel wortw&ouml;rtlich nimmt.");

INSERT INTO questions (question_id, kat, question) VALUES (
142,
"Bibel",
"Ich akzeptiere nur die Bibel als Grundlage des Glaubens und als alleiniger Ma&szlig;stab.");

INSERT INTO questions (question_id, kat, question) VALUES (
143,
"Bibel",
"F&uuml;r mich gibt es noch &uuml;ber den Bibelkanon hinaus B&uuml;cher die von Gott inspiriert sind.");

INSERT INTO questions (question_id, kat, question) VALUES (
144,
"Bibel",
"Die Bibel bedarf immer einer Auslegung. Dabei muss der historische Kontext beachtet werden.");

INSERT INTO questions (question_id, kat, question) VALUES (
145,
"Bibel",
"Die Bibel bedarf immer einer Auslegung. Dabei muss man sich dem Geist der Bibel &ouml;ffnen.");

-- ==================== Kat Gemeinde beginnend mit 15... =====================

INSERT INTO questions (question_id, kat, question) VALUES (
151,
"Gemeinde",
"Ich glaube an das Priestertum Aller und will das die Gemeinde von Allen 
gemeinsam geleitet wird (demokratische Abstimmungenen oder &auml;hnliches).");

INSERT INTO questions (question_id, kat, question) VALUES (
152,
"Gemeinde",
"Mir ist wichtig, das eine Gemeinde autonom ist.");

INSERT INTO questions (question_id, kat, question) VALUES (
153,
"Gemeinde",
"Ich glaube ein Gottesdienst sollte von Priestern (oder Hauptamtlichen) geleitet werden.");

INSERT INTO questions (question_id, kat, question) VALUES (
154,
"Gemeinde",
"Bei (wiederholten) Verfehlungen sollten (uneinsichtige) Mitglied auch aus der Gemeinde ausgeschlossen werden.");

INSERT INTO questions (question_id, kat, question) VALUES (
155,
"Gemeinde",
"Frauen sollen alle Aufgabe in der Gemeinde (einschlie&szlig;lich das Predigen) &uuml;bernehmen k&ouml;nnen.");

INSERT INTO questions (question_id, kat, question) VALUES (
156,
"Gemeinde",
"Zu den Pflichten in der Gemeinde geh&ouml;rt auch das man regelm&auml;&szlig;ig in Erscheinung tritt und sich aktiv einbringt.");

INSERT INTO questions (question_id, kat, question) VALUES (
157,
"Gemeinde",
"Die Gemeinde sollte von den &Auml;ltesten und/oder Predigern und/oder Diakonen geleitete werden.");

INSERT INTO questions (question_id, kat, question) VALUES (
158,
"Gemeinde",
"Die Gemeindeleitung sollte von einer H&ouml;heren Instanz bestimmt werden.");
-- ==================== Kat. Sexualität beginnend mit 16... ===================
       
INSERT INTO questions (question_id, kat, question) VALUES (
161,
"Sexualit&auml;t",
"Sex vor der Ehe lehene ich ab.");
       
INSERT INTO questions (question_id, kat, question) VALUES (
162,
"Sexualit&auml;t",
"Die Ehe ist heilig."); 
       
INSERT INTO questions (question_id, kat, question) VALUES (
163,
"Sexualit&auml;t",
"Erneutes heiraten nach einer Scheidung lehne ich ab."); 

INSERT INTO questions (question_id, kat, question) VALUES (
164,
"Sexualit&auml;t",
"Gleichgeschlechtliche Ehen lehne ich ab."); 

INSERT INTO questions (question_id, kat, question) VALUES (
165,
"Sexualit&auml;t",
"Ich halte (gelebte) Homosexualit&auml;t f&uuml;r eine S&uuml;nde."); 

-- ============================= Kat. Gottesdienst beginnend mit 17... =======
        
INSERT INTO questions (question_id, kat, question) VALUES (
171,
"Gottesdienst",
"Ein Gottesdienst muss ein bestimmten Ablauf (Liturgie) folgen."); 

INSERT INTO questions (question_id, kat, question) VALUES (
173,
"Gottesdienst",
"Stille und Besinnung sind mir auch im Gottesdienst sehr wichtig."); 

INSERT INTO questions (question_id, kat, question) VALUES (
174,
"Gottesdienst",
"Mir ist wichtig das Musik (Worship) modern ist, ber&uuml;hrt und mitrei&szlig;t.");

INSERT INTO questions (question_id, kat, question) VALUES (
175,
"Gottesdienst",
"Freies Gebet im Gottesdienst ist f&uuml;r mich Zeichen von lebendigen und authentischem Glauben.");

INSERT INTO questions (question_id, kat, question) VALUES (
176,
"Gottesdienst",
"In <i>Zungenreden</i> ist f&uuml;r mich ein Zeichen der Gnadengabe des Heiligen Geistes.");

-- ====================== Kat. Erlösung beginnend mit 18... ==================

INSERT INTO questions (question_id, kat, question) VALUES (
181,
"Erl&ouml;sung",
"Ich glaube das f&uuml;r jeden Menschen kommt eine Zeit, wo er von Gott gerichtet wird.");

INSERT INTO questions (question_id, kat, question) VALUES (
182,
"Erl&ouml;sung",
"Ich glaube es gibt eine H&ouml;lle mit ewiger Verdammnis.");

INSERT INTO questions (question_id, kat, question) VALUES (
183,
"Erl&ouml;sung",
"Menschen k&ouml;nnen auch noch nach ihrem Tod Busse tun um der Verdammnis zu entgehen (Fegefeuer).");

INSERT INTO questions (question_id, kat, question) VALUES (
184,
"Erl&ouml;sung",
"Auf die Erl&ouml;sung hat man keinen Einfluss, Sie wird einem durch die Gnade Gottes zu Teil.");

INSERT INTO questions (question_id, kat, question) VALUES (
185,
"Erl&ouml;sung",
"Wirtschaftlicher Erfolg ist ein Zeichen das man in der Gnade Gottes steht.");

INSERT INTO questions (question_id, kat, question) VALUES (
186,
"Erl&ouml;sung",
"Leid ist eine Strafe Gottes.");

INSERT INTO questions (question_id, kat, question) VALUES (
187,
"Erl&ouml;sung",
"Es kann nur eine Wahrheit geben und deshalb nur ein Weg zur Erl&ouml;sung f&uuml;hren.");

INSERT INTO questions (question_id, kat, question) VALUES (
188,
"Erl&ouml;sung",
"Das Reich Gottes ist schon da. Es ist aber (noch) nicht (f&uuml;r alle) sichtbar.");

INSERT INTO questions (question_id, kat, question) VALUES (
189,
"Erl&ouml;sung",
"Eine Erl&ouml;sung ist schon im Diesseits m&ouml;glich.");


-- ========================= Kat. Sonstiges beginnend mit 19... ==============

INSERT INTO questions (question_id, kat, question) VALUES (
191,
"Sonstiges",
"Politische Aktivit&auml;ten oder Themen haben in der Gemeinde keinen Platz.");

INSERT INTO questions (question_id, kat, question) VALUES (
192,
"Sonstiges",
"Soziales Engagement (in der Welt) sind existenzieller Bestandteil des Evangeliums.");

INSERT INTO questions (question_id, kat, question) VALUES (
193,
"Sonstiges",
"Der Missionsauftrag ist ein wichtiger Bestandteil des Evangeliums.");

INSERT INTO questions (question_id, kat, question) VALUES (
194,
"Sonstiges",
"Ich glaube an Geistheilung.");

INSERT INTO questions (question_id, kat, question) VALUES (
195,
"Sonstiges",
"Kino, Theater, Konzerte und andere K&uuml;nste bergen immer die Gefahr von wichtigen Dingen abgelenkt zu werden.");

INSERT INTO questions (question_id, kat, question) VALUES (
196,
"Sonstiges",
"Alkohol und/oder andere Drogen versperren den Weg zu spiritueller Entwicklung.");

INSERT INTO questions (question_id, kat, question) VALUES (
197,
"Sonstiges",
"Gl&auml;ubige Menschen sollten sich von Weltlichen Dingen/Gesellschaft fern halten.");

INSERT INTO questions (question_id, kat, question) VALUES (
198,
"Sonstiges",
"In Heilgenbilder und -Skulpturen kann ich Halt und Trost finden.");

INSERT INTO questions (question_id, kat, question) VALUES (
199,
"Erl&ouml;sung",
"Wehrdienst lehne ich ab.");

INSERT INTO questions (question_id, kat, question) VALUES (
1910,
"Erl&ouml;sung",
"Ich schw&ouml;re nicht und lege keine Eide ab.");

COMMIT;