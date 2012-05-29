BEGIN;


-- ###########################################################################
-- #################### insert answers #######################################
-- ###########################################################################

-- ===================== Konservative Quaker =================================


-- Eindeutige ID für Konfession setzen
INSERT INTO denominations ( denomination_id, denomination ) VALUES (
1,
"Konservative Quaker");

-- Frage mit Konfession verknüpfen.
INSERT INTO answers ( question_id, denomination_id ) VALUES (
113,
1);
INSERT INTO answers ( question_id, denomination_id ) VALUES (
124,
1);
INSERT INTO answers ( question_id, denomination_id ) VALUES (
134,
1);
INSERT INTO answers ( question_id, denomination_id ) VALUES (
134,
1);
INSERT INTO answers ( question_id, denomination_id ) VALUES (
145,
1);
INSERT INTO answers ( question_id, denomination_id ) VALUES (
151,
1);
INSERT INTO answers ( question_id, denomination_id ) VALUES (
152,
1);
INSERT INTO answers ( question_id, denomination_id ) VALUES (
154,
1);
INSERT INTO answers ( question_id, denomination_id ) VALUES (
155,
1);
INSERT INTO answers ( question_id, denomination_id ) VALUES (
156,
1);
INSERT INTO answers ( question_id, denomination_id ) VALUES (
173,
1);
INSERT INTO answers ( question_id, denomination_id ) VALUES (
175,
1);
INSERT INTO answers ( question_id, denomination_id ) VALUES (
181,
1);
INSERT INTO answers ( question_id, denomination_id ) VALUES (
188,
1);
INSERT INTO answers ( question_id, denomination_id ) VALUES (
189,
1);
INSERT INTO answers ( question_id, denomination_id ) VALUES (
192,
1);
INSERT INTO answers ( question_id, denomination_id ) VALUES (
195,
1);
INSERT INTO answers ( question_id, denomination_id ) VALUES (
196,
1);
INSERT INTO answers ( question_id, denomination_id ) VALUES (
1910,
1);


COMMIT;