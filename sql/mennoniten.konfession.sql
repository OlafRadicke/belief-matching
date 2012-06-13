BEGIN;


-- ###########################################################################
-- #################### insert denomination_answers #######################################
-- ###########################################################################

-- ===================== Konservative Quaker =================================


-- ################ Eindeutige ID für Konfession setzen #####################
INSERT INTO denominations ( denomination_id, denomination, url ) VALUES (
3,
"Mennoniten",
"http://de.wikipedia.org/wiki/Mennoniten");

-- ################  Frage mit Konfession verknüpfen. #######################
-- 0 = Trifft nicht zu
-- 1 = Trifft zu
-- 2 = Persönliche Entscheidung
-- 3 = Keine Meinung

-- ======= kat "Gott" beginnend mit 11... ====================================

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 111, 3, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 112, 3, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 113, 3, 2, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 114, 3, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 115, 3, 3, "");

-- ======== Kat "Taufe" beginnend mit 12... ==================================


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 121, 3, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 122, 3, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 123, 3, 1, "");

-- ============ Kat Abendmahl beginnend mit 13... ============================


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 131, 3, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 132, 3, 2, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 133, 3, 2, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 134, 3, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 135, 3, 0, "");

-- ======================= Bibel beginnend mit 14... =========================


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 141, 3, 2, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 142, 3, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 143, 3, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 144, 3, 2, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 145, 3, 2, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 146, 3, 2, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 147, 3, 2, "");

-- ==================== Kat Gemeinde beginnend mit 15... =====================



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 151, 3, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 152, 3, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 153, 3, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 154, 3, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 155, 3, 2, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 156, 3, 2, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 157, 3, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 158, 3, 0, "");

-- ==================== Kat. Sexualität beginnend mit 16... ===================

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 161, 3, 2, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 162, 3, 2, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 163, 3, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 164, 3, 2, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 165, 3, 2, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 166, 3, 2, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 167, 3, 2, "");

-- ============================= Kat. Gottesdienst beginnend mit 17... =======

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 171, 3, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 173, 3, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 174, 3, 2, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 175, 3, 2, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 176, 3, 0, "");

-- ====================== Kat. Erlösung beginnend mit 18... ==================


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 181, 3, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 182, 3, 2, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 183, 3, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 184, 3, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 185, 3, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 186, 3, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 187, 3, 2, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 188, 3, 2, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 189, 3, 0, "");

-- ========================= Kat. Sonstiges beginnend mit 19... ==============


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 191, 3, 2, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 192, 3, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 193, 3, 2, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 194, 3, 2, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 195, 3, 2, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 196, 3, 2, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 197, 3, 2, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 198, 3, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 199, 3, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 1910, 3, 1, "");


COMMIT;