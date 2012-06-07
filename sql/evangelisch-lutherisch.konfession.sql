BEGIN;


-- ###########################################################################
-- #################### insert denomination_answers #######################################
-- ###########################################################################

-- ===================== Konservative Quaker =================================


-- ################ Eindeutige ID für Konfession setzen #####################
INSERT INTO denominations ( denomination_id, denomination, url ) VALUES (
6,
"Evangelisch-lutherische Kirchen",
"http://de.wikipedia.org/wiki/Evangelisch-lutherische_Kirchen");

-- ################  Frage mit Konfession verknüpfen. #######################
-- 0 = Trifft nicht zu
-- 1 = Trifft zu
-- 2 = Persönliche Entscheidung
-- 3 = Keine Meinung

-- ======= kat "Gott" beginnend mit 11... ====================================
-- "Ich glaube an die Dreifaltigkeit"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 
111, 
6, 
1, 
"Es wird die Lehre der Dreifaltigkeit vertreten.");

-- "Jesus ist nicht Gott sondern nur ein (besonderer) Mensch"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 
112, 
6, 
0, 
"Nein er ist Teil der Dreifaltigkeit.");

-- "Gott offenbart sich direkt jedem Menschen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 
113, 
6, 
0, 
"Nein. Der persönliche Offenbarung wird keine große Rolle beigemessen.");

--"Gott offenbart sich durch die Bibel."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 
114, 
6, 
1, 
"Die Bibel ist die einzige Grundlage für das theologische Urteilen oder Verurteilen. ");

-- "Gottes offenbart sich nur bestimmten Menschen (Propheten) und diese dienen 
-- haben die Aufgabe den Anderen Gotteswillen zu verkünden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 115, 6, 0, 
"Dem Prophetisch wird keine große Bedeutung zugeschrieben.");

-- ======== Kat "Taufe" beginnend mit 12... ==================================
-- "Die Taufe (mit Wasser/liturgisch) ist Voraussetzung für die 
-- Erlösung/Errettung"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 121, 6, 1, 
"Die Taufe ist <i>heilig</i> also ein Sakrament und Voraussetzung für die Errettung");

-- "Die Taufe wird äußerlich durch Wasser vollzogen"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 122, 6, 1, "Ja, aber nicht durch untertauhen.");

-- "Ich lehne Kindertaufe ab"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 123, 6, 0, "Die Kindertaufe ist sehr gebräuchlich und die Regel.");

-- ============ Kat Abendmahl beginnend mit 13... ============================

-- "Bei dem Abendmahl findet eine Umwandlung des Brotes in den Leib Christi statt"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 131, 6, 0, "Die Gegenwart Christi im Heiligen Abendmahl wird als 
 <i>Realpräsenz</i> verstanden: Christi Leib und Blut werden unter Brot und Wein 
 ausgeteilt und empfangen. ");

-- "Zum Abendmahl sollten nur Mitglieder der eigenen Konfession zugelassen sein"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 132, 6, 1, "Entscheidend ist die Anerkennung der Taufe. Und nicht von 
 allen Konfessionen/Kirchen wird die Taufe anerkannt.");

-- "Zum Abendmahl sollten nur wer getauft ist zugelassen werden"
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 133, 6, 1, "Ja, nur getaufte sind zugelassen. In der konkreten Praxis
 wird davon aber oft abgewichen");

-- "Dem Abendmahl messe ich keine Bedeutung zu."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 134, 6, 0, "Die Abendmalfeier ist ein wichtiger Bestandteil im Glauben
 und Leben der Ev.Luth-Kirche.");

-- "Das Abendmahl ist heilig (ein Sakrament)."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 135, 6, 1, "Ja, das trifft hier zu.");

-- ======================= Bibel beginnend mit 14... =========================
-- "Als <i>Bibeltreu</i> kann sich nur jemand bezeichnen, der ich die Bibel 
-- wortwörtlich nimmt."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 141, 6, 0, 
"Die Bibel ist sehr wichtig, aber sie wird nicht wort-wörtlich ausgelegt.");

-- "Ich akzeptiere nur die Bibel als Grundlage des Glaubens und als alleiniger 
-- Maßstab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 142, 6, 1, 
"Ja: <i>sola scriptura</i>!");

-- "Für mich gibt es noch über den Bibelkanon hinaus Bücher 
-- die von Gott inspiriert sind."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 143, 6, 0, 
"Nein. In der Lutherbibel fehlen sogar einige Bücher, die in der Kath. Bibel zufinden sind.");

-- "Die Bibel bedarf immer einer Auslegung. Dabei muss der historische Kontext 
-- beachtet werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 144, 6, 1,
"Die wissenschaftliche Betrachtung (historisch-kritisch) wird in der Regel propagiert.");

