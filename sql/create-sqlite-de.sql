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

-- user_statement mögliche Aussage des users
-- user_description kurze Beschreibung der selben
-- deno_statement mögliche Aussage der Konfession
-- user_description kurze Beschreibung der selben
CREATE TABLE answers (
    answers_nr        INTEGER PRIMARY KEY NOT NULL,
    user_statement         TEXT    NOT NULL,
    user_description       TEXT    NOT NULL,
    deno_statement         TEXT    NOT NULL,
    deno_description       TEXT    NOT NULL
);

-- Speichert das datum des letzten Updates
CREATE TABLE version (
    id_nr             INTEGER PRIMARY KEY NOT NULL,
    update_date       TEXT    NOT NULL
);

INSERT INTO version ( update_date ) VALUES ( date( 'now' ) );

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

    
INSERT INTO answers ( 
    answers_nr, 
    user_statement,   
    user_description,
    deno_statement,
    deno_description
) 
VALUES (
0,
'Trifft NICHT zu',
'Die angegeben Aussage wird vom Benutzer verneint.',
'Trifft NICHT zu',
'Die angegeben Aussage wird vom der Konfession verneint.'
);

INSERT INTO answers ( 
    answers_nr, 
    user_statement,   
    user_description,
    deno_statement,
    deno_description
) VALUES (
1,
'Trifft zu',
'Der gemachten Aussage wird vom Benutzer zugestimmt.',
'Trifft zu',
'Der gemachten Aussage wird vom der Konfession zugestimmt.');

INSERT INTO answers ( 
    answers_nr, 
    user_statement,   
    user_description,
    deno_statement,
    deno_description
)  VALUES (
2,
'Persönliche Entscheidung',
'Der Benutzer möchte des es Jedem selbst überlassen bleibt zu entscheiden.',
'Persönliche Entscheidung',
'Die Konfession überlässt es jedem Mitglied darüber selber zu entscheiden.'
);

INSERT INTO answers ( 
    answers_nr, 
    user_statement,   
    user_description,
    deno_statement,
    deno_description
) VALUES (
3,
'Keine Meinung',
'Der Benutzer hat keine eigenen Meinung und würde die Auffassung der jeweiligen 
 Konfession mittragen/akzeptieren.',
'Ja und Nein',
'Wenn die Ortsgemeinden sehr autonom sind, kann die Antwort unterschiedlich 
 ausfallen. ');


-- ##################### insert questions ####################################

-- ========================= A =================================================

---------------------------- Abstinenz -----------------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
195,
'Abstinenz',
'Kino, Theater, Konzerte und andere Künste bergen immer die Gefahr von wichtigen 
 Dingen abgelenkt zu werden.',
'');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
196,
'Abstinenz',
'Alkohol sowie andere Drogen versperren den Weg zu spiritueller Entwicklung.',
'Hier ist gemeint, dass Abstinenz spirituell geboten ist.');


-- ========================= B =================================================


----------------- Bibel > Eigenschaft und Entstehung ---------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
141,
'Bibel > Eigenschaft und Entstehung',
'Ich glaube an die Unfehlbarkeit und Widerspruchsfreiheit der Bibel',
'Zielt auf die Verbalinspiration ab');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
144,
'Bibel > Eigenschaft und Entstehung',
'Ich glaube an die Realinspiration der Bibel. Dabei muss der historische Kontext 
 beachtet werden.',
'Gemeint ist das nicht die Schrift selbst, wohl aber bestimmte Inhalte oder 
 Ideen der Schrift (von Gott) inspiriert sind. Also überzeitliche religiöse 
 ethische Ideen die kein historischen Anspruch haben. (Quelle: Wikipedia)
 Die s.g. <i>historisch-kritischen Exegese</i> des Bibeltextes wird nicht
 abgelehnt.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
145,
'Bibel > Eigenschaft und Entstehung',
'Die Bibel ist Wort Gottes, von Menschen aufgeschrieben, aber von
 Gottes Geist inspiriert (Personalinspiration)',
