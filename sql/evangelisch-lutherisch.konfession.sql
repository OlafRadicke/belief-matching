BEGIN;


-- ###########################################################################
-- #################### insert denomination_answers ##########################
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
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 111, 6, 1, 
"Es wird die Lehre der Dreifaltigkeit vertreten.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 112, 6, 0, 
"Nein er ist Teil der Dreifaltigkeit.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 113, 6, 0, 
"Nein. Der persönliche Offenbarung wird keine große Rolle beigemessen.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 114, 6, 1, 
"Die Bibel ist die einzige Grundlage für das theologische Urteilen oder Verurteilen. ");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 115, 6, 0, 
"Dem Prophetischen wird keine große Bedeutung zugeschrieben.");

-- ======== Kat "Taufe" beginnend mit 12... ==================================

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 121, 6, 1, 
"Die Taufe ist <i>heilig</i> also ein Sakrament und Voraussetzung für die Errettung");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 122, 6, 1, "Ja, aber nicht durch Untertauchen.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 123, 6, 0, "Die Kindertaufe ist sehr gebräuchlich und die Regel.");

-- ============ Kat Abendmahl beginnend mit 13... ============================

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 131, 6, 1, "Die Gegenwart Christi im Heiligen Abendmahl wird als 
 <i>Realpräsenz</i> verstanden: Christi Leib und Blut werden unter Brot und Wein 
 ausgeteilt und empfangen. ");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 132, 6, 1, "Entscheidend ist die Anerkennung der Taufe. Sie wird nicht von 
 allen Konfessionen/Kirchen.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 133, 6, 1, "Ja, nur Getaufte sind zugelassen. In der konkreten Praxis
 wird davon aber oft abgewichen");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 134, 6, 0, "Die Abendmalfeier ist ein wichtiger Bestandteil im Glauben
 und Leben der Ev.Luth-Kirche.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 135, 6, 1, "Ja, das trifft hier zu.");

-- ======================= Bibel beginnend mit 14... =========================

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 141, 6, 0, 
"Die Bibel ist sehr wichtig, aber sie wird nicht wort-wörtlich ausgelegt.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 142, 6, 1, 
"Ja: <i>sola scriptura</i>!");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 143, 6, 0, 
"Nein. In der Lutherbibel fehlen sogar einige Bücher, die in der Kath. Bibel zufinden sind.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 144, 6, 1,
"Die wissenschaftliche Betrachtung (historisch-kritisch) wird in der Regel propagiert.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 145, 6, 0, 
"Die Notwendigkeit einer Auslegung wird zwar bejat, aber aus einer wissenschaftlichen
 (historisch-kritischen) Perspektive. Das Konzept - <i>Geist der Bibel</i> - ist
 dem fremd.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 146, 6, 0, 
"Nein, das widerspricht dem Stand der Wissenschaft. Auch wenn auf dem Grundsatz 
 <i>sola scriptura</i> viel Wert gelegt wird.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 147, 6, 1, 
"Ja, eine völlige Bedeutungslosigkeit für die Schöpfung will man in Gott nicht sehen.");

-- ==================== Kat Gemeinde beginnend mit 15... =====================

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 151, 6, 0, 
"Die Ev.-Luth. ist hierarchisch geordnet. Liturgische Handlungen werden in aller
 Regel von Priestern durchgeführt.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 152, 6, 0, 
"Das ist nicht der Fall");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 153, 6, 1, "Liturgische Handlungen werden in aller
 Regel von Priestern durchgeführt. Auch das Predigen ist in der Regel Priestern 
 vorbehalten.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 2004, 6, 0, "Sehr unwahrscheinlich");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 155, 6, 1, "Frauen können alle Ämter bekleiden.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 2006, 6, 0, "Die meisten Mitglieder gehen selten bis gar nicht zum
 Gottesdienst oder beteiligen sich nicht am Gemeindeleben. Oft werden nur die wichtigen
 Veranstaltungen wahrgenommen: Taufe, Heirat, Weihnachten und Beerdigung...");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 157, 6, 0, "Die Gemeinden werden von Hauptamtlichen (Pfarrern) geleitet.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 158, 6, 1, "In Deutschland oder Österreich werden die lutherischen 
 Landeskirchen von einem Bischof oder einer Bischöfin geleitet, der bzw. die 
 über das Ordinationsrecht und die Lehraufsicht verfügt. ");

-- ==================== Kat. Sexualität beginnend mit 16... ===================

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 161, 6, 3, "Die Frage ist de facto bedeutungslos und Privatangelegenheit
 der Mitglieder.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 162, 6, 2, "Auch die Ehe kann zu den Sakramenten im weiteren Sinne 
 gezählt werden, ist aber von den Sakramenten im strikten Sinne zu unterscheiden");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 163, 6, 0, "Eine erneute Heirat ist möglich");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 164, 6, 2, "Homosexuelle Paare werden kirchlich gesegnet aber nicht getraut.
 in einigen Ländern werden aber neuerdings auch Ehen geschlossen.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 165, 6, 0, "Nein , nicht mehr.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 166, 6, 3, "Nein, das ist die Privatentscheidung der Mitglieder.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 167, 6, 3, "Nein, das ist die Privatentscheidung der Mitglieder.");

-- ============================= Kat. Gottesdienst beginnend mit 17... =======
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 171, 6, 1, "Im evangelisch-lutherischen Gottesdienst sind Predigt und 
 Abendmahlsfeier von zentraler Bedeutung.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 173, 6, 0, "Keine Bedeutung");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 174, 6, 0, "Keine zentrale Bedeutung. Oft konservative Musik.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 175, 6, 0, "Keine zentrale Bedeutung.");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 176, 6, 0, "");

-- ====================== Kat. Erlösung beginnend mit 18... ==================
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 181, 6, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 182, 6, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 183, 6, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 184, 6, 1, "Ja, <i>sola fide</i> und <i>solus Christus</i>. allein der 
 Person Jesu Christi, seinem Wirken und seiner Lehre gilt das Vertrauen für die 
 Errettung und allein der Glaube als Vertrauen nicht auf sich selbst, sondern 
 auf Jesus Christus lässt einen Menschen vor Gott als gerecht gelten.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 185, 6, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 186, 6, 0, "");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 187, 6, 0, "Anderen Gemeinschaften wird nicht grundsätzlich abgesprochen,
 dass sie erlöst werden könnten. Es gibt aber Glaubensgemeinschaften (die 
 <i>Friedenskirchen</i>) die im <i>Confessio Augustana</i> verdammt werden. ");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 188, 6, 1, "Ja, siehe -> <i>Zwei-Reiche-Lehre</i>");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 189, 6, 1, "");

-- ========================= Kat. Sonstiges beginnend mit 19... ==============


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 191, 6, 1, "Wird als meist als Privatangelegenheit der Mitglieder verstanden.
 gelegentlich gibt es aber politische Aussagen.");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 192, 6, 2, "Es gibt ein großes Missions- und Hilfswerk aber keine allgemeine
 verpflichtung.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 193, 6, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 194, 6, 0, "");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 195, 6, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 196, 6, 0, "");



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 197, 6, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 198, 6, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 199, 6, 0, "Nein, es gibt Militärseelsorger.");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 1910, 6, 0, "");


COMMIT;