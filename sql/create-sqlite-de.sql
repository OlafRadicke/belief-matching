BEGIN;

-- ########## create tables ################

CREATE TABLE questions (
    question_id         INTEGER PRIMARY KEY NOT NULL,
    question            TEXT    NOT NULL,
    kat                 TEXT    NOT NULL,
    commentary          TEXT    NOT NULL
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
-- 0 = Trifft nicht zu
-- 1 = Trifft zu
-- 2 = Persönliche Entscheidung
-- 3 = Keine Meinung
    answer_nr           INTEGER NOT NULL,
    commentary          TEXT NOT NULL,
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
    description       TEXT    NOT NULL
);

-- ###########################################################################
-- ##-----------------------------------------------------------------------##
-- ##------------------ inserts --------------------------------------------##
-- ##-----------------------------------------------------------------------##
-- ###########################################################################

-- ############ Weigthtings ##################################################

INSERT INTO weightings ( weighting_nr, description ) VALUES (
0,
"normal");

INSERT INTO weightings ( weighting_nr, description ) VALUES (
1,
"sehr wichtig");

-- ############ Answers ##################################################

INSERT INTO answers ( answers_nr, description ) VALUES (
0,
"trifft NICHT zu");

INSERT INTO answers ( answers_nr, description ) VALUES (
1,
"trifft zu");

INSERT INTO answers ( answers_nr, description ) VALUES (
2,
"Persönliche Entscheidung");

INSERT INTO answers ( answers_nr, description ) VALUES (
3,
"Keine Meinung");

-- ##################### insert questions ####################################
-- ======= kat "Gott" beginnend mit 11... ====================================

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
111,
"Gott",
"Ich glaube an die Dreifaltigkeit",
"Die Frage impliziert, dass Jesus Teil von Gott oder Gott selbst ist, was z.B. 
 die Zeugen Jehovas verneinen würden.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
112,
"Gott",
"Jesus ist nicht Gott sondern nur ein (besonderer) Mensch",
"Die Dreifaltigkeit wird hier verneint.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
113,
"Gott",
"Gott offenbart sich direkt und jedem Menschen.",
"Das zielt u.a. auf die Auffassungen der Quäker ab. Das sich Gott jedem Menschen
 offenbart, heißt nicht, das jeder Mensch bereit ist, dem Willen Gottes zu folgen.
 Die innere Stimme oder das eigene Gewissen könnte man als eine solche göttliche
 Offenbarung verstehen.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
114,
"Gott",
"Gott offenbart sich in erster Linie durch die Bibel und diese überwiegt alles Andere.",
"Das zielt u.a. auf die Protestanten und den Glaubenssatz ab: <i>allen die Schrift</i>.
 die Quäker z.B. werden hier nicht zustimmen. Für sie ist es der Geist der Bibel,
 also die unmittelbare Offenbarung, der meisten Gewicht beigemessen wird.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
115,
"Gott",
"Gott offenbart sich nur bestimmten Menschen (Propheten) und diese 
haben die Aufgabe den Anderen Gottes willen zu verkünden.",
"Das ist im Grunde die alt testamentarische Sicht.");

-- ======== Kat "Taufe" beginnend mit 12... ==================================
INSERT INTO questions (question_id, kat, question, commentary) VALUES (
121,
"Taufe",
"Die Taufe (mit Wasser/liturgisch) ist Voraussetzung für die Erlösung/Errettung",
"Die konservative Quäker z.B. praktizieren die Taufe nicht als äußerlichen Vorgang. 
 Sie sehen die Taufe in erster Linie als inneren Vorgang. Sie glauben an die Taufe mit
 dem Heiligen Geist (Mt 3,11). Andere werden der Taufe gar keine Bedeutung zumessen.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
122,
"Taufe",
"Die Taufe wird äußerlich durch Wasser vollzogen",
"Einige Konfessionen werden die Taufe als Brauch weiterführen, auch wenn ihr keine
 Relevanz für die Errettung/Erlösung zugesprochen wird. Sie wird als Segnung verstanden.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
123,
"Taufe",
"Ich lehne Kindertaufe ab",
"Also die Befürwortung einer <i>Glaubenstaufe</i>.");