'Das genaue Verständnis der Inspiration bleibt hier außen vor. Kann
 Irrtumslosigkeit der Bibel und die Verbalinspiration einschließen.'); 

--------------- Bibel > Schöpfungsgeschichte -----------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
146,
'Bibel > Schöpfungsgeschichte',
'Ich glaube, dass die Welt in 7 Tagen erschaffen wurde und nicht älter als 10.000 Jahre ist.',
'');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
147,
'Bibel > Schöpfungsgeschichte',
'Ich glaube an eine von Gott gesteuerte Evolution.',
'Hier wird die Schöpfungsgeschichte nicht wörtlich verstanden. Dennoch wird Gott
 als der Schöpfer und Lenker verstanden. Hier werden die Anhänger des s.g. 
 <i>Intelligent Design</i> (engl. intelligenter Entwurf) zustimmen.');

---------------------- Bibel > Stellenwert -------------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1410,
'Bibel > Stellenwert',
'Ich glaube das über die Bibel hinaus noch wichtige Lehren mündlich weiter gegeben
 wurden und werden. Deshalb ist mir wichtig das ich meine Kirche in der apostolische 
 Nachfolge (Sukzession) steht.',
'Die apostolische Sukzession sieht die Kontinuität zwischen Urkirche und heutiger 
 Kirche (bzw. der eigenen Konfessionskirche) dadurch gewährleistet, dass eine 
 Kette von Handauflegungen ausgehend von den Aposteln über viele Bischöfe 
 vergangener Tage bis hin zu den heutigen Bischöfen angenommen wird. (aus Wikipedia)');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
142,
'Bibel > Stellenwert',
'Die Bibel ist der verbindliche Maßstab des Glaubens und der
 Lebensführung, an dem sich alles andere messen müsse. ',
'Das zielt auf das <i>sola scriptura</i>(lat. allein die Schrift) ab. ');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
143,
'Bibel > Stellenwert',
'Für mich gibt es noch über den Bibelkanon hinaus Bücher, die von Gott inspiriert 
 sind.',
'');

-- ========================= C =================================================

--------------------------------- Christologie ---------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
111,
'Christologie',
'Jesus Christus ist als Sohn Gottes eines Wesens mit Gott, dem Vater und Schöpfer 
 der Welt, und wird mit ihm zusammen und dem Heiligen Geist als ein Gott angebetet',
'');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
112,
'Christologie',
'Jesus ist nicht Gott sondern nur ein (besonderer) Mensch',
'Die Dreifaltigkeit wird hier verneint.');

-- ========================= D =================================================
-- ========================= E =================================================

------------------------- Eid und Schwur ---------------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1910,
'Eid und Schwur',
'Ich schwöre nicht und lege keine Eide ab.',
'Abgeleitet aus der Bergpredigt: Mt. 5:34.');

-------------------- Endzeit/Eschatologie  -------------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1109,
'Endzeit/Eschatologie',
'Ich erwarten die baldige Wiederkunft Christi. Ich glaube wir leben in der Endzeit',
'Gemeint ist hier ein Kollektives allgemein wahrnehmbar Ereignis. Und keine 
 persönliche Offenbarung. Also das Anbrechen des Reich Gottes, das für Alles
 sichtbar sein wird.');

------------------------ Exegese -----------------------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
148,
'Exegese',
'Ich glaube das auch Nichttheologen die Bibel richtig verstehen können.',
'Wörterbücher, Konkordanzen und Kommentare werden aber nicht abgelehnt.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
149,
'Exegese',
'Jeder Einzelne soll persönlich mit der Bibel umgehen, sie privat und
 in Kleingruppen studieren, auslegen und auf sich wirken lassen. ',
'');

-- ========================= F =================================================


