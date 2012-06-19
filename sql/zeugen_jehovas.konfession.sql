BEGIN;


-- ###########################################################################
-- #################### insert denomination_answers #######################################
-- ###########################################################################

-- ===================== Konservative Quaker =================================


-- ################ Eindeutige ID für Konfession setzen #####################
INSERT INTO denominations ( denomination_id, denomination, url ) VALUES (
4,
"Zeugen Jehovas",
"http://de.wikipedia.org/wiki/Zeugen_Jehovas");

-- ################  Frage mit Konfession verknüpfen. #######################
-- 0 = Trifft nicht zu
-- 1 = Trifft zu
-- 2 = Persönliche Entscheidung
-- 3 = Keine Meinung

-- ======= kat "Gott" beginnend mit 11... ====================================

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 111, 4, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 112, 4, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 113, 4, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 114, 4, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary) 
VALUES ( 115, 4, 1, "");

-- ======== Kat "Taufe" beginnend mit 12... ==================================


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 121, 4, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 122, 4, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 123, 4, 1, "");

-- ============ Kat Abendmahl beginnend mit 13... ============================


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 131, 4, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 132, 4, 2, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 133, 4, 2, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 134, 4, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 135, 4, 0, "");

-- ======================= Bibel beginnend mit 14... =========================


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 141, 4, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 142, 4, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 143, 4, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 144, 4, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 145, 4, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 146, 4, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 147, 4, 0, "");

-- ==================== Kat Gemeinde beginnend mit 15... =====================



INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 151, 4, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 152, 4, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 153, 4, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 154, 4, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 155, 4, 2, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 156, 4, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 157, 4, 1, "");

-- INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
-- VALUES ( 158, 4, 0, "");

-- ==================== Kat. Sexualität beginnend mit 16... ===================

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 161, 4, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 162, 4, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 163, 4, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 164, 4, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 165, 4, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 166, 4, 2, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 167, 4, 1, "");

-- ============================= Kat. Gottesdienst beginnend mit 17... =======

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 171, 4, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 173, 4, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 174, 4, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 175, 4, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 176, 4, 0, "");

-- ====================== Kat. Erlösung beginnend mit 18... ==================


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 181, 4, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 182, 4, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 183, 4, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 184, 4, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 185, 4, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 186, 4, 0, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 187, 4, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 188, 4, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 189, 4, 0, "");

-- ========================= Kat. Sonstiges beginnend mit 19... ==============


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 191, 4, 1, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 192, 4, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 193, 4, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 194, 4, 2, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 195, 4, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 196, 4, 2, "");


INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 197, 4, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 198, 4, 0, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 199, 4, 1, "");

INSERT INTO denomination_answers ( question_id, denomination_id, answer_nr, commentary)
VALUES ( 1910, 4, 1, "");


COMMIT;