-- ============ Kat Abendmahl beginnend mit 13... ============================

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
131,
"Abendmahl",
"Bei dem Abendmahl findet eine Umwandlung des Brotes in den Leib Christi statt (Transsubstantiation).",
"Zielt auf den Katholizismus ab.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
132,
"Abendmahl",
"Zum Abendmahl sollten nur Mitglieder der eigenen Konfession zugelassen sein",
"Die Katholiken lassen z.B. nur Menschen zu, die ihr Abendmahlsverständnis teilen.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
133,
"Abendmahl",
"Zum Abendmahl sollte nur wer getauft ist zugelassen werden",
"Setzt voraus, das die Taufe auch anerkannt wird (Stichwort: <i>Kindertaufe vs. 
 Glaubenstaufe</i>).");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
134,
"Abendmahl",
"Dem Abendmahl messe ich keine Bedeutung zu.",
"Das werden z.B. die Quäker bejahen.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
135,
"Abendmahl",
"Das Abendmahl ist heilig (ein Sakrament).",
"Also relevant für Erlösung bzw. Erwählung.");

-- ======================= Bibel beginnend mit 14... =========================

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
141,
"Bibel",
"Als <i>bibeltreu</i> kann sich nur jemand bezeichnen, der die Bibel wortwörtlich nimmt.",
"Quäker werden diese Aussage z.B. verneinen, da sie den <i>Geist der Bibel</i> 
 für entscheidend halten. Nach ihrem Verständnis ist <i>bibeltreu</i> wer in 
 diesem Geist lebt und handelt.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
142,
"Bibel",
"Ich akzeptiere nur die Bibel als Grundlage des Glaubens und als alleinigen Maßstab.",
"Das zielt auf das <i>sola scriptura</i>(lat. allein die Schrift) ab, also das Dienen
 gemäß der Evangelischen Theologie");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
143,
"Bibel",
"Für mich gibt es noch über den Bibelkanon hinaus Bücher, die von Gott inspiriert sind.",
"Liberale Quäker und Mormonen dürfen hier zustimmen.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
144,
"Bibel",
"Die Bibel bedarf immer einer Auslegung. Dabei muss der historische Kontext beachtet werden.",
"Gemeint ist die s.g. <i>historisch-kritischen Exegese</i> des Bibeltextes.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
145,
"Bibel",
"Die Bibel bedarf immer einer Auslegung. Dabei muss man sich dem Geist der Bibel öffnen.",
"Gemeint ist, dass eine pietistische Position vertreten wird, der Wunsch nach 
Verifizierbarkeit des persönlichen Glaubens und Handelns. Eine Wahrheit wird der
Bibel unhinterfragt unterstellt. Diese Wahrheit muss aber entdeckt und verstanden werden.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
146,
"Bibel",
"Ich glaube, dass die Welt in 7 Tagen erschaffen wurde und nicht älter als 10.000 Jahre ist.",
"");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
147,
"Bibel",
"Ich glaube an eine von Gott gesteuerte Evolution.",
"Hier wird die Schöpfungsgeschichte nicht wörtlich verstanden. Dennoch wird Gott
 als der Schöpfer und Lenker verstanden. Hier werden die Anhänger des s.g. 
 <i>Intelligent Design</i> (engl. intelligenter Entwurf) zustimmen.");

-- ==================== Kat Gemeinde beginnend mit 15... =====================

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
151,
"Gemeinde",
"Ich glaube an das Priestertum Aller und möchte, dass die Gemeinde von Allen 
 gemeinsam geleitet wird (demokratische Abstimmungenen oder ähnliches).",
"Der Gegenentwurf wäre eine Hierarchische Organisation.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
152,
"Gemeinde",
"Mir ist wichtig, dass eine Gemeinde autonom ist.",
"Dies wird auf die Ortsgemeinden der beiden großen <i>Volkskirchen</i> nicht zutreffen.
 Bei den Mennoniten ist das z.B. sehr ausgeprägt.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
153,
"Gemeinde",
"Ich glaube, dass ein Gottesdienst von Priestern (oder Hauptamtlichen) geleitet werden sollte.",
"Also keine oder sehr eingeschränkte Leiheinpredigten.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
154,
"Gemeinde",
"Bei (wiederholten) Verfehlungen sollten (uneinsichtige) Mitglieder aus der 
 Gemeinde ausgeschlossen werden, wie z.B. bei den Zeugen Jehovas",
"Klassisches Gegenbeispiel ist die katholische Kirche, die Mitglieder maximal
 vom Abendmahl (<i>Exkommunikation</i>) ausschließt, aber niemals 
 vollständig die Mitgliedschaft entzieht.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