-------------------- Friedenszeugnis / Wehrdienst ------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
199,
'Friedenszeugnis / Wehrdienst',
'Wehrdienst lehne ich kategorisch ab. Ich möchte nicht das Wehrangehörige in 
 meine Gemeinde aufgenommen werden. Bzw. Mitglieder die sich militärischen oder
 paramilitärischen Gruppen anschließen sollten ausgeschlossen werden.',
'Was nicht heißen muss, dass Institutionelle Gewalt (Polizei) zum Aufrechterhaltung 
 des öffentlichen Lebens abgelehnt wird, sofern sie angemessen, gerecht und durch
 Gewaltenteilung kontrolliert wird. Dies trifft für kriegerische Auseinandersetzung
 zweier Staaten nicht zu.');
-- ========================= G =================================================

---------------------------- Gebet ---------------------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
194,
'Gebet',
'Ich glaube das Heilung durch Glaube/Gebet/Gott möglich ist.',
'Hier kann auch Teufelsaustreibung und Wunderheilung gemeint sein. In jedem Fall
 wird Johannes 14, 13-14 wörtlich verstanden');

---------------------- Gebote > Feiertage --------------------------------------
INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1914,
'Gebote > Feiertage',
'Der Sabbat (Samstag statt des Sonntag) ist ein verbindlicher Ruhetag. Die 
 Einhaltung ist Zeichen der Treue gegenüber den Geboten Gottes. Seine Einhaltung
 wird in der Endzeit zum Prüfstein des wahren Glaubens an Gott werden.',
'');

------------------------ Gebote > Speisegebote ---------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1915,
'Gebote > Speisegebote',
'Einige biblischen Speisegebote sollten auch von
 Christen eingehalten werden.',
'Adventisten essen daher beispielsweise kein Schweinefleisch, kein Kaninchen 
 und keine Schalentiere (Muscheln, Krabben). Viele Siebenten-Tags-Adventisten 
 ernähren sich vegetarisch (fleischlos). (Wikipedia). Vgl.  3. Mose, Kapitel 11 
 vs. Mat. 15:11');

---------------------- Gemeinde >  Ämter und Aufgaben --------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
153,
'Gemeinde >  Ämter und Aufgaben',
'Ich glaube, dass ein Gottesdienst und/oder liturgische Handlungen von Priestern 
 (oder anderen Hauptamtlichen) <b>geleitet</b> werden sollte (die geweiht 
 und/oder eine theologische Ausbildung haben).',
'Also keine oder sehr eingeschränkte Leiheinpredigten.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
155,
'Gemeinde >  Ämter und Aufgaben',
'Frauen sollen alle Aufgabe in der Gemeinde (einschließlich des Predigen) 
 übernehmen können.',
'Heute schon fast überall selbstverständlich. Aber nicht z.B. in der Kath. 
 Kirche und bei den Zeugen Jehovas.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1512,
'Gemeinde >  Ämter und Aufgaben',
'Für Liturgische-, Leitungs- und Schulungsaufgaben ist eine formelle theologische
 Ausbildung nicht unbedingt erforderlich.',
'');

---------------------- Gemeinde > Leben in der Gemeinschaft --------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
2004, 
'Gemeinde > Leben in der Gemeinschaft',
'Bei (wiederholten) Verfehlungen sollten (uneinsichtige) Mitglieder aus der 
 Gemeinde ausgeschlossen werden.',
'Klassisches Gegenbeispiel ist die katholische Kirche, die Mitglieder maximal
 vom Abendmahl/Eucharistie (<i>Exkommunikation</i>) ausschließt, aber niemals 
 vollständig die Mitgliedschaft entzieht.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
2006,
'Gemeinde > Leben in der Gemeinschaft',
'Zu den Pflichten in der Gemeinde gehört auch, dass man regelmäßig in Erscheinung 
 tritt und sich aktiv einbringt.',
'Gerade in kleineren autonomen Gemeinden wird das unausgesprochen erwartet.');


