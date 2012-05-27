BEGIN;

-- ########## create tables ################

CREATE TABLE questions (
    question_id INTEGER PRIMARY KEY NOT NULL,
    question    TEXT    NOT NULL,
    kat         TEXT    NOT NULL
);

CREATE TABLE answer (
    answer_id      INTEGER PRIMARY KEY AUTOINCREMENT,
    question_id    INTEGER NOT NULL,
-- value is "y" or "n"
    yes_or_no      TEXT    NOT NULL,
-- value is "y" or "n"
    important      TEXT    NOT NULL,
-- value is "y" or "n"
    disregard      TEXT    NOT NULL,
    FOREIGN KEY ( question_id ) REFERENCES question ( question_id )
);

-- ######### insert questions #############

-- INSERT INTO questions (kat, question) VALUES (
-- "",
-- "");

-- ======= kat "Gott" =============

INSERT INTO questions (kat, question) VALUES (
"Gott",
"Ich glaube an die dreifaltigkeit");
INSERT INTO questions (kat, question) VALUES (
"Gott",
"Jesus ist nicht Gott sondern nur ein (besonderer) Mensch");
INSERT INTO questions (kat, question) VALUES (
"Gott",
"Gott offenbart sich direkt, auch ohne die Bibel und Klerus");

-- ======== Kat "Taufe" ============
INSERT INTO questions (kat, question) VALUES (
"Taufe",
"Die Taufe ist Voraussetzung für die Erlösung/Errettung");
INSERT INTO questions (kat, question) VALUES (
"Taufe",
"Die Taufe wird äußerlich durch Wasser vollzogen");
INSERT INTO questions (kat, question) VALUES (
"Taufe",
"Ich lehne Kindertaufe ab");

-- ########### insert answer ################


COMMIT;