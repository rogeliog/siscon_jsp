SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `SISCON` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `SISCON` ;

-- -----------------------------------------------------
-- Table `SISCON`.`Departamento`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`Departamento` (
  `idDepartamento` INT NOT NULL AUTO_INCREMENT ,
  `siglas` VARCHAR(10) NOT NULL COMMENT 'CS(Ciencias Computacioanles), son las siglas del departamento' ,
  `departamento` VARCHAR(45) NULL COMMENT 'Nombre del Departamento' ,
  PRIMARY KEY (`idDepartamento`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISCON`.`Usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`Usuario` (
  `indexUsuario` INT NOT NULL AUTO_INCREMENT ,
  `idDepartamento` INT NULL ,
  `idUsuario` VARCHAR(9) NOT NULL COMMENT 'Es la \"Matricula del Profesor\"' ,
  `nombreUsuario` VARCHAR(45) NOT NULL ,
  `apellidoUsuario` VARCHAR(45) NOT NULL ,
  `genero` CHAR(1) NULL DEFAULT 'M' COMMENT 'Masculino o Femenino' ,
  `email` VARCHAR(100) NOT NULL ,
  `alta` BIT NOT NULL DEFAULT 0 ,
  `password` VARCHAR(40) NOT NULL ,
  `administrador` BIT NOT NULL DEFAULT 0 ,
  `rol` CHAR(5) NOT NULL DEFAULT 'P' COMMENT 'Profesor\nDirector... Cualquier rol que se desee\nAgregar' ,
  PRIMARY KEY (`indexUsuario`, `idDepartamento`) ,
  INDEX `idDepartamentoUsuario` (`idDepartamento` ASC) ,
  CONSTRAINT `idDepartamentoUsuario`
    FOREIGN KEY (`idDepartamento` )
    REFERENCES `SISCON`.`Departamento` (`idDepartamento` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISCON`.`Telefono`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`Telefono` (
  `idTelefono` INT NOT NULL AUTO_INCREMENT ,
  `indexUsuario` INT NULL ,
  `idDepartamento` INT NULL ,
  `telefono` VARCHAR(20) NOT NULL ,
  `extension` VARCHAR(10) NULL ,
  PRIMARY KEY (`idTelefono`, `indexUsuario`, `idDepartamento`) ,
  INDEX `TelefonoUsuario` (`indexUsuario` ASC, `idDepartamento` ASC) ,
  CONSTRAINT `TelefonoUsuario`
    FOREIGN KEY (`indexUsuario` , `idDepartamento` )
    REFERENCES `SISCON`.`Usuario` (`indexUsuario` , `idDepartamento` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISCON`.`Carrera`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`Carrera` (
  `idCarrera` INT NOT NULL AUTO_INCREMENT ,
  `nombreCarrera` VARCHAR(100) NOT NULL ,
  `siglasCarrera` VARCHAR(5) NOT NULL ,
  PRIMARY KEY (`idCarrera`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISCON`.`PlanDeEstudios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`PlanDeEstudios` (
  `idPlanDeEstudios` INT NOT NULL AUTO_INCREMENT ,
  `idCarrera` INT NULL ,
  `anioPlan` VARCHAR(5) NOT NULL ,
  `descripcion` TEXT NULL ,
  PRIMARY KEY (`idPlanDeEstudios`, `idCarrera`) ,
  INDEX `planDeEstudiosCarrera` (`idCarrera` ASC) ,
  CONSTRAINT `planDeEstudiosCarrera`
    FOREIGN KEY (`idCarrera` )
    REFERENCES `SISCON`.`Carrera` (`idCarrera` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISCON`.`Semestre`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`Semestre` (
  `idSemestre` INT NOT NULL AUTO_INCREMENT ,
  `idPlan` INT NULL ,
  `idCarrera` INT NULL ,
  `semestre` VARCHAR(2) NOT NULL ,
  PRIMARY KEY (`idSemestre`, `idPlan`, `idCarrera`) ,
  INDEX `SemestrePlanDeEstudios` (`idPlan` ASC, `idCarrera` ASC) ,
  CONSTRAINT `SemestrePlanDeEstudios`
    FOREIGN KEY (`idPlan` , `idCarrera` )
    REFERENCES `SISCON`.`PlanDeEstudios` (`idPlanDeEstudios` , `idCarrera` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISCON`.`Materia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`Materia` (
  `materia` VARCHAR(5) NOT NULL ,
  `curso` VARCHAR(5) NOT NULL ,
  `nombreMateria` VARCHAR(100) NOT NULL ,
  `disciplina` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`materia`, `curso`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISCON`.`Periodo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`Periodo` (
  `idPeriodo` INT NOT NULL ,
  `anio` VARCHAR(4) NOT NULL COMMENT 'Esta llave se toma del excel, esta llave es auto descriptiva, los 4 primeros caracteres corresponden al año y los ultimos dos al periodo (Ene-Mayo,Vernao,Ago-Dic)' ,
  `periodoValue` VARCHAR(4) NOT NULL COMMENT '11 es Ene-May, 12 es Verano, y 13 es Ago-Dic' ,
  `periodo` VARCHAR(20) NOT NULL COMMENT 'El periodo en formato Ene-May, Verano, Ago-Dic' ,
  PRIMARY KEY (`idPeriodo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISCON`.`Grupo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`Grupo` (
  `CRN` INT NOT NULL ,
  `materia` VARCHAR(5) NOT NULL ,
  `curso` VARCHAR(5) NOT NULL ,
  `idDepartamento` INT NOT NULL ,
  `indexUsuario` INT NOT NULL ,
  `idPeriodo` INT NOT NULL ,
  `atributos` VARCHAR(50) NULL COMMENT 'Atributos de la clase, vienen en el excel en la casilla Atributos' ,
  `horasClase` VARCHAR(4) NULL COMMENT 'HC en el excel' ,
  `horasLaboratorio` VARCHAR(4) NULL COMMENT 'HL en el excel' ,
  `unidades` VARCHAR(2) NULL COMMENT 'UN en el excel' ,
  `porcentajeClase` VARCHAR(4) NOT NULL COMMENT 'Porcentaje de clase que da el profesor.' ,
  `numeroProfesores` SMALLINT NOT NULL COMMENT 'Numero de profesores que dan la clase' ,
  `claseExclusiva` SMALLINT NOT NULL COMMENT 'Si la clase es exclusiva de un profesor, 0 si no 1 si si' ,
  `alumnosInscritos` INT NOT NULL ,
  PRIMARY KEY (`CRN`, `materia`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `curso`) ,
  INDEX `GrupoUsuario` (`indexUsuario` ASC, `idDepartamento` ASC) ,
  INDEX `GrupoPeriodo` (`idPeriodo` ASC) ,
  INDEX `GrupoMateria` (`materia` ASC, `curso` ASC) ,
  CONSTRAINT `GrupoUsuario`
    FOREIGN KEY (`indexUsuario` , `idDepartamento` )
    REFERENCES `SISCON`.`Usuario` (`indexUsuario` , `idDepartamento` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `GrupoPeriodo`
    FOREIGN KEY (`idPeriodo` )
    REFERENCES `SISCON`.`Periodo` (`idPeriodo` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `GrupoMateria`
    FOREIGN KEY (`materia` , `curso` )
    REFERENCES `SISCON`.`Materia` (`materia` , `curso` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISCON`.`semestreMateria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`semestreMateria` (
  `materia` VARCHAR(5) NOT NULL ,
  `curso` VARCHAR(5) NOT NULL ,
  `idSemestre` INT NOT NULL ,
  `idPlan` INT NOT NULL ,
  `idCarrera` INT NOT NULL ,
  PRIMARY KEY (`idSemestre`, `idPlan`, `materia`, `curso`, `idCarrera`) ,
  INDEX `SMSem` (`idSemestre` ASC, `idPlan` ASC, `idCarrera` ASC) ,
  INDEX `SMMateria` (`materia` ASC, `curso` ASC) ,
  CONSTRAINT `SMSem`
    FOREIGN KEY (`idSemestre` , `idPlan` , `idCarrera` )
    REFERENCES `SISCON`.`Semestre` (`idSemestre` , `idPlan` , `idCarrera` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `SMMateria`
    FOREIGN KEY (`materia` , `curso` )
    REFERENCES `SISCON`.`Materia` (`materia` , `curso` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISCON`.`Horarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`Horarios` (
  `idHorarios` INT NOT NULL ,
  `CRN` INT NOT NULL ,
  `materia` VARCHAR(5) NOT NULL ,
  `curso` VARCHAR(5) NOT NULL ,
  `idDepartamento` INT NOT NULL ,
  `indexUsuario` INT NOT NULL ,
  `idPeriodo` INT NOT NULL ,
  `salon` VARCHAR(10) NOT NULL ,
  `diaSemana` VARCHAR(10) NOT NULL ,
  `horaInicio` VARCHAR(5) NOT NULL ,
  `horaFin` VARCHAR(5) NOT NULL ,
  PRIMARY KEY (`idHorarios`, `CRN`, `materia`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `curso`) ,
  INDEX `HGrupos` (`CRN` ASC, `materia` ASC, `idDepartamento` ASC, `indexUsuario` ASC, `idPeriodo` ASC, `curso` ASC) ,
  CONSTRAINT `HGrupos`
    FOREIGN KEY (`CRN` , `materia` , `idDepartamento` , `indexUsuario` , `idPeriodo` , `curso` )
    REFERENCES `SISCON`.`Grupo` (`CRN` , `materia` , `idDepartamento` , `indexUsuario` , `idPeriodo` , `curso` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISCON`.`tablaNotificacion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`tablaNotificacion` (
  `idtablaNotificacion` INT NOT NULL AUTO_INCREMENT ,
  `indexUsuario` INT NULL ,
  `idDepartamento` INT NULL ,
  PRIMARY KEY (`idtablaNotificacion`, `indexUsuario`, `idDepartamento`) ,
  INDEX `notificacionUsuario` (`indexUsuario` ASC, `idDepartamento` ASC) ,
  CONSTRAINT `notificacionUsuario`
    FOREIGN KEY (`indexUsuario` , `idDepartamento` )
    REFERENCES `SISCON`.`Usuario` (`indexUsuario` , `idDepartamento` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISCON`.`actividadesExtra`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`actividadesExtra` (
  `idActividadesExtra` INT NOT NULL AUTO_INCREMENT ,
  `idDepartamento` INT NOT NULL ,
  `indexUsuario` INT NOT NULL ,
  `idPeriodo` INT NOT NULL ,
  `diaSemana` VARCHAR(45) NOT NULL ,
  `horaInicio` VARCHAR(6) NOT NULL ,
  `horaFin` VARCHAR(6) NOT NULL ,
  `duracion` VARCHAR(4) NULL ,
  `actividad` VARCHAR(15) NOT NULL DEFAULT 'Comida' ,
  PRIMARY KEY (`idActividadesExtra`, `idDepartamento`, `indexUsuario`, `idPeriodo`) ,
  INDEX `AEUsuario` (`indexUsuario` ASC, `idDepartamento` ASC) ,
  INDEX `AEPeriodo` (`idPeriodo` ASC) ,
  CONSTRAINT `AEUsuario`
    FOREIGN KEY (`indexUsuario` , `idDepartamento` )
    REFERENCES `SISCON`.`Usuario` (`indexUsuario` , `idDepartamento` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `AEPeriodo`
    FOREIGN KEY (`idPeriodo` )
    REFERENCES `SISCON`.`Periodo` (`idPeriodo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SISCON`.`registroExcel`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`registroExcel` (
  `idregistroExcel` INT NOT NULL ,
  `indexUsuario` INT NOT NULL ,
  `idDepartamento` INT NOT NULL ,
  `fecha` DATE NOT NULL ,
  `nombreArchivo` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`idregistroExcel`, `indexUsuario`, `idDepartamento`) ,
  INDEX `REUsuario` (`indexUsuario` ASC, `idDepartamento` ASC) ,
  CONSTRAINT `REUsuario`
    FOREIGN KEY (`indexUsuario` , `idDepartamento` )
    REFERENCES `SISCON`.`Usuario` (`indexUsuario` , `idDepartamento` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Placeholder table for view `SISCON`.`VhorariosProfesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SISCON`.`VhorariosProfesores` (`idUsuario` INT, `nombreUsuario` INT, `apellidoUsuario` INT, `CRN` INT, `horasClase` INT, `horasLaboratorio` INT, `unidades` INT, `porcentajeClase` INT, `numeroProfesores` INT, `claseExclusiva` INT, `alumnosInscritos` INT, `materia` INT, `curso` INT, `nombreMateria` INT, `idPeriodo` INT, `anio` INT, `periodo` INT, `salon` INT, `diaSemana` INT, `horaInicio` INT, `horaFin` INT);

-- -----------------------------------------------------
-- Placeholder table for view `SISCON`.`VplanesCarreras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SISCON`.`VplanesCarreras` (`nombreCarrera` INT, `siglasCarrera` INT, `anioPlan` INT, `descripcionPlan` INT, `semestre` INT, `materia` INT, `curso` INT, `nombreMateria` INT);

-- -----------------------------------------------------
-- Placeholder table for view `SISCON`.`VtelefonosUsuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SISCON`.`VtelefonosUsuarios` (`idDepartamento` INT, `idUsuario` INT, `siglas` INT, `departamento` INT, `indexUsuario` INT, `email` INT, `nombreUsuario` INT, `apellidoUsuario` INT, `telefono` INT, `extension` INT);

-- -----------------------------------------------------
-- Placeholder table for view `SISCON`.`VactividadesProfesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SISCON`.`VactividadesProfesores` (`idDepartamento` INT, `indexUsuario` INT, `idUsuario` INT, `nombreUsuario` INT, `apellidoUsuario` INT, `genero` INT, `email` INT, `actividad` INT, `diaSemana` INT, `horaInicio` INT, `horaFin` INT, `duracion` INT);

-- -----------------------------------------------------
-- Placeholder table for view `SISCON`.`VusuarioRegistroExcel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SISCON`.`VusuarioRegistroExcel` (`idDepartamento` INT, `indexUsuario` INT, `idUsuario` INT, `nombreUsuario` INT, `apellidoUsuario` INT, `email` INT, `rol` INT, `fecha` INT, `nombreArchivo` INT);

-- -----------------------------------------------------
-- Placeholder table for view `SISCON`.`VusuariosNotificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SISCON`.`VusuariosNotificacion` (`idtablaNotificacion` INT, `idDepartamento` INT, `departamento` INT, `siglas` INT, `indexUsuario` INT, `idUsuario` INT, `nombreUsuario` INT, `apellidoUsuario` INT, `genero` INT, `email` INT, `alta` INT, `rol` INT, `administrador` INT);

-- -----------------------------------------------------
-- View `SISCON`.`VhorariosProfesores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISCON`.`VhorariosProfesores`;
USE `SISCON`;
CREATE  OR REPLACE VIEW `SISCON`.`VhorariosProfesores` AS
SELECT u.idUsuario,u.nombreUsuario,u.apellidoUsuario,g.CRN,
				g.horasClase,g.horasLaboratorio,g.unidades,g.porcentajeClase,g.numeroProfesores,
				g.claseExclusiva,g.alumnosInscritos,m.materia,m.curso,m.nombreMateria,p.idPeriodo,p.anio,p.periodo,
				h.salon,h.diaSemana,h.horaInicio,h.horaFin
FROM Usuario u
INNER JOIN Grupo g ON u.indexUsuario = g.indexUsuario AND u.idDepartamento = g.idDepartamento
INNER JOIN Materia m ON g.materia = m.materia AND g.curso = m.curso
INNER JOIN Periodo p ON g.idPeriodo = p.idPeriodo
INNER JOIN Horarios h ON h.CRN = g.CRN AND h.indexUsuario = g.indexUsuario
ORDER BY idUsuario,CRN,idPeriodo;

-- -----------------------------------------------------
-- View `SISCON`.`VplanesCarreras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISCON`.`VplanesCarreras`;
USE `SISCON`;
CREATE  OR REPLACE VIEW `SISCON`.`VplanesCarreras` AS
SELECT c.nombreCarrera,c.siglasCarrera,p.anioPlan,p.descripcion AS descripcionPlan,
       s.semestre,m.materia,m.curso,m.nombreMateria
FROM Carrera c
INNER JOIN PlanDeEstudios p ON c.idCarrera = p.idCarrera
INNER JOIN Semestre s ON s.idPlan = p.idPlanDeEstudios
INNER JOIN semestreMateria sm ON sm.idSemestre = s.idSemestre
INNER JOIN Materia m ON sm.materia = m.materia AND sm.curso = m.curso
ORDER BY c.siglasCarrera,p.anioPlan,s.semestre,m.materia,m.curso;

-- -----------------------------------------------------
-- View `SISCON`.`VtelefonosUsuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISCON`.`VtelefonosUsuarios`;
USE `SISCON`;
CREATE  OR REPLACE VIEW `SISCON`.`VtelefonosUsuarios` AS
SELECT u.idDepartamento,u.idUsuario,d.siglas,d.departamento,u.indexUsuario,u.email,u.nombreUsuario,u.apellidoUsuario,t.telefono,t.extension
FROM Usuario u
INNER JOIN Telefono t ON u.indexUsuario = t.indexUsuario
INNER JOIN Departamento d ON d.idDepartamento = u.idDepartamento
ORDER BY idUsuario;

-- -----------------------------------------------------
-- View `SISCON`.`VactividadesProfesores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISCON`.`VactividadesProfesores`;
USE `SISCON`;
CREATE  OR REPLACE VIEW `SISCON`.`VactividadesProfesores` AS
SELECT u.idDepartamento,u.indexUsuario,u.idUsuario,u.nombreUsuario,u.apellidoUsuario,u.genero,u.email,
        ae.actividad,ae.diaSemana, ae.horaInicio, ae.horaFin, ae.duracion 
FROM Usuario u
INNER JOIN actividadesExtra ae
WHERE ae.indexUsuario = u.indexUsuario AND ae.idDepartamento = u.idDepartamento
ORDER BY idDepartamento,indexUsuario,diaSemana,horaInicio,horaFin;

-- -----------------------------------------------------
-- View `SISCON`.`VusuarioRegistroExcel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISCON`.`VusuarioRegistroExcel`;
USE `SISCON`;
CREATE  OR REPLACE VIEW `SISCON`.`VusuarioRegistroExcel` AS
SELECT u.idDepartamento,u.indexUsuario,u.idUsuario,u.nombreUsuario,u.apellidoUsuario,u.email,u.rol,
        re.fecha,re.nombreArchivo
FROM Usuario u
INNER JOIN registroExcel re ON re.indexUsuario = u.indexUsuario AND re.idDepartamento = u.idDepartamento
;

-- -----------------------------------------------------
-- View `SISCON`.`VusuariosNotificacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISCON`.`VusuariosNotificacion`;
USE `SISCON`;
CREATE  OR REPLACE VIEW `SISCON`.`VusuariosNotificacion` AS
SELECT t.idtablaNotificacion,u.idDepartamento,d.departamento,d.siglas,u.indexUsuario,u.idUsuario,u.nombreUsuario,u.apellidoUsuario,u.genero,u.email,u.alta,u.rol,u.administrador
FROM Departamento d
INNER JOIN Usuario u ON u.idDepartamento = d.idDepartamento
INNER JOIN tablaNotificacion t ON u.idDepartamento = t.idDepartamento AND u.indexUsuario = t.indexUsuario
;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `SISCON`.`Departamento`
-- -----------------------------------------------------
START TRANSACTION;
USE `SISCON`;
INSERT INTO `SISCON`.`Departamento` (`idDepartamento`, `siglas`, `departamento`) VALUES (1, 'CS', 'Ciencias Computacionales');
INSERT INTO Departamento (`departamento`) VALUES ('Física');
INSERT INTO Departamento (`departamento`) VALUES ('Ingeniería Civil');
INSERT INTO Departamento (`departamento`) VALUES ('Ingeniería Eléctrica y Computacional');
INSERT INTO Departamento (`departamento`) VALUES ('Ingeniería Industrial y de Sistemas');
INSERT INTO Departamento (`departamento`) VALUES ('Ingeniería Mecánica');
INSERT INTO Departamento (`departamento`) VALUES ('Ingeniería Química');
INSERT INTO Departamento (`departamento`) VALUES ('Matemáticas');
INSERT INTO Departamento (`departamento`) VALUES ('Mecatrónica y Automatización');
INSERT INTO Departamento (`departamento`) VALUES ('Sistemas de Información');
--INSERT INTO `SISCON`.`Departamento` (`idDepartamento`, `siglas`, `departamento`) VALUES (2, 'FI', 'Física');
-- INSERT INTO `SISCON`.`Departamento` (`idDepartamento`, `siglas`, `departamento`) VALUES (3, 'IC', 'Ingenieria Civil');
-- INSERT INTO `SISCON`.`Departamento` (`idDepartamento`, `siglas`, `departamento`) VALUES (4, 'IEC', 'Ingenieria Eléctrica y Computacional');
-- INSERT INTO `SISCON`.`Departamento` (`idDepartamento`, `siglas`, `departamento`) VALUES (5, 'IIS', 'Ingeniería Industrial y de Sistemas');
-- INSERT INTO `SISCON`.`Departamento` (`idDepartamento`, `siglas`, `departamento`) VALUES (6, 'IM', 'Ingeniería Mecánica');
-- INSERT INTO `SISCON`.`Departamento` (`idDepartamento`, `siglas`, `departamento`) VALUES (7, 'IQ', 'Ingeniería Química');
-- INSERT INTO `SISCON`.`Departamento` (`idDepartamento`, `siglas`, `departamento`) VALUES (8, 'CS', 'Matemáticas');
-- INSERT INTO `SISCON`.`Departamento` (`idDepartamento`, `siglas`, `departamento`) VALUES (9, 'CS', 'Mecatrónica y Automatización');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SISCON`.`Usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `SISCON`;
INSERT INTO `SISCON`.`Usuario` (`indexUsuario`, `idDepartamento`, `idUsuario`, `nombreUsuario`, `apellidoUsuario`, `genero`, `email`, `alta`, `password`, `administrador`, `rol`) VALUES (1, 1, 'L00215087', 'Elda Guadalupe', 'Quiroga Gonzalez', 'F', 'x@itesm.mx', 0, '\'\'', 0, 'P');
INSERT INTO `SISCON`.`Usuario` (`indexUsuario`, `idDepartamento`, `idUsuario`, `nombreUsuario`, `apellidoUsuario`, `genero`, `email`, `alta`, `password`, `administrador`, `rol`) VALUES (2, 1, 'L00276543', 'Ramon Felipe', 'Brena Pinero', 'M', 'y@itesm.mx', 0, '\'\'', 0, 'P');
INSERT INTO `SISCON`.`Usuario` (`indexUsuario`, `idDepartamento`, `idUsuario`, `nombreUsuario`, `apellidoUsuario`, `genero`, `email`, `alta`, `password`, `administrador`, `rol`) VALUES (3, 1, 'L00265355', 'Hugo', 'Terashima Marin', 'M', 'w@itesm.mx', 0, '\'\'', 0, 'P');
INSERT INTO `SISCON`.`Usuario` (`indexUsuario`, `idDepartamento`, `idUsuario`, `nombreUsuario`, `apellidoUsuario`, `genero`, `email`, `alta`, `password`, `administrador`, `rol`) VALUES (4, 1, 'L00234153', 'Juan Arturo', 'Nolazco Flores', 'M', 'z@itesm.mx', 0, '\'\'', 1, 'P');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SISCON`.`Telefono`
-- -----------------------------------------------------
START TRANSACTION;
USE `SISCON`;
INSERT INTO `SISCON`.`Telefono` (`idTelefono`, `indexUsuario`, `idDepartamento`, `telefono`, `extension`) VALUES (1, 1, 1, '83284488', NULL);
INSERT INTO `SISCON`.`Telefono` (`idTelefono`, `indexUsuario`, `idDepartamento`, `telefono`, `extension`) VALUES (2, 1, 1, '83582000', '4592');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SISCON`.`Carrera`
-- -----------------------------------------------------
START TRANSACTION;
USE `SISCON`;
INSERT INTO `SISCON`.`Carrera` (`idCarrera`, `nombreCarrera`, `siglasCarrera`) VALUES (1, 'Ingeniero en Tecnologias de la Computacion', 'ITC');
INSERT INTO `SISCON`.`Carrera` (`idCarrera`, `nombreCarrera`, `siglasCarrera`) VALUES (2, 'Ingeniero en Tecnologias de la Informacion y la Comunicacion', 'ITIC');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SISCON`.`PlanDeEstudios`
-- -----------------------------------------------------
START TRANSACTION;
USE `SISCON`;
INSERT INTO `SISCON`.`PlanDeEstudios` (`idPlanDeEstudios`, `idCarrera`, `anioPlan`, `descripcion`) VALUES (1, 1, '2009', 'Plan de Estudios 2009');
INSERT INTO `SISCON`.`PlanDeEstudios` (`idPlanDeEstudios`, `idCarrera`, `anioPlan`, `descripcion`) VALUES (2, 1, '2011', 'Plan de Estudios 2011');
INSERT INTO `SISCON`.`PlanDeEstudios` (`idPlanDeEstudios`, `idCarrera`, `anioPlan`, `descripcion`) VALUES (3, 2, '2011', 'Plan de Estudios 2011');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SISCON`.`Semestre`
-- -----------------------------------------------------
START TRANSACTION;
USE `SISCON`;
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (1, 1, 1, '0');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (2, 1, 1, '1');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (3, 1, 1, '2');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (4, 1, 1, '3');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (5, 1, 1, '4');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (6, 1, 1, '5');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (7, 1, 1, '6');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (8, 1, 1, '7');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (9, 1, 1, '8');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (10, 1, 1, '9');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (11, 2, 1, '0');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (12, 2, 1, '1');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (13, 2, 1, '2');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (14, 2, 1, '3');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (15, 2, 1, '4');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (16, 2, 1, '5');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (17, 2, 1, '6');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (18, 2, 1, '7');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (19, 2, 1, '8');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (20, 2, 1, '9');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (21, 3, 2, '0');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (22, 3, 2, '1');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (23, 3, 2, '2');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (24, 3, 2, '3');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (25, 3, 2, '4');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (26, 3, 2, '5');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (27, 3, 2, '6');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (28, 3, 2, '7');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (29, 3, 2, '8');
INSERT INTO `SISCON`.`Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES (30, 3, 2, '9');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SISCON`.`Materia`
-- -----------------------------------------------------
START TRANSACTION;
USE `SISCON`;
INSERT INTO `SISCON`.`Materia` (`materia`, `curso`, `nombreMateria`, `disciplina`) VALUES ('TC', '1014', 'Fundamentos de Programacion', 'Ciencias Computacionales');
INSERT INTO `SISCON`.`Materia` (`materia`, `curso`, `nombreMateria`, `disciplina`) VALUES ('F', '1001', 'Introduccion a la Fisica', 'Fisica');
INSERT INTO `SISCON`.`Materia` (`materia`, `curso`, `nombreMateria`, `disciplina`) VALUES ('H', '1001', 'Ingles Remedial I', 'Humanidades');
INSERT INTO `SISCON`.`Materia` (`materia`, `curso`, `nombreMateria`, `disciplina`) VALUES ('TC', '1003', 'Matematicas Discretas', 'Matematicas');
INSERT INTO `SISCON`.`Materia` (`materia`, `curso`, `nombreMateria`, `disciplina`) VALUES ('TC', '1022', 'Introduccion a la Ingenieria en Tecnologias Computacionales', 'Ciencias Computacionales');
INSERT INTO `SISCON`.`Materia` (`materia`, `curso`, `nombreMateria`, `disciplina`) VALUES ('MA', '2009', 'Matematicas III', 'Matematicas');
INSERT INTO `SISCON`.`Materia` (`materia`, `curso`, `nombreMateria`, `disciplina`) VALUES ('TC', '1021', 'Proyecto de Desarrollo de Videojuegos', 'Ciencias Computacionales');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SISCON`.`Periodo`
-- -----------------------------------------------------
START TRANSACTION;
USE `SISCON`;
INSERT INTO `SISCON`.`Periodo` (`idPeriodo`, `anio`, `periodoValue`, `periodo`) VALUES (201111, '2011', '11', 'Enero-Mayo');
INSERT INTO `SISCON`.`Periodo` (`idPeriodo`, `anio`, `periodoValue`, `periodo`) VALUES (201112, '2011', '12', 'Verano');
INSERT INTO `SISCON`.`Periodo` (`idPeriodo`, `anio`, `periodoValue`, `periodo`) VALUES (201113, '2011', '13', 'Agosto-Diciembre');
INSERT INTO `SISCON`.`Periodo` (`idPeriodo`, `anio`, `periodoValue`, `periodo`) VALUES (201211, '2012', '11', 'Enero-Mayo');
INSERT INTO `SISCON`.`Periodo` (`idPeriodo`, `anio`, `periodoValue`, `periodo`) VALUES (201212, '2012', '12', 'Verano');
INSERT INTO `SISCON`.`Periodo` (`idPeriodo`, `anio`, `periodoValue`, `periodo`) VALUES (201213, '2012', '13', 'Agosto-Diciembre');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SISCON`.`Grupo`
-- -----------------------------------------------------
START TRANSACTION;
USE `SISCON`;
INSERT INTO `SISCON`.`Grupo` (`CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `atributos`, `horasClase`, `horasLaboratorio`, `unidades`, `porcentajeClase`, `numeroProfesores`, `claseExclusiva`, `alumnosInscritos`) VALUES (1, 'TC', '1014', 1, 1, 201111, NULL, '3', '3', '8', '50%', 2, 0, 20);
INSERT INTO `SISCON`.`Grupo` (`CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `atributos`, `horasClase`, `horasLaboratorio`, `unidades`, `porcentajeClase`, `numeroProfesores`, `claseExclusiva`, `alumnosInscritos`) VALUES (1, 'TC', '1014', 1, 2, 201111, NULL, '3', '3', '8', '50%', 2, 0, 20);
INSERT INTO `SISCON`.`Grupo` (`CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `atributos`, `horasClase`, `horasLaboratorio`, `unidades`, `porcentajeClase`, `numeroProfesores`, `claseExclusiva`, `alumnosInscritos`) VALUES (2, 'F', '1001', 1, 3, 201112, NULL, '3', '0', '8', '100%', 1, 0, 10);
INSERT INTO `SISCON`.`Grupo` (`CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `atributos`, `horasClase`, `horasLaboratorio`, `unidades`, `porcentajeClase`, `numeroProfesores`, `claseExclusiva`, `alumnosInscritos`) VALUES (3, 'H', '1001', 1, 4, 201112, NULL, '3', '0', '8', '100%', 1, 0, 20);
INSERT INTO `SISCON`.`Grupo` (`CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `atributos`, `horasClase`, `horasLaboratorio`, `unidades`, `porcentajeClase`, `numeroProfesores`, `claseExclusiva`, `alumnosInscritos`) VALUES (4, 'TC', '1003', 1, 1, 201112, NULL, '3', '0', '8', '100%', 1, 0, 30);
INSERT INTO `SISCON`.`Grupo` (`CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `atributos`, `horasClase`, `horasLaboratorio`, `unidades`, `porcentajeClase`, `numeroProfesores`, `claseExclusiva`, `alumnosInscritos`) VALUES (5, 'TC', '1022', 1, 2, 201112, NULL, '3', '0', '8', '100%', 1, 0, 30);
INSERT INTO `SISCON`.`Grupo` (`CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `atributos`, `horasClase`, `horasLaboratorio`, `unidades`, `porcentajeClase`, `numeroProfesores`, `claseExclusiva`, `alumnosInscritos`) VALUES (6, 'MA', '2009', 1, 3, 201112, NULL, '3', '0', '8', '100%', 1, 0, 30);
INSERT INTO `SISCON`.`Grupo` (`CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `atributos`, `horasClase`, `horasLaboratorio`, `unidades`, `porcentajeClase`, `numeroProfesores`, `claseExclusiva`, `alumnosInscritos`) VALUES (7, 'TC', '1021', 1, 4, 201113, NULL, '6', '0', '12', '25%', 4, 0, 50);
INSERT INTO `SISCON`.`Grupo` (`CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `atributos`, `horasClase`, `horasLaboratorio`, `unidades`, `porcentajeClase`, `numeroProfesores`, `claseExclusiva`, `alumnosInscritos`) VALUES (7, 'TC', '1021', 1, 1, 201113, NULL, '6', '0', '12', '25%', 4, 0, 50);
INSERT INTO `SISCON`.`Grupo` (`CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `atributos`, `horasClase`, `horasLaboratorio`, `unidades`, `porcentajeClase`, `numeroProfesores`, `claseExclusiva`, `alumnosInscritos`) VALUES (7, 'TC', '1021', 1, 2, 201113, NULL, '6', '0', '12', '25%', 4, 0, 50);
INSERT INTO `SISCON`.`Grupo` (`CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `atributos`, `horasClase`, `horasLaboratorio`, `unidades`, `porcentajeClase`, `numeroProfesores`, `claseExclusiva`, `alumnosInscritos`) VALUES (7, 'TC', '1021', 1, 3, 201113, NULL, '6', '0', '12', '25%', 4, 0, 50);

COMMIT;

-- -----------------------------------------------------
-- Data for table `SISCON`.`semestreMateria`
-- -----------------------------------------------------
START TRANSACTION;
USE `SISCON`;
INSERT INTO `SISCON`.`semestreMateria` (`materia`, `curso`, `idSemestre`, `idPlan`, `idCarrera`) VALUES ('TC', '1014', 12, 2, 1);
INSERT INTO `SISCON`.`semestreMateria` (`materia`, `curso`, `idSemestre`, `idPlan`, `idCarrera`) VALUES ('TC', '1014', 22, 3, 2);
INSERT INTO `SISCON`.`semestreMateria` (`materia`, `curso`, `idSemestre`, `idPlan`, `idCarrera`) VALUES ('F', '1001', 11, 2, 1);
INSERT INTO `SISCON`.`semestreMateria` (`materia`, `curso`, `idSemestre`, `idPlan`, `idCarrera`) VALUES ('F', '1001', 21, 3, 2);
INSERT INTO `SISCON`.`semestreMateria` (`materia`, `curso`, `idSemestre`, `idPlan`, `idCarrera`) VALUES ('H', '1001', 11, 2, 1);
INSERT INTO `SISCON`.`semestreMateria` (`materia`, `curso`, `idSemestre`, `idPlan`, `idCarrera`) VALUES ('TC', '1003', 21, 3, 2);
INSERT INTO `SISCON`.`semestreMateria` (`materia`, `curso`, `idSemestre`, `idPlan`, `idCarrera`) VALUES ('TC', '1003', 12, 2, 1);
INSERT INTO `SISCON`.`semestreMateria` (`materia`, `curso`, `idSemestre`, `idPlan`, `idCarrera`) VALUES ('TC', '1022', 22, 3, 2);
INSERT INTO `SISCON`.`semestreMateria` (`materia`, `curso`, `idSemestre`, `idPlan`, `idCarrera`) VALUES ('TC', '1022', 12, 2, 1);
INSERT INTO `SISCON`.`semestreMateria` (`materia`, `curso`, `idSemestre`, `idPlan`, `idCarrera`) VALUES ('TC', '1022', 14, 2, 1);
INSERT INTO `SISCON`.`semestreMateria` (`materia`, `curso`, `idSemestre`, `idPlan`, `idCarrera`) VALUES ('MA', '2009', 24, 3, 2);
INSERT INTO `SISCON`.`semestreMateria` (`materia`, `curso`, `idSemestre`, `idPlan`, `idCarrera`) VALUES ('TC', '1021', 15, 2, 1);
INSERT INTO `SISCON`.`semestreMateria` (`materia`, `curso`, `idSemestre`, `idPlan`, `idCarrera`) VALUES ('TC', '1021', 25, 3, 2);

COMMIT;

-- -----------------------------------------------------
-- Data for table `SISCON`.`Horarios`
-- -----------------------------------------------------
START TRANSACTION;
USE `SISCON`;
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (1, 1, 'TC', '1014', 1, 1, 201111, 'A5205', 'Lunes', '10:30', '12:00');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (2, 1, 'TC', '1014', 1, 1, 201111, 'A5205', 'Miercoles', '10:30', '12:00');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (3, 1, 'TC', '1014', 1, 2, 201111, 'A5205', 'Lunes', '10:30', '12:00');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (4, 1, 'TC', '1014', 1, 2, 201111, 'A5205', 'Miercoles', '10:30', '12:00');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (5, 2, 'F', '1001', 1, 3, 201112, 'A5205', 'Martes', '10:30', '12:00');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (6, 2, 'F', '1001', 1, 3, 201112, 'A5205', 'Jueves', '10:30', '12:00');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (7, 3, 'H', '1001', 1, 4, 201112, 'A5205', 'Lunes', '10:30', '12:00');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (8, 3, 'H', '1001', 1, 4, 201112, 'A5205', 'Miercoles', '10:30', '12:00');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (9, 4, 'TC', '1003', 1, 1, 201112, 'A5205', 'Lunes', '12:00', '13:30');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (10, 4, 'TC', '1003', 1, 1, 201112, 'A5205', 'Miercoles', '12:00', '13:30');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (11, 5, 'TC', '1022', 1, 2, 201112, 'A5205', 'Martes', '12:00', '13:30');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (12, 5, 'TC', '1022', 1, 2, 201112, 'A5205', 'Jueves', '12:00', '13:30');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (13, 6, 'MA', '2009', 1, 3, 201112, 'A5205', 'Lunes', '18:00', '19:30');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (14, 6, 'MA', '2009', 1, 3, 201112, 'A5205', 'Miercoles', '18:00', '19:30');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (15, 7, 'TC', '1021', 1, 4, 201113, 'A5206', 'Lunes', '18:00', '19:30');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (16, 7, 'TC', '1021', 1, 4, 201113, 'A5206', 'Miercoles', '18:00', '19:30');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (17, 7, 'TC', '1021', 1, 1, 201113, 'A5206', 'Lunes', '18:00', '19:30');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (18, 7, 'TC', '1021', 1, 1, 201113, 'A5206', 'Miercoles', '18:00', '19:30');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (19, 7, 'TC', '1021', 1, 2, 201113, 'A5206', 'Lunes', '18:00', '19:30');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (20, 7, 'TC', '1021', 1, 2, 201113, 'A5206', 'Miercoles', '18:00', '19:30');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (21, 7, 'TC', '1021', 1, 3, 201113, 'A5206', 'Lunes', '18:00', '19:30');
INSERT INTO `SISCON`.`Horarios` (`idHorarios`, `CRN`, `materia`, `curso`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `salon`, `diaSemana`, `horaInicio`, `horaFin`) VALUES (22, 7, 'TC', '1021', 1, 3, 201113, 'A5206', 'Miercoles', '18:00', '19:30');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SISCON`.`tablaNotificacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `SISCON`;
INSERT INTO `SISCON`.`tablaNotificacion` (`idtablaNotificacion`, `indexUsuario`, `idDepartamento`) VALUES (1, 1, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `SISCON`.`actividadesExtra`
-- -----------------------------------------------------
START TRANSACTION;
USE `SISCON`;
INSERT INTO `SISCON`.`actividadesExtra` (`idActividadesExtra`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `diaSemana`, `horaInicio`, `horaFin`, `duracion`, `actividad`) VALUES (1, 1, 1, 201111, 'Lunes', '10:00', '12:30', '2.5', 'Comida');
INSERT INTO `SISCON`.`actividadesExtra` (`idActividadesExtra`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `diaSemana`, `horaInicio`, `horaFin`, `duracion`, `actividad`) VALUES (1, 1, 2, 201111, 'Martes', '08:00', '09:30', '1.5', 'Asesoria');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SISCON`.`registroExcel`
-- -----------------------------------------------------
START TRANSACTION;
USE `SISCON`;
INSERT INTO `SISCON`.`registroExcel` (`idregistroExcel`, `indexUsuario`, `idDepartamento`, `fecha`, `nombreArchivo`) VALUES (1, 1, 1, '2012-04-22', 'SBG.xls');

COMMIT;