INSERT INTO questions (question_id, kat, question, commentary) VALUES (
2010,
'Gemeinde > Leben in der Gemeinschaft',
'Wichtig ist einer persönlichen, bewussten Entscheidung für den
 (christlichen) Glauben und einer persönlichen Beziehung zu Jesus
 Christus (wie ich ihn verstehe), die auch im Alltag Auswirkungen 
 auf das persönliche Handeln haben muss. Eine formale Kirchenmitgliedschaft 
 allein genüge nicht.',
'');


-------------------------- Gemeinde > Leitung ----------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
151,
'Gemeinde > Leitung',
'Ich glaube an das Priestertum Aller und möchte, dass die Gemeinde von Allen 
 gemeinsam geleitet wird (basisdemokratische Abstimmungen oder ähnliches).',
'Der Gegenentwurf wäre eine hierarchische Organisation.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
152,
'Gemeinde > Leitung',
'Mir ist wichtig, dass eine Gemeinde autonom ist.',
'Dies wird auf die Ortsgemeinden der beiden großen <i>Volkskirchen</i> nicht zutreffen.
 Bei den Mennoniten ist das z.B. sehr ausgeprägt.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
157,
'Gemeinde > Leitung',
'Die Gemeinde sollte von den Ältesten und/oder Predigern und/oder Diakonen 
 <b>geleitet</b> werden.',
'Also nicht hierarchisch aber auch nicht basisdemokratisch.');


------------------------- Gesellschaft -----------------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
191,
'Gesellschaft',
'Politische Aktivitäten oder Themen haben in der Gemeinde keinen Platz.',
'Der Glaube ist also in erster Linie Privatangelegenheit. Bzw. Politik wird
 als zu weltlich abgelehnt, wie z.B. bei den Zeugen Jehovas');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
192,
'Gesellschaft',
'Soziales Engagement (in der Welt) ist existenzieller Bestandteil des Evangeliums.',
'Die Frage dahinter ist im Grunde, ob man sich von der sündigen Welt abwendet,
 weil man sein Heil nur in der eigenen Gemeinschaft erwartet, oder ob man den
 Anspruch oder das Ziel hat, die Sünde in der Welt zu bekämpfen und Gutes zu tun.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
197,
'Gesellschaft',
'Gläubige Menschen sollten sich von weltlichen Dingen/Gesellschaft fern halten.',
'');

------------------- Gottesbild -------------------------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1108,
'Gottesbild',
'Ich glaube an ein direkten Eingreifen Gottes in mein Leben.',
'Wunder werden für möglich oder zumindest nicht ausgeschlossen
 gehalten. Es wird aber auch Gottes Wirken aber auch in alltäglichen
 Begebenheitenentdecken gesehen. ');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1110,
'Gottesbild',
'Ich glaube das der Himmlische Vater einst sterblich war, so wie wir jetzt.',
'Dies Erkenntnis wurde dem Propheten Joseph Smith, offenbar. Selbiger wird aber
 nicht von allen als solcher anerkannt. Die Offenbarungen von J.S. lassen sich 
 nicht durch den Biblekanon der wie ihn die meisten Christen anerkennen, stützen.');


----------------------- Gottesdienst -------------------------------------------
        
INSERT INTO questions (question_id, kat, question, commentary) VALUES (
171,
'Gottesdienst',
'Ein Gottesdienst muss einem bestimmten Ablauf (Liturgie) folgen.',
'Gemeint sind feste liturgische Abläufe wie sie z.B. die Kath. Kirche kennt.'); 

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
173,
'Gottesdienst',
'Stille und Besinnung sind mir im Gottesdienst sehr wichtig.',
'Die Quäker halten ihre Gottesdienste in einer meditativen Haltung und mit langen
 Phasen der Stille ab.'); 

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
174,
'Gottesdienst',
'Mir ist wichtig, dass Musik (Worship) modern ist, berührt und mitreißt.',
'Barocke Orgelmusik kann zweifellos auch sehr berührend sein. Das ist hier aber
 nicht gemeint.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