155,
"Gemeinde",
"Frauen sollen alle Aufgabe in der Gemeinde (einschließlich des Predigen) übernehmen können.",
"Heute schon fast überall selbstverständlich. Aber nicht z.B. in der Kath. Kirche und bei den Zeugen Jehovas.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
156,
"Gemeinde",
"Zu den Pflichten in der Gemeinde gehört auch, dass man regelmäßig in Erscheinung 
 tritt und sich aktiv einbringt.",
"Gerade in kleineren autonomen Gemeinden wird das unausgesprochen erwartet.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
157,
"Gemeinde",
"Die Gemeinde sollte von den Ältesten und/oder Predigern und/oder Diakonen geleitete werden.",
"Also nicht hierarchisch aber auch nicht basisdemokratisch.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
158,
"Gemeinde",
"Die Gemeindeleitung sollte von einer Höheren Instanz bestimmt/eingesetzt werden.",
"Also hierarchische Strukturen.");

-- ==================== Kat. Sexualität beginnend mit 16... ===================
       
INSERT INTO questions (question_id, kat, question, commentary) VALUES (
161,
"Sexualität",
"Sex vor der Ehe lehene ich ab.",
"");
       
INSERT INTO questions (question_id, kat, question, commentary) VALUES (
162,
"Sexualität",
"Die Ehe ist heilig also ein Sakrament.",
"Wer hier zustimmt,wird höchstwahrscheinlich eine Scheidung nur im Notfall zustimmen."); 
       
INSERT INTO questions (question_id, kat, question, commentary) VALUES (
163,
"Sexualität",
"Erneutes Heiraten nach einer Scheidung lehne ich ab.",
""); 

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
164,
"Sexualität",
"Gleichgeschlechtliche Ehen lehne ich ab.",
"Was nicht bedeuten muss, das auch (gelebte) Homosexualität abgelehnt wird."); 

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
165,
"Sexualität",
"Ich halte (gelebte) Homosexualität für eine Sünde.",
"");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
166,
"Sexualität",
"Schwangerschaftsverhütung lehne ich ab.",
"Prävention vor Geschlechtskrankheiten durch Verwendung von Kondomen wird dadurch
 implizit abgelehnt.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
167,
"Sexualität",
"Schwangerschaftsabbrüche lehne ich kategorisch ab.",
"Extrem Fälle, wo der Tod der Mutter billigend in Kauf genommen wird, sind hier
 nicht gemeint.");

-- ============================= Kat. Gottesdienst beginnend mit 17... =======
        
INSERT INTO questions (question_id, kat, question, commentary) VALUES (
171,
"Gottesdienst",
"Ein Gottesdienst muss einem bestimmten Ablauf (Liturgie) folgen.",
"Gemeint sind feste liturgische Abläufe wie sie z.B. die Kath. Kirche kennt."); 

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
173,
"Gottesdienst",
"Stille und Besinnung sind mir im Gottesdienst sehr wichtig.",
"Die Quäker halten ihre Gottesdienste in einer meditativen Haltung und mit langen
 Phasen der Stille ab."); 

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
174,
"Gottesdienst",
"Mir ist wichtig, dass Musik (Worship) modern ist, berührt und mitreißt.",
"Barocke Orgelmusik kann zweifellos auch sehr berührend sein. Das ist hier aber
 nicht gemeint.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
175,
"Gottesdienst",
"Freies Gebet im Gottesdienst ist für mich Zeichen von lebendigem und authentischem 
 Glauben.",
"Gemeint ist, das Redebeiträge, Gebete und Predigten z.T. spontan und unvorbereitet sind.
 Also das Gegenteil eines präzise ausgearbeiteten Textes.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
176,
"Gottesdienst",
"In <i>Zungenreden</i> ist für mich ein Zeichen der Gnadengabe des Heiligen Geistes.",
"");

-- ====================== Kat. Erlösung beginnend mit 18... ==================

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
181,
"Erlösung",
"Ich glaube, dass für jeden Menschen kommt eine Zeit, wo er von Gott gerichtet wird.",
"Der Gegenentwurf ist die s.g. <i>Allaussöhnung</i> (Apokatastasis). Also ein gütiger
 Gott der alles nach sieht.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