-- "Die Bibel bedarf immer einer Auslegung. Dabei muss man sich dem Geist der 
-- Bibel öffnen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 145, 6, 0, 
"Die notwendigkeit einer Auslegung wird zwar bejat, aber aus einer wissenschaftlichen
 (historisch-kritischen) Perspektive. Das Konzept - <i>Geist der Bibel</i> - ist
 dem er fremd.");

-- "Ich glaube, dass die Welt in 7 Tagen erschaffen wurde und nicht älter 
-- ist als 10.000 Jahre."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 146, 6, 0, 
"Nein, das widerspricht dem Stand der Wissenschaft. Auch wenn auf dem Grundsatz 
 <i>sola scriptura</i> viel Wert gelegt wird.");

-- "Ich glaube an eine von Gott gesteuerte Evolution."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 147, 6, 1, 
"Ja, eine völlige Bedeutungslosigkeit für die Schöpfung will man in Gott nicht sehen.");

-- ==================== Kat Gemeinde beginnend mit 15... =====================

-- "Ich glaube an das Priestertum Aller und will das die Gemeinde von Allen 
-- gemeinsam geleitet wird (demokratische Abstimmungenen oder ähnliches).")."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 151, 6, 0, 
"Die Ev.-Luth. ist hierarchisch geordnet. Liturgische Handlungen werden in aller
 Regel von Priestern durchgeführt.");

-- "Mir ist wichtig, das eine Gemeinde autonom ist."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 152, 6, 0, 
"Das ist nicht der Fall");

-- "Ich glaube ein Gottesdienst sollte von Priestern (oder Hauptamtlichen) 
-- geleitet werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 153, 6, 1, "Liturgische Handlungen werden in aller
 Regel von Priestern durchgeführt. Auch das Predigen ist in der Regel Priestern 
 vorbehalten.");

-- "Bei (wiederholten) Verfehlungen sollten (uneinsichtige) Mitglied auch aus 
-- der Gemeinde ausgeschlossen werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 154, 6, 0, "Sehr unwahrscheinlich");

-- "Frauen sollen alle Aufgabe in der Gemeinde (einschließlich das 
-- Predigen) übernehmen können."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 155, 6, 1, "Frauen können alle Ämter bekleiden.");

-- "Zu den Pflichten in der Gemeinde gehört auch das man 
-- regelmäßig in Erscheinung tritt und sich aktiv einbringt."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 156, 6, 0, "Die meisten Mitglieder gehen selten bis gar nicht zum
 Gottesdienst oder beteiligen sich am Gemeinde Leben. Oft werden wur die wichtigen
 Veranstaltungen wahrgenommen: Taufe, Heirat, Weihnachten und Beerdigung...");

-- "Die Gemeinde sollte von den Ältesten und/oder Predigern und/oder 
-- Diakonen geleitete werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 157, 6, 0, "Die Gemeinden werden von Hauptamtlichen (Pfarrern) geleitet.");

-- "Die Gemeindeleitung sollte von einer Höheren Instanz bestimmt werden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 158, 6, 1, "In Deutschland oder Österreich werden die lutherischen 
 Landeskirchen von einem Bischof oder einer Bischöfin geleitet, der bzw. die 
 über das Ordinationsrecht und die Lehraufsicht verfügt. ");

-- ==================== Kat. Sexualität beginnend mit 16... ===================
-- "Sex vor der Ehe lehene ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 161, 6, 3, "Die Frage ist de facto bedeutungslos und Privatangelegenheit
 der Mitglieder.");

-- "Die Ehe ist heilig."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 162, 6, 2, "Auch die Ehe kann zu den Sakramenten im weiteren Sinne 
 gezählt werden, ist aber von den Sakramenten im strikten Sinne zu unterscheiden");

-- "Erneutes heiraten nach einer Scheidung lehne ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 163, 6, 0, "Eine erneute Heirat ist möglich");

-- "Gleichgeschlechtliche Ehen lehne ich ab."); 
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 164, 6, 2, "Homosexuelle Paare werden kirchlich gesegnet aber nicht getraut.
 in einigen Ländern werden aber neuerdings auch Ehen geschlossen.");

-- "Ich halte (gelebte) Homosexualität für eine Sünde.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 165, 6, 0, "Nein , nicht mehr.");

-- "Schwangerschaftsverhütung lehne ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 166, 6, 3, "Nein, das ist die Privatentscheidung der Mitglieder.");

-- "Schwangerschaftsabbrüche lehne ich kategorisch ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 167, 6, 3, "Nein, das ist die Privatentscheidung der Mitglieder.");