175,
'Gottesdienst',
'Freies Gebet im Gottesdienst ist für mich Zeichen von lebendigem und authentischem 
 Glauben.',
'Gemeint ist, das Redebeiträge, Gebete und Predigten z.T. spontan und unvorbereitet sind.
 Also das Gegenteil eines präzise ausgearbeiteten Textes.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
176,
'Gottesdienst',
'In <i>Zungenreden</i> ist für mich ein Zeichen der Gnadengabe des Heiligen Geistes.',
'');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1707,
'Gottesdienst',
'Eine gewisse Kleiderordnung im Gottesdienst ist mir schon wichtig.',
'Gemeint kann sein: das Männer die Kopfbekleidung abnehmen, Frauen Kopftücher
 tragen, das die Beine mit Stoff bedeckt sind oder das einfach eine angemessen
 feierliche Kleidung erwartet wird.');

------------------- Gottesdienst > Abendmahl/Eucharistie -------------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
131,
'Gottesdienst > Abendmahl/Eucharistie',
'Bei dem Abendmahl findet eine Umwandlung des Brotes in den Leib Christi statt 
 (Transsubstantiation).',
'Zielt auf den Katholizismus ab.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
132,
'Gottesdienst > Abendmahl/Eucharistie',
'Zum Abendmahl/Eucharistie sollten nur Mitglieder der eigenen Konfession oder 
 der selben Überzeugung zugelassen sein',
'Die Katholiken lassen z.B. nur Menschen zu, die ihr Abendmahlsverständnis teilen.
 Andere z.B. nur <i>wiedergeborener Christ</i>, also Menschen
 die ein Bekehrungserlebnis hatten.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
133,
'Gottesdienst > Abendmahl/Eucharistie',
'Zum Abendmahl/Eucharistie sollte nur wer getauft ist zugelassen werden',
'Setzt voraus, das die Taufe auch anerkannt wird (Stichwort: <i>Kindertaufe vs. 
 Glaubenstaufe</i>).');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
134,
'Gottesdienst > Abendmahl/Eucharistie',
'Dem Abendmahl/Eucharistie messe ich keine Bedeutung zu.',
'Das werden z.B. die Quäker bejahen.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
135,
'Gottesdienst > Abendmahl/Eucharistie',
'Das Abendmahl/Eucharistie ist heilig (ein Sakrament).',
'Also relevant für Erlösung bzw. Erwählung.');

-- ========================= H =================================================

------------------- Heil, Erlösung, Rechtfertigung, Errettung ------------------


