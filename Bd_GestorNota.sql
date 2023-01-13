CREATE TABLE `attendant` (
  `idAttendat` int PRIMARY KEY,
  `name` varchar(255),
  `lastname` varchar(255),
  `email` varchar(255),
  `phoneNumber` int
);

CREATE TABLE `admin` (
  `idAdmin` int PRIMARY KEY,
  `password` varchar(255)
);

CREATE TABLE `user` (
  `idUser` int PRIMARY KEY,
  `name` varchar(255),
  `lastname` varchar(255),
  `typeOfUser` varchar(255),
  `email` varchar(255),
  `password` varchar(255)
);

CREATE TABLE `responsible` (
  `idResponsible` int PRIMARY KEY,
  `idAttendat` int,
  `idStudent` int
);

CREATE TABLE `student` (
  `idStudent` int PRIMARY KEY,
  `idGroup` int,
  `photo` bigint,
  `rh` varchar(255),
  `birthday` date,
  `name` varchar(255),
  `lastname` varchar(255),
  `grade` varchar(255),
  `password` varchar(255)
);

CREATE TABLE `observer` (
  `idObserver` int PRIMARY KEY,
  `idStudent` int,
  `date` date,
  `titleObservation` varchar(255),
  `observation` varchar(255),
  `typeObservation` varchar(255),
  `interpose` varchar(255)
);

CREATE TABLE `assitance` (
  `idAssitance` int PRIMARY KEY,
  `idStudent` int,
  `date` date,
  `vinovino` boolean
);

CREATE TABLE `note` (
  `idNote` int PRIMARY KEY,
  `idAcivity` int,
  `idStudent` int
);

CREATE TABLE `group` (
  `idGroup` int PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `teacher` (
  `idTeacher` int PRIMARY KEY,
  `idGroup` int,
  `name` varchar(255),
  `lastname` varchar(255),
  `speciality` varchar(255),
  `phoneNumber` int,
  `email` varchar(255),
  `password` varchar(255)
);

CREATE TABLE `comment` (
  `idComment` int PRIMARY KEY,
  `idAcivity` int,
  `idStudent` int,
  `comment` varchar(255),
  `author` varchar(255)
);

CREATE TABLE `FinalNote` (
  `idFinalReport` int PRIMARY KEY,
  `idClass` int,
  `idStudent` int,
  `Period` int,
  `note` double
);

CREATE TABLE `class` (
  `idClass` int PRIMARY KEY,
  `idTeacher` int,
  `idSubject` int,
  `idGroup` int
);

CREATE TABLE `subject` (
  `idSubject` int PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `activity` (
  `idAcivity` int PRIMARY KEY,
  `idClass` int,
  `name` varchar(255),
  `percentage` double,
  `date` date,
  `description` varchar(255)
);

ALTER TABLE `responsible` ADD FOREIGN KEY (`idAttendat`) REFERENCES `attendant` (`idAttendat`);

ALTER TABLE `student` ADD FOREIGN KEY (`idStudent`) REFERENCES `responsible` (`idStudent`);

ALTER TABLE `observer` ADD FOREIGN KEY (`idStudent`) REFERENCES `student` (`idStudent`);

ALTER TABLE `assitance` ADD FOREIGN KEY (`idStudent`) REFERENCES `student` (`idStudent`);

ALTER TABLE `student` ADD FOREIGN KEY (`idStudent`) REFERENCES `note` (`idStudent`);

ALTER TABLE `student` ADD FOREIGN KEY (`idGroup`) REFERENCES `group` (`idGroup`);

ALTER TABLE `group` ADD FOREIGN KEY (`idGroup`) REFERENCES `teacher` (`idGroup`);

ALTER TABLE `comment` ADD FOREIGN KEY (`idStudent`) REFERENCES `student` (`idStudent`);

ALTER TABLE `FinalNote` ADD FOREIGN KEY (`idStudent`) REFERENCES `student` (`idStudent`);

ALTER TABLE `FinalNote` ADD FOREIGN KEY (`idClass`) REFERENCES `class` (`idClass`);

ALTER TABLE `class` ADD FOREIGN KEY (`idGroup`) REFERENCES `group` (`idGroup`);

ALTER TABLE `class` ADD FOREIGN KEY (`idTeacher`) REFERENCES `teacher` (`idTeacher`);

ALTER TABLE `class` ADD FOREIGN KEY (`idSubject`) REFERENCES `subject` (`idSubject`);

ALTER TABLE `activity` ADD FOREIGN KEY (`idClass`) REFERENCES `class` (`idClass`);

ALTER TABLE `comment` ADD FOREIGN KEY (`idAcivity`) REFERENCES `activity` (`idAcivity`);

ALTER TABLE `activity` ADD FOREIGN KEY (`idAcivity`) REFERENCES `note` (`idAcivity`);
