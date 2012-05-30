BEGIN;


-- ###########################################################################
-- #################### insert answers #######################################
-- ###########################################################################

-- ===================== Konservative Quaker =================================


-- Eindeutige ID für Konfession setzen
INSERT INTO denominations ( denomination_id, denomination, url ) VALUES (
1,
"Konservative Quaker",
"http://de.wikipedia.org/wiki/Quäkertum");

-- Frage mit Konfession verknüpfen.
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
113,
1, 1 );
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
124,
1, 1 );
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
134,
1, 1 );
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
134,
1, 1 );
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
145,
1, 1 );
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
151,
1, 1 );
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
152,
1, 1 );
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
154,
1, 1 );
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
155,
1, 1 );
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
156,
1, 1 );
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
173,
1, 1 );
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
175,
1, 1 );
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
181,
1, 1 );
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
188,
1, 1 );
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
189,
1, 1 );
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
192,
1, 1 );
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
195,
1, 1 );
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
196,
1, 1 );
INSERT INTO answers ( question_id, denomination_id, answer_nr ) VALUES (
1910,
1, 1 );


COMMIT;