INSERT INTO questions (question_id, kat, question, commentary) VALUES (
117,
'Heil, Erlösung, Rechtfertigung, Errettung',
'Um gerettet zu werden, muss jemand von der Erlösung durch Jesus gehört haben 
 und diesen Weg persönlich akzeptiert haben.',
'Eine typische evangelikate Position.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
182,
'Heil, Erlösung, Rechtfertigung, Errettung',
'Menschen können verloren gehen, nicht alle Menschen kommen in Gottes Reich',
'Der Gegenentwurf bzw. Überzeug ist die theologische Lehre von der 
 Wiederherstellung aller Dinge am Ende der Zeiten. Die s.g. Apokatastasis oder
 auch <i>Allversöhnung</i>');


INSERT INTO questions (question_id, kat, question, commentary) VALUES (
184,
'Heil, Erlösung, Rechtfertigung, Errettung',
'Auf die Erlösung hat man keinen Einfluss, sie wird einem <b>allein</b> durch 
 die Gnade Gottes zuteil.',
'Gemeint ist hier die <i>Prädestinationslehre</i>. Es liegt allein in der Entscheidung
 Gottes ob man der Sünde verfällt oder errettet wird. Der Gegenentwurf ist das 
 jeder Mensch die freie Wahl hat, Gutes zu tun und dadurch vor Gott gerecht wird.
 Die wird zum Teil als <i>Werkgerechtigkeit</i> bezeichnet.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
185,
'Heil, Erlösung, Rechtfertigung, Errettung',
'Wenn man Gottes Gebote befolgt wird man von Gott auch materiell gesegnet werden' ,
'Hier lautet das Schlagwort: <i>Wohlstandsevangelium</i> (engl.: Prosperity Gospel).
 Der Calvinismus weist z.T. solche Tendenzen auf.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
186,
'Heil, Erlösung, Rechtfertigung, Errettung',
'Leid ist eine Strafe Gottes.',
'');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
187,
'Heil, Erlösung, Rechtfertigung, Errettung',
'Es kann nur eine Wahrheit geben und deshalb nur einen Weg zur Erlösung führen.',
'Hier werden diejenigen zustimmen, die nicht müde werden immer wieder Joh. 14:6 zu
 zitieren.');


--------------------- Heilgenverehrung -----------------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
198,
'Heilgenverehrung',
'In Heilgenbilder und -Skulpturen kann ich Halt und Trost finden.',
'Steht für einigen Christen im Konflikt zu dem Gebot, sich keine Abbilder und Götzen zu machen.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1913,
'Heilgenverehrung',
'Die Verehrung von Heiligen und die bitte um Fürsprache der Selben halte ich 
 für falsch.',
'Die Frage impliziert, das man bestimmte verstorbene für Heilige hält.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1912,
'Heilgenverehrung',
'Ich glaube, an die jungfräuliche Geburt.',
'Also, das Maria nicht von einem Mann/Menschen schwanger war oder je mit
 einem Mann geschlafen hat, bevor Sie Jesus ausgetragen hat.');

-- ========================= I =================================================

-- ========================= J =================================================

--------------- Jenseitsvorstellung  ---------------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
181,
'Jenseitsvorstellung',
'Ich glaube, dass für jeden Menschen eine Zeit kommt, wo er von Gott gerichtet wird.',
'Der Gegenentwurf ist die s.g. <i>Allaussöhnung</i> (Apokatastasis). Also ein gütiger
 Gott der alles nach sieht.');


INSERT INTO questions (question_id, kat, question, commentary) VALUES (
183,
'Jenseitsvorstellung',
'Menschen können auch noch nach ihrem Tod (in irgend einer Form) Buße tun (oder
geläutert werden) um der Verdammnis zu entgehen.',
'Z.B. durch ein Fegefeuer wie bei den Katholiken.');


INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1815,
'Jenseitsvorstellung',

'Der ist Tod ein Zustand des Schlafs. Ein Mensch erlebt die Zeit seines Todes 
 nicht bewusst. Die Menschen kommen <b>nicht</b> direkt nach dem Tod in den Himmel oder 
 in die Hölle. Diese Zeit endet mit der Auferstehung die (im Falle der Gerechten) 
 zur Wiederkunft Christi bzw. (im Falle der Gottlosen) nach dem Millennium 
 geschieht. Es schließt sich dann das Jüngste Gericht an. Dieses endet für die 
 Gottlosen nicht mit einer ewigen Qual in einer feurigen Hölle, sondern mit der 
 endgültigen Vernichtung bzw. Auslöschung',

'Diese Position wird u.a. von den Siebenten-Tags-Adventisten vertreten und
 gegründet mit den Bibelstellen: Koh 9:5+6+10, 1 Thess 4:13, Offb 20 EU');


INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1816,
'Jenseitsvorstellung',

'Meine Vorstellung vom jüngsten Gericht ist, dass jeder dem Reich zugeteilt wird, 
 das er verdient hat. Es gibt vier Orte, wohin wir zugeteilt werden können: 
 das celestiale Reich; das terrestriale Reich, das telestiale Reich, und die 
 äußere Finsternis (das Reich Satans). ',

'Diese Vorstellung wird von den Mormonen vertreten. Mehr Details dazu unter:
 <i>"Plan der Erlösung"</i> im Wiki der Mormonen http://de.mormonwiki.com/');



