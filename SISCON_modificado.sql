SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `SISCON` DEFAULT CHARACTER SET latin1 ;
USE `SISCON` ;

-- -----------------------------------------------------
-- Table `SISCON`.`Carrera`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`Carrera` (
  `idCarrera` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombreCarrera` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `siglasCarrera` VARCHAR(5) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  PRIMARY KEY (`idCarrera`) )
ENGINE = InnoDB
AUTO_INCREMENT = 472
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `SISCON`.`Departamento`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`Departamento` (
  `idDepartamento` INT(11) NOT NULL AUTO_INCREMENT ,
  `siglas` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL COMMENT 'CS(Ciencias Computacioanles), son las siglas del departamento' ,
  `departamento` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL COMMENT 'Nombre del Departamento' ,
  PRIMARY KEY (`idDepartamento`) )
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `SISCON`.`Materia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`Materia` (
  `materia` VARCHAR(5) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `curso` VARCHAR(5) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `nombreMateria` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `disciplina` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  PRIMARY KEY (`materia`, `curso`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `SISCON`.`Periodo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`Periodo` (
  `idPeriodo` INT(11) NOT NULL ,
  `anio` VARCHAR(4) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL COMMENT 'Esta llave se toma del excel, esta llave es auto descriptiva, los 4 primeros caracteres corresponden al año y los ultimos dos al periodo (Ene-Mayo,Vernao,Ago-Dic)' ,
  `periodoValue` VARCHAR(4) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL COMMENT '11 es Ene-May, 12 es Verano, y 13 es Ago-Dic' ,
  `periodo` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL COMMENT 'El periodo en formato Ene-May, Verano, Ago-Dic' ,
  PRIMARY KEY (`idPeriodo`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `SISCON`.`Usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`Usuario` (
  `indexUsuario` INT(11) NOT NULL AUTO_INCREMENT ,
  `idDepartamento` INT(11) NOT NULL DEFAULT '0' ,
  `idUsuario` VARCHAR(9) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL COMMENT 'Es la \"Matricula del Profesor\"' ,
  `nombreUsuario` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `apellidoUsuario` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `genero` CHAR(1) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT 'M' COMMENT 'Masculino o Femenino' ,
  `email` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL ,
  `alta` BIT(1) NOT NULL DEFAULT b'0' ,
  `password` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `administrador` BIT(1) NOT NULL DEFAULT b'0' ,
  `rol` CHAR(5) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL DEFAULT 'P' COMMENT 'Profesor\nDirector... Cualquier rol que se desee\nAgregar' ,
  `buscarHorarioProfesores` BIT NOT NULL DEFAULT b'1' ,
  `buscarHorarioMateria` BIT NOT NULL DEFAULT b'1' ,
  `buscarHorarioSalon` BIT NOT NULL DEFAULT b'1' ,
  PRIMARY KEY (`indexUsuario`, `idDepartamento`) ,
  INDEX `idDepartamentoUsuario` (`idDepartamento` ASC) ,
  CONSTRAINT `idDepartamentoUsuario`
    FOREIGN KEY (`idDepartamento` )
    REFERENCES `SISCON`.`Departamento` (`idDepartamento` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 91
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `SISCON`.`Grupo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`Grupo` (
  `CRN` INT(11) NOT NULL ,
  `materia` VARCHAR(5) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `curso` VARCHAR(5) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `idDepartamento` INT(11) NOT NULL ,
  `indexUsuario` INT(11) NOT NULL ,
  `idPeriodo` INT(11) NOT NULL ,
  `atributos` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL COMMENT 'Atributos de la clase, vienen en el excel en la casilla Atributos' ,
  `horasClase` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL COMMENT 'HC en el excel' ,
  `horasLaboratorio` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL COMMENT 'HL en el excel' ,
  `unidades` VARCHAR(2) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL COMMENT 'UN en el excel' ,
  `porcentajeClase` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL COMMENT 'Porcentaje de clase que da el profesor.' ,
  `numeroProfesores` SMALLINT(6) NOT NULL COMMENT 'Numero de profesores que dan la clase' ,
  `claseExclusiva` SMALLINT(6) NOT NULL COMMENT 'Si la clase es exclusiva de un profesor, 0 si no 1 si si' ,
  `alumnosInscritos` INT(11) NOT NULL ,
  PRIMARY KEY (`CRN`, `materia`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `curso`) ,
  INDEX `GrupoUsuario` (`indexUsuario` ASC, `idDepartamento` ASC) ,
  INDEX `GrupoPeriodo` (`idPeriodo` ASC) ,
  INDEX `GrupoMateria` (`materia` ASC, `curso` ASC) ,
  CONSTRAINT `GrupoMateria`
    FOREIGN KEY (`materia` , `curso` )
    REFERENCES `SISCON`.`Materia` (`materia` , `curso` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `GrupoPeriodo`
    FOREIGN KEY (`idPeriodo` )
    REFERENCES `SISCON`.`Periodo` (`idPeriodo` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `GrupoUsuario`
    FOREIGN KEY (`indexUsuario` , `idDepartamento` )
    REFERENCES `SISCON`.`Usuario` (`indexUsuario` , `idDepartamento` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `SISCON`.`Horarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`Horarios` (
  `idHorarios` INT(11) NOT NULL AUTO_INCREMENT ,
  `CRN` INT(11) NOT NULL ,
  `materia` VARCHAR(5) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `curso` VARCHAR(5) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `idDepartamento` INT(11) NOT NULL ,
  `indexUsuario` INT(11) NOT NULL ,
  `idPeriodo` INT(11) NOT NULL ,
  `salon` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `diaSemana` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `horaInicio` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `horaFin` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  PRIMARY KEY (`idHorarios`, `CRN`, `materia`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `curso`) ,
  INDEX `HGrupos` (`CRN` ASC, `materia` ASC, `idDepartamento` ASC, `indexUsuario` ASC, `idPeriodo` ASC, `curso` ASC) ,
  CONSTRAINT `HGrupos`
    FOREIGN KEY (`CRN` , `materia` , `idDepartamento` , `indexUsuario` , `idPeriodo` , `curso` )
    REFERENCES `SISCON`.`Grupo` (`CRN` , `materia` , `idDepartamento` , `indexUsuario` , `idPeriodo` , `curso` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1408
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `SISCON`.`PlanDeEstudios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`PlanDeEstudios` (
  `idPlanDeEstudios` INT(11) NOT NULL AUTO_INCREMENT ,
  `idCarrera` INT(11) NOT NULL DEFAULT '0' ,
  `anioPlan` VARCHAR(5) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `descripcion` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL ,
  PRIMARY KEY (`idPlanDeEstudios`, `idCarrera`) ,
  INDEX `planDeEstudiosCarrera` (`idCarrera` ASC) ,
  CONSTRAINT `planDeEstudiosCarrera`
    FOREIGN KEY (`idCarrera` )
    REFERENCES `SISCON`.`Carrera` (`idCarrera` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `SISCON`.`Semestre`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`Semestre` (
  `idSemestre` INT(11) NOT NULL AUTO_INCREMENT ,
  `idPlan` INT(11) NOT NULL DEFAULT '0' ,
  `idCarrera` INT(11) NOT NULL DEFAULT '0' ,
  `semestre` VARCHAR(2) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  PRIMARY KEY (`idSemestre`, `idPlan`, `idCarrera`) ,
  INDEX `SemestrePlanDeEstudios` (`idPlan` ASC, `idCarrera` ASC) ,
  CONSTRAINT `SemestrePlanDeEstudios`
    FOREIGN KEY (`idPlan` , `idCarrera` )
    REFERENCES `SISCON`.`PlanDeEstudios` (`idPlanDeEstudios` , `idCarrera` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `SISCON`.`Telefono`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`Telefono` (
  `idTelefono` INT(11) NOT NULL AUTO_INCREMENT ,
  `indexUsuario` INT(11) NOT NULL DEFAULT '0' ,
  `idDepartamento` INT(11) NOT NULL DEFAULT '0' ,
  `telefono` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `extension` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT '' ,
  PRIMARY KEY (`idTelefono`, `indexUsuario`, `idDepartamento`) ,
  INDEX `TelefonoUsuario` (`indexUsuario` ASC, `idDepartamento` ASC) ,
  CONSTRAINT `TelefonoUsuario`
    FOREIGN KEY (`indexUsuario` , `idDepartamento` )
    REFERENCES `SISCON`.`Usuario` (`indexUsuario` , `idDepartamento` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `SISCON`.`actividadesExtra`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`actividadesExtra` (
  `idActividadesExtra` INT(11) NOT NULL AUTO_INCREMENT ,
  `idDepartamento` INT(11) NOT NULL ,
  `indexUsuario` INT(11) NOT NULL ,
  `idPeriodo` INT(11) NOT NULL ,
  `diaSemana` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `horaInicio` VARCHAR(6) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `horaFin` VARCHAR(6) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `duracion` VARCHAR(4) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL ,
  `actividad` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL DEFAULT 'Comida' ,
  PRIMARY KEY (`idActividadesExtra`, `idDepartamento`, `indexUsuario`, `idPeriodo`) ,
  INDEX `AEUsuario` (`indexUsuario` ASC, `idDepartamento` ASC) ,
  INDEX `AEPeriodo` (`idPeriodo` ASC) ,
  CONSTRAINT `AEPeriodo`
    FOREIGN KEY (`idPeriodo` )
    REFERENCES `SISCON`.`Periodo` (`idPeriodo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `AEUsuario`
    FOREIGN KEY (`indexUsuario` , `idDepartamento` )
    REFERENCES `SISCON`.`Usuario` (`indexUsuario` , `idDepartamento` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `SISCON`.`registroExcel`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`registroExcel` (
  `idregistroExcel` INT(11) NOT NULL AUTO_INCREMENT ,
  `indexUsuario` INT(11) NOT NULL ,
  `deptPlan` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `fecha` DATETIME NOT NULL ,
  `nombreArchivo` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `tipo` BIT(1) NOT NULL ,
  PRIMARY KEY (`idregistroExcel`, `indexUsuario`) ,
  INDEX `REUsuario` (`indexUsuario` ASC, `deptPlan` ASC) ,
  INDEX `RegExUsuario` (`indexUsuario` ASC) ,
  CONSTRAINT `RegExUsuario`
    FOREIGN KEY (`indexUsuario` )
    REFERENCES `SISCON`.`Usuario` (`indexUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `SISCON`.`semestreMateria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`semestreMateria` (
  `materia` VARCHAR(5) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `curso` VARCHAR(5) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `idSemestre` INT(11) NOT NULL ,
  `idPlan` INT(11) NOT NULL ,
  `idCarrera` INT(11) NOT NULL ,
  PRIMARY KEY (`idSemestre`, `idPlan`, `materia`, `curso`, `idCarrera`) ,
  INDEX `SMSem` (`idSemestre` ASC, `idPlan` ASC, `idCarrera` ASC) ,
  INDEX `SMMateria` (`materia` ASC, `curso` ASC) ,
  CONSTRAINT `SMMateria`
    FOREIGN KEY (`materia` , `curso` )
    REFERENCES `SISCON`.`Materia` (`materia` , `curso` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `SMSem`
    FOREIGN KEY (`idSemestre` , `idPlan` , `idCarrera` )
    REFERENCES `SISCON`.`Semestre` (`idSemestre` , `idPlan` , `idCarrera` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `SISCON`.`tablaNotificacion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SISCON`.`tablaNotificacion` (
  `idtablaNotificacion` INT(11) NOT NULL AUTO_INCREMENT ,
  `indexUsuario` INT(11) NOT NULL DEFAULT '0' ,
  `idDepartamento` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`idtablaNotificacion`, `indexUsuario`, `idDepartamento`) ,
  INDEX `notificacionUsuario` (`indexUsuario` ASC, `idDepartamento` ASC) ,
  CONSTRAINT `notificacionUsuario`
    FOREIGN KEY (`indexUsuario` , `idDepartamento` )
    REFERENCES `SISCON`.`Usuario` (`indexUsuario` , `idDepartamento` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Placeholder table for view `SISCON`.`VactividadesProfesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SISCON`.`VactividadesProfesores` (`idDepartamento` INT, `indexUsuario` INT, `idUsuario` INT, `nombreUsuario` INT, `apellidoUsuario` INT, `genero` INT, `email` INT, `actividad` INT, `diaSemana` INT, `horaInicio` INT, `horaFin` INT, `duracion` INT);

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
-- Placeholder table for view `SISCON`.`VusuarioRegistroExcel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SISCON`.`VusuarioRegistroExcel` (`idDepartamento` INT, `indexUsuario` INT, `idUsuario` INT, `nombreUsuario` INT, `apellidoUsuario` INT, `email` INT, `rol` INT, `fecha` INT, `nombreArchivo` INT);

-- -----------------------------------------------------
-- Placeholder table for view `SISCON`.`VusuariosNotificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SISCON`.`VusuariosNotificacion` (`idtablaNotificacion` INT, `idDepartamento` INT, `departamento` INT, `siglas` INT, `indexUsuario` INT, `idUsuario` INT, `nombreUsuario` INT, `apellidoUsuario` INT, `genero` INT, `email` INT, `alta` INT, `rol` INT, `administrador` INT);

-- -----------------------------------------------------
-- View `SISCON`.`VactividadesProfesores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISCON`.`VactividadesProfesores`;
USE `SISCON`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `SISCON`.`VactividadesProfesores` AS select distinct `u`.`idDepartamento` AS `idDepartamento`,`u`.`indexUsuario` AS `indexUsuario`,`u`.`idUsuario` AS `idUsuario`,`u`.`nombreUsuario` AS `nombreUsuario`,`u`.`apellidoUsuario` AS `apellidoUsuario`,`u`.`genero` AS `genero`,`u`.`email` AS `email`,`ae`.`actividad` AS `actividad`,`ae`.`diaSemana` AS `diaSemana`,`ae`.`horaInicio` AS `horaInicio`,`ae`.`horaFin` AS `horaFin`,`ae`.`duracion` AS `duracion` from (`SISCON`.`Usuario` `u` join `SISCON`.`actividadesExtra` `ae`) where ((`ae`.`indexUsuario` = `u`.`indexUsuario`) and (`ae`.`idDepartamento` = `u`.`idDepartamento`)) order by `u`.`idDepartamento`,`u`.`indexUsuario`,`ae`.`diaSemana`,`ae`.`horaInicio`,`ae`.`horaFin`;

-- -----------------------------------------------------
-- View `SISCON`.`VhorariosProfesores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISCON`.`VhorariosProfesores`;
USE `SISCON`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `SISCON`.`VhorariosProfesores` AS select distinct `u`.`idUsuario` AS `idUsuario`,`u`.`nombreUsuario` AS `nombreUsuario`,`u`.`apellidoUsuario` AS `apellidoUsuario`,`g`.`CRN` AS `CRN`,`g`.`horasClase` AS `horasClase`,`g`.`horasLaboratorio` AS `horasLaboratorio`,`g`.`unidades` AS `unidades`,`g`.`porcentajeClase` AS `porcentajeClase`,`g`.`numeroProfesores` AS `numeroProfesores`,`g`.`claseExclusiva` AS `claseExclusiva`,`g`.`alumnosInscritos` AS `alumnosInscritos`,`m`.`materia` AS `materia`,`m`.`curso` AS `curso`,`m`.`nombreMateria` AS `nombreMateria`,`p`.`idPeriodo` AS `idPeriodo`,`p`.`anio` AS `anio`,`p`.`periodo` AS `periodo`,`h`.`salon` AS `salon`,`h`.`diaSemana` AS `diaSemana`,`h`.`horaInicio` AS `horaInicio`,`h`.`horaFin` AS `horaFin`,TIME_TO_SEC(TIMEDIFF(TIME(`h`.`horaFin`),TIME(`h`.`horaInicio`)))*1000 as duracionMillis from ((((`SISCON`.`Usuario` `u` join `SISCON`.`Grupo` `g` on(((`u`.`indexUsuario` = `g`.`indexUsuario`) and (`u`.`idDepartamento` = `g`.`idDepartamento`)))) join `SISCON`.`Materia` `m` on(((`g`.`materia` = `m`.`materia`) and (`g`.`curso` = `m`.`curso`)))) join `SISCON`.`Periodo` `p` on((`g`.`idPeriodo` = `p`.`idPeriodo`))) join `SISCON`.`Horarios` `h` on(((`h`.`CRN` = `g`.`CRN`) and (`h`.`indexUsuario` = `g`.`indexUsuario`)))) order by `u`.`idUsuario`,`g`.`CRN`,`p`.`idPeriodo`;

-- -----------------------------------------------------
-- View `SISCON`.`VplanesCarreras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISCON`.`VplanesCarreras`;
USE `SISCON`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `SISCON`.`VplanesCarreras` AS select `c`.`nombreCarrera` AS `nombreCarrera`,`c`.`siglasCarrera` AS `siglasCarrera`,`p`.`anioPlan` AS `anioPlan`,`p`.`descripcion` AS `descripcionPlan`,`s`.`semestre` AS `semestre`,`m`.`materia` AS `materia`,`m`.`curso` AS `curso`,`m`.`nombreMateria` AS `nombreMateria` from ((((`SISCON`.`Carrera` `c` join `SISCON`.`PlanDeEstudios` `p` on((`c`.`idCarrera` = `p`.`idCarrera`))) join `SISCON`.`Semestre` `s` on((`s`.`idPlan` = `p`.`idPlanDeEstudios`))) join `SISCON`.`semestreMateria` `sm` on((`sm`.`idSemestre` = `s`.`idSemestre`))) join `SISCON`.`Materia` `m` on(((`sm`.`materia` = `m`.`materia`) and (`sm`.`curso` = `m`.`curso`)))) order by `c`.`siglasCarrera`,`p`.`anioPlan`,`s`.`semestre`,`m`.`materia`,`m`.`curso`;

-- -----------------------------------------------------
-- View `SISCON`.`VtelefonosUsuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISCON`.`VtelefonosUsuarios`;
USE `SISCON`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `SISCON`.`VtelefonosUsuarios` AS select `u`.`idDepartamento` AS `idDepartamento`,`u`.`idUsuario` AS `idUsuario`,`d`.`siglas` AS `siglas`,`d`.`departamento` AS `departamento`,`u`.`indexUsuario` AS `indexUsuario`,`u`.`email` AS `email`,`u`.`nombreUsuario` AS `nombreUsuario`,`u`.`apellidoUsuario` AS `apellidoUsuario`,`t`.`telefono` AS `telefono`,`t`.`extension` AS `extension` from ((`SISCON`.`Usuario` `u` join `SISCON`.`Telefono` `t` on((`u`.`indexUsuario` = `t`.`indexUsuario`))) join `SISCON`.`Departamento` `d` on((`d`.`idDepartamento` = `u`.`idDepartamento`))) order by `u`.`idUsuario`;

-- -----------------------------------------------------
-- View `SISCON`.`VusuarioRegistroExcel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISCON`.`VusuarioRegistroExcel`;
USE `SISCON`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `SISCON`.`VusuarioRegistroExcel` AS select `u`.`idDepartamento` AS `idDepartamento`,`u`.`indexUsuario` AS `indexUsuario`,`u`.`idUsuario` AS `idUsuario`,`u`.`nombreUsuario` AS `nombreUsuario`,`u`.`apellidoUsuario` AS `apellidoUsuario`,`u`.`email` AS `email`,`u`.`rol` AS `rol`,`re`.`fecha` AS `fecha`,`re`.`nombreArchivo` AS `nombreArchivo` from (`SISCON`.`Usuario` `u` join `SISCON`.`registroExcel` `re` on(((`re`.`indexUsuario` = `u`.`indexUsuario`) and (`re`.`deptPlan` = `u`.`idDepartamento`))));

-- -----------------------------------------------------
-- View `SISCON`.`VusuariosNotificacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISCON`.`VusuariosNotificacion`;
USE `SISCON`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `SISCON`.`VusuariosNotificacion` AS select `t`.`idtablaNotificacion` AS `idtablaNotificacion`,`u`.`idDepartamento` AS `idDepartamento`,`d`.`departamento` AS `departamento`,`d`.`siglas` AS `siglas`,`u`.`indexUsuario` AS `indexUsuario`,`u`.`idUsuario` AS `idUsuario`,`u`.`nombreUsuario` AS `nombreUsuario`,`u`.`apellidoUsuario` AS `apellidoUsuario`,`u`.`genero` AS `genero`,`u`.`email` AS `email`,`u`.`alta` AS `alta`,`u`.`rol` AS `rol`,`u`.`administrador` AS `administrador` from ((`SISCON`.`Departamento` `d` join `SISCON`.`Usuario` `u` on((`u`.`idDepartamento` = `d`.`idDepartamento`))) join `SISCON`.`tablaNotificacion` `t` on(((`u`.`idDepartamento` = `t`.`idDepartamento`) and (`u`.`indexUsuario` = `t`.`indexUsuario`))));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- Data for table `SISCON`.`Departamento`
-- -----------------------------------------------------
START TRANSACTION;
USE `SISCON`;
INSERT INTO `SISCON`.`Departamento` (`idDepartamento`, `siglas`, `departamento`) VALUES (1, 'CS', 'Ciencias Computacionales');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SISCON`.`Usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `SISCON`;
INSERT INTO `SISCON`.`Usuario` (`indexUsuario`, `idDepartamento`, `idUsuario`, `nombreUsuario`, `apellidoUsuario`, `genero`, `email`, `alta`, `password`, `administrador`, `rol`) VALUES (1, 1, 'L00215087', 'Elda Guadalupe', 'Quiroga Gonzalez', 'F', 'x@itesm.mx', 0, '\'\'', 0, 'P');
INSERT INTO `SISCON`.`Usuario` (`indexUsuario`, `idDepartamento`, `idUsuario`, `nombreUsuario`, `apellidoUsuario`, `genero`, `email`, `alta`, `password`, `administrador`, `rol`) VALUES (2, 1, 'L00276543', 'Ramon Felipe', 'Brena Pinero', 'M', 'y@itesm.mx', 0, '\'\'', 0, 'P');
INSERT INTO `SISCON`.`Usuario` (`indexUsuario`, `idDepartamento`, `idUsuario`, `nombreUsuario`, `apellidoUsuario`, `genero`, `email`, `alta`, `password`, `administrador`, `rol`) VALUES (3, 1, 'L00265355', 'Hugo', 'Terashima Marin', 'M', 'w@itesm.mx', 0, '2012b50d721667cc8c83a045a770d9e6', 0, 'P');
INSERT INTO `SISCON`.`Usuario` (`indexUsuario`, `idDepartamento`, `idUsuario`, `nombreUsuario`, `apellidoUsuario`, `genero`, `email`, `alta`, `password`, `administrador`, `rol`) VALUES (4, 1, 'L00234153', 'Juan Arturo', 'Nolazco Flores', 'M', 'z@itesm.mx', 1, '12345', 1, 'P');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SISCON`.`Telefono`
-- -----------------------------------------------------
START TRANSACTION;
USE `SISCON`;
INSERT INTO `SISCON`.`Telefono` (`idTelefono`, `indexUsuario`, `idDepartamento`, `telefono`, `extension`) VALUES (1, 1, 1, '83284488', '');
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