182,
"Erlösung",
"Ich glaube, dass es eine Hölle mit ewiger Verdammnis gibt.",
"");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
183,
"Erlösung",
"Menschen können auch noch nach ihrem Tod Buße tun, um der Verdammnis zu entgehen (Fegefeuer).",
"");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
184,
"Erlösung",
"Auf die Erlösung hat man keinen Einfluss, sie wird einem durch die Gnade Gottes zuteil.",
"Gemeint ist hier die <i>Prädestinationslehre</i>. Es liegt allein in der Entscheidung
 Gottes ob man der Sünde verfällt oder errettet wird. Der Gegenentwurf ist die s.g.
 <i>Werkgerechtigkeit</i>");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
185,
"Erlösung",
"Wirtschaftlicher Erfolg ist ein Zeichen dafür, dass man in der Gnade Gottes steht.",
"Hier lautet das Schlagwort: <i>Wohlstandsevangelium</i> (engl.: Prosperity Gospel).
 Der Calvinismus weist z.T. solche Tendenzen auf.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
186,
"Erlösung",
"Leid ist eine Strafe Gottes.",
"");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
187,
"Erlösung",
"Es kann nur eine Wahrheit geben und deshalb nur einen Weg zur Erlösung führen.",
"Hier werden diejenigen zustimmen, die nicht müde werden immer wieder Joh. 14:6 zu
 zitieren.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
188,
"Erlösung",
"Das Reich Gottes ist schon da. Es ist aber (noch) nicht (für alle) sichtbar.",
"Das entspricht der Auffassung vom Reich Gottes wie es z.B. bei konservativen
 Quäkern zu finden ist.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
189,
"Erlösung",
"Eine Erlösung (vom Bösen/ der Sünde) ist schon im Diesseits möglich.",
"Gemeint ist, das ein Leben ohne Sünde möglich ist. Hier wird ein <i>Perfektionismus</i>
 angestrebt, wie er im Pietismus und konservativen Quäkertum. angestrebt wird");


-- ========================= Kat. Sonstiges beginnend mit 19... ==============

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
191,
"Sonstiges",
"Politische Aktivitäten oder Themen haben in der Gemeinde keinen Platz.",
"Der Glaube ist also in erster Linie Privatangelegenheit. Bzw. Politik wird
 als zu weltlich abgelehnt, wie z.B. bei den Zeugen Jehovas");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
192,
"Sonstiges",
"Soziales Engagement (in der Welt) ist existenzieller Bestandteil des Evangeliums.",
"Die Frage dahinter ist im Grunde, ob man sich von der sündigen Welt abwendet,
 weil man sein Heil nur in der eigenen Gemeinschaft erwartet, oder ob man den
 Anspruch oder das Ziel hat, die Sünde in der Welt zu bekämpfen und Gutes zu tun.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
193,
"Sonstiges",
"Der Missionsauftrag ist ein wichtiger Bestandteil des Evangeliums.",
"Die Überzeugung dahinter ist meistens, dass erst die Bekehrung zur Abkehr von der 
 Sünde führt und das auf diesem Weg die Sünde in der Welt bekämpft wird.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
194,
"Sonstiges",
"Ich glaube an Geistheilung.",
"Also Teufelsaustreibung und/oder Wunderheilung.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
195,
"Sonstiges",
"Kino, Theater, Konzerte und andere Künste bergen immer die Gefahr von wichtigen Dingen abgelenkt zu werden.",
"");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
196,
"Sonstiges",
"Alkohol und/oder andere Drogen versperren den Weg zu spiritueller Entwicklung.",
"Hier ist gemeint, dass Abstinenz spirituell geboten ist.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
197,
"Sonstiges",
"Gläubige Menschen sollten sich von weltlichen Dingen/Gesellschaft fern halten.",
"");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
198,
"Sonstiges",
"In Heilgenbilder und -Skulpturen kann ich Halt und Trost finden.",
"Steht für einigen Christen im Konflikt zu dem Gebot, sich keine Abbilder und Götzen zu machen.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
199,
"Erlösung",
"Wehrdienst lehne ich ab.",
"Was nicht heißen muss, dass Institutionelle Gewalt (Polizei) zum Aufrechterhaltung 
 des öffentlichen Lebens abgelehnt wird, sofern sie angemessen, gerecht und durch
 Gewaltenteilung kontrolliert wird. Dies trifft für kriegerische Auseinandersetzung
 zweier Staaten nicht zu.");

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1910,
"Erlösung",
"Ich schwöre nicht und lege keine Eide ab.",
"Abgeleitet aus der Bergpredigt: Mt. 5:34.");

COMMIT;