-- ========================= K =================================================
-- ========================= L =================================================

-- ========================= M =================================================

---------------------- Mission -------------------------------------------------
-- http://de.wikipedia.org/wiki/Mission_%28Christentum%29

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
193,
'Mission',
'Der Missionsauftrag ist ein wichtiger Bestandteil des Evangeliums.',
'Die Überzeugung dahinter ist meistens, dass erst die Bekehrung zur Abkehr von der 
 Sünde führt und das auf diesem Weg die Sünde in der Welt bekämpft wird.');

-- ========================= N =================================================
-- ========================= O =================================================

------------------------- Offenbarung ------------------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
113,
'Offenbarung',
'Gott offenbart sich direkt und jedem Menschen.',
'Das zielt u.a. auf die Auffassungen der Quäker ab. Das sich Gott jedem Menschen
 offenbart, heißt nicht, das jeder Mensch bereit ist, dem Willen Gottes zu folgen.
 Die innere Stimme oder das eigene Gewissen könnte man als eine solche göttliche
 Offenbarung verstehen.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
114,
'Offenbarung',
'Gott offenbart sich in erster Linie durch die Bibel und diese überwiegt alles Andere.',
'Das zielt u.a. auf die Protestanten und den Glaubenssatz ab: <i>allen die Schrift</i>.
 die Quäker z.B. werden hier nicht zustimmen. Für sie ist es der Geist der Bibel,
 also die unmittelbare Offenbarung, der meisten Gewicht beigemessen wird.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
115,
'Offenbarung',
'Gott offenbart sich nur oder vor allem bestimmten Menschen (Propheten) und diese 
haben die Aufgabe den Anderen Gottes willen zu verkünden.',
'Das ist im Grunde die alt testamentarische Sicht.');

-- ========================= P =================================================

----------------------- Papsttum -----------------------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1911,
'Papsttum',
'Ich glaube, in der Ausübung des Lehramt ist der Papstes unfehlbar.',
'');

-- ========================= R =================================================

-------------------------------  Reich Gottes ----------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
188,
'Reich Gottes',
'Das Reich Gottes ist schon da. Es ist aber (noch) nicht (für alle) sichtbar.',
'Das entspricht der Auffassung vom Reich Gottes wie es z.B. bei konservativen
 Quäkern zu finden ist.');

-- ========================= S =================================================

----------------------------- Sexualität ---------------------------------------
       
INSERT INTO questions (question_id, kat, question, commentary) VALUES (
161,
'Sexualität',
'Sex vor der Ehe lehne ich ab.',
'');
       
INSERT INTO questions (question_id, kat, question, commentary) VALUES (
162,
'Sexualität',
'Die Ehe ist heilig also ein Sakrament.',
'Wer hier zustimmt,wird höchstwahrscheinlich eine Scheidung nur im Notfall zustimmen.'); 
       
INSERT INTO questions (question_id, kat, question, commentary) VALUES (
163,
'Sexualität',
'Erneutes Heiraten nach einer Scheidung lehne ich ab.',
''); 

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
164,
'Sexualität',
'Gleichgeschlechtliche Ehen lehne ich ab.',
'Was nicht bedeuten muss, das auch (gelebte) Homosexualität abgelehnt wird.'); 

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
165,
'Sexualität',
'Ich halte (gelebte) Homosexualität für eine Sünde.',
'');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
166,
'Sexualität',
'Schwangerschaftsverhütung lehne ich ab.',
'Prävention vor Geschlechtskrankheiten durch Verwendung von Kondomen wird dadurch
 implizit abgelehnt.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
167,
'Sexualität',
'Schwangerschaftsabbrüche lehne ich grundsätzlich ab. Bei medizinischer 
 Indikation/Notwendigkeit ist der Einzelfall sehr genau zu prüfen.',
'');