-- ============================= Kat. Gottesdienst beginnend mit 17... =======
-- "Ein Gottesdienst muss ein bestimmten Ablauf (Liturgie) folgen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 171, 6, 1, "Im evangelisch-lutherischen Gottesdienst sind Predigt und 
 Abendmahlsfeier von zentraler Bedeutung.");

-- "Stille und Besinnung sind mir auch im Gottesdienst sehr wichtig."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 173, 6, 0, "Keine Bedeutung");

-- "Mir ist wichtig das Musik (Worship) modern ist, berührt und 
-- mitreißt."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 173, 6, 0, "Keine zentrale Bedeutung. Oft konservative Musik.");

-- "Freies Gebet im Gottesdienst ist für mich Zeichen von lebendigen und 
-- authentischem Glauben."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 175, 6, 0, "Keine zentrale Bedeutung.");

-- "In <i>Zungenreden</i> ist für mich ein Zeichen der Gnadengabe des 
-- Heiligen Geistes."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 176, 6, 0, "");

-- ====================== Kat. Erlösung beginnend mit 18... ==================
-- "Ich glaube das für jeden Menschen kommt eine Zeit, wo er von Gott 
-- gerichtet wird."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 181, 6, 1, "");

-- "Ich glaube es gibt eine Hölle mit ewiger Verdammnis."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 182, 6, 1, "");

-- "Menschen können auch noch nach ihrem Tod Busse tun um der Verdammnis
-- zu entgehen (Fegefeuer)."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 183, 6, 0, "");

-- "Auf die Erlösung hat man keinen Einfluss, Sie wird einem durch die 
-- Gnade Gottes zu Teil."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 184, 6, 1, "Ja, <i>sola fide</i> und <i>solus Christus</i>. allein der 
 Person Jesu Christi, seinem Wirken und seiner Lehre gilt das Vertrauen für die 
 Errettung und allein der Glaube als Vertrauen nicht auf sich selbst, sondern 
 auf Jesus Christus lässt einen Menschen vor Gott als gerecht gelten.");

-- "Wirtschaftlicher Erfolg ist ein Zeichen das man in der Gnade Gottes steht."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 185, 6, 0, "");

-- "Leid ist eine Strafe Gottes.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 186, 6, 0, "");

-- "Es kann nur eine Wahrheit geben und deshalb nur ein Weg zur Erlösung 
-- führen."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 187, 6, 0, "Anderen Gemeinschaften wird nicht grundsätzlich abgesprochen
 das sie erlöst werden könnten. Es gibt aber Glaubensgemeinschaften (die 
 <i>Friedenskirchen</i>) die im <i>Confessio Augustana</i> verdammt werden. ");

-- "Das Reich Gottes ist schon da. Es ist aber (noch) nicht (für alle) 
-- sichtbar."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 188, 6, 1, "Ja, siehe -> <i>Zwei-Reiche-Lehre</i>");

-- "Eine Erlösung ist schon im Diesseits möglich."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 189, 6, 1, "");

-- ========================= Kat. Sonstiges beginnend mit 19... ==============
-- "Politische Aktivitäten oder Themen haben in der Gemeinde keinen 
-- Platz."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 191, 6, 1, "Wird als meist als Privatangelegenheit der Mitglieder verstanden.
 gelegentlich gibt es aber politische Aussagen.");

-- "Soziales Engagement (in der Welt) sind existenzieller 
-- Bestandteil des Evangeliums."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 192, 6, 2, "Es gibt ein großes Missions- und Hilfswerk aber keine allgemeine
 verpflichtung.");

-- "Der Missionsauftrag ist ein wichtiger Bestandteil des Evangeliums."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 193, 6, 0, "");

-- "Ich glaube an Geistheilung."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 194, 6, 0, "");

-- "Kino, Theater, Konzerte und andere Künste bergen immer die Gefahr von 
-- wichtigen Dingen abgelenkt zu werden.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 195, 6, 0, "");

-- "Alkohol und andere Drogen versperren den Weg zu spiritueller Entwicklung."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 196, 6, 0, "");

-- "Gläubige Menschen sollten sich von Weltlichen Dingen/Gesellschaft
--  fern halten."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 197, 6, 0, "");

-- "In Heilgenbilder und -Skulpturen kann ich Halt und Trost finden."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 198, 6, 0, "");

-- "Wehrdienst lehne ich ab."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 199, 6, 0, "Nein, es gibt Militärseelsorger.");

-- "Ich schwöre nicht und lege keine Eide ab.");
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 1910, 6, 0, "");


COMMIT;