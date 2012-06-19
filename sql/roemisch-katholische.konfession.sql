BEGIN;


-- ###########################################################################
-- #################### insert denomination_answers ##########################
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

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 111, 5, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 112, 5, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 113, 5, 0, "");
--"Gott offenbart sich durch die Bibel."
INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 114, 5, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 115, 5, 1, "");

-- ======== Kat "Taufe" beginnend mit 12... ==================================


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 121, 5, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 122, 5, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 123, 5, 0, "");

-- ============ Kat Abendmahl beginnend mit 13... ============================


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 131, 5, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 132, 5, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 133, 5, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 134, 5, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 135, 5, 1, "");

-- ======================= Bibel beginnend mit 14... =========================


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 141, 5, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 142, 5, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 143, 5, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 144, 5, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 145, 5, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 146, 5, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 147, 5, 1, "");

-- ==================== Kat Gemeinde beginnend mit 15... =====================



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 151, 5, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 152, 5, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 153, 5, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 2004, 5, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 155, 5, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 2006, 5, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 157, 5, 0, "");

-- INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
-- VALUES ( 158, 5, 1, "");

-- ==================== Kat. Sexualität beginnend mit 16... ===================

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 161, 5, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 162, 5, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 163, 5, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 164, 5, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 165, 5, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 166, 5, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 167, 5, 1, "");

-- ============================= Kat. Gottesdienst beginnend mit 17... =======

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 171, 5, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 173, 5, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 174, 5, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 175, 5, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 176, 5, 0, "");

-- ====================== Kat. Erlösung beginnend mit 18... ==================


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 181, 5, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 182, 5, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 183, 5, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 184, 5, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 185, 5, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 186, 5, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 187, 5, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 188, 5, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 189, 5, 0, "");

-- ========================= Kat. Sonstiges beginnend mit 19... ==============


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 191, 5, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 192, 5, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 193, 5, 2, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 194, 5, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 195, 5, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 196, 5, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 197, 5, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 198, 5, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 199, 5, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 1910, 5, 0, "");


COMMIT;