---------------------------------- Sünde ---------------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1811,
'Sünde',
'Ich glaube das ein geweihter Priester in Stellvertretung für Gott, nach der
 Beichte die Sünden vergeben kann.',
'');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
189,
'Sünde',
'Eine Erlösung (vom Bösen/ der Sünde) ist schon im Diesseits möglich.',
'Gemeint ist, das ein Leben ohne Sünde möglich ist. Hier wird ein <i>Perfektionismus</i>
 angestrebt, wie er im Pietismus und konservativen Quäkertum. angestrebt wird');

------------------------------ Sünde > Erbsünde --------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1810,
'Sünde > Erbsünde',
'Die Sündhaftigkeit und Schuld setzen den Menschen Gottes Zorn und
Verdammnis aus. Die Erlösung hieraus kann nur durch einen Gnadenakt
Gottes erfolgen und setzt den Glauben an Jesus Christus, seinen
stellvertretenden Opfertod und seine Auferstehung sowie die Bekehrung
und Wiedergeburt durch den Heiligen Geist voraus. ',
'');


INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1812,
'Sünde > Erbsünde',
'Ich glaube an die Erbsünde, die durch den Sündenfall Adams und Evas herbeigeführt 
 worden ist, und an dem ich und jeder Mensch als Nachfahre dieser Ureltern teilhat.',
'Durch die Taufe kommt es zu keiner Aufhebung der Erbsünde; der Christ wird von 
 Gott gerecht gesprochen (Rechtfertigungslehre), nicht gerecht gemacht. Besonders 
 im Calvinismus wird betont, dass die menschliche Natur an und für sich bereits 
 sündig sei, noch vor jeder konkreten Tat. (Wikipedia)');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1813,
'Sünde > Erbsünde',
'Durch den Opfertod Jesus wurde die Erbsünde für alle Menschen vorbehaltlos und 
 bedingungslos gesühnt. Heute müssen sich die Menschen nur noch für die von ihnen
 selbst gemachten Sünden vor Gott rechtfertigen.',
'Die Erbsünde selber wird nicht in Frage gestellt. Nur deren heutige Relevanz.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1814,
'Sünde > Erbsünde',
'Ich glaube an die Erbsünde. Erlösung findet der Mensch durch das Sakrament der 
 Taufe, da der Getaufte dann nicht mehr der Erbsünde unterliegt.',
'');

-- ========================= T =================================================

---------------- Taufe ---------------------------------------------------------
INSERT INTO questions (question_id, kat, question, commentary) VALUES (
121,
'Taufe',
'Die Taufe (mit Wasser/liturgisch) ist Voraussetzung für die Erlösung/Errettung',
'Die konservative Quäker z.B. praktizieren die Taufe nicht als äußerlichen Vorgang. 
 Sie sehen die Taufe in erster Linie als inneren Vorgang. Sie glauben an die Taufe mit
 dem Heiligen Geist (Mt 3,11). Andere werden der Taufe gar keine Bedeutung zumessen.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
122,
'Taufe',
'Die Taufe wird äußerlich durch Wasser vollzogen',
'Einige Konfessionen werden die Taufe als Brauch weiterführen, auch wenn ihr keine
 Relevanz für die Errettung/Erlösung zugesprochen wird. Sie wird als Segnung verstanden.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
123,
'Taufe',
'Ich lehne Kindertaufe ab',
'Also die Befürwortung einer <i>Glaubenstaufe</i>.');

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1204,
'Taufe',
'Die Erwachsenentaufe ist symbolische Bestätigung der Hinwendung zum
<i>Reich Gottes</i> zu verstehen. ',
'');


-- ========================= V =================================================

------------------------ Vorgeburtliches Leben ---------------------------------

INSERT INTO questions (question_id, kat, question, commentary) VALUES (
1916,
'Vorgeburtliches Leben',
'Ich glaube das wir vor unserer Geburt schon ein vorirdische Leben hatten.',
'');



-- =============================================================================





COMMIT;