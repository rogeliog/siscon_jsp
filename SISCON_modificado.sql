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
  `extension` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL ,
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
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `SISCON`.`VactividadesProfesores` AS select `u`.`idDepartamento` AS `idDepartamento`,`u`.`indexUsuario` AS `indexUsuario`,`u`.`idUsuario` AS `idUsuario`,`u`.`nombreUsuario` AS `nombreUsuario`,`u`.`apellidoUsuario` AS `apellidoUsuario`,`u`.`genero` AS `genero`,`u`.`email` AS `email`,`ae`.`actividad` AS `actividad`,`ae`.`diaSemana` AS `diaSemana`,`ae`.`horaInicio` AS `horaInicio`,`ae`.`horaFin` AS `horaFin`,`ae`.`duracion` AS `duracion` from (`SISCON`.`Usuario` `u` join `SISCON`.`actividadesExtra` `ae`) where ((`ae`.`indexUsuario` = `u`.`indexUsuario`) and (`ae`.`idDepartamento` = `u`.`idDepartamento`)) order by `u`.`idDepartamento`,`u`.`indexUsuario`,`ae`.`diaSemana`,`ae`.`horaInicio`,`ae`.`horaFin`;

-- -----------------------------------------------------
-- View `SISCON`.`VhorariosProfesores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SISCON`.`VhorariosProfesores`;
USE `SISCON`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `SISCON`.`VhorariosProfesores` AS select `u`.`idUsuario` AS `idUsuario`,`u`.`nombreUsuario` AS `nombreUsuario`,`u`.`apellidoUsuario` AS `apellidoUsuario`,`g`.`CRN` AS `CRN`,`g`.`horasClase` AS `horasClase`,`g`.`horasLaboratorio` AS `horasLaboratorio`,`g`.`unidades` AS `unidades`,`g`.`porcentajeClase` AS `porcentajeClase`,`g`.`numeroProfesores` AS `numeroProfesores`,`g`.`claseExclusiva` AS `claseExclusiva`,`g`.`alumnosInscritos` AS `alumnosInscritos`,`m`.`materia` AS `materia`,`m`.`curso` AS `curso`,`m`.`nombreMateria` AS `nombreMateria`,`p`.`idPeriodo` AS `idPeriodo`,`p`.`anio` AS `anio`,`p`.`periodo` AS `periodo`,`h`.`salon` AS `salon`,`h`.`diaSemana` AS `diaSemana`,`h`.`horaInicio` AS `horaInicio`,`h`.`horaFin` AS `horaFin` from ((((`SISCON`.`Usuario` `u` join `SISCON`.`Grupo` `g` on(((`u`.`indexUsuario` = `g`.`indexUsuario`) and (`u`.`idDepartamento` = `g`.`idDepartamento`)))) join `SISCON`.`Materia` `m` on(((`g`.`materia` = `m`.`materia`) and (`g`.`curso` = `m`.`curso`)))) join `SISCON`.`Periodo` `p` on((`g`.`idPeriodo` = `p`.`idPeriodo`))) join `SISCON`.`Horarios` `h` on(((`h`.`CRN` = `g`.`CRN`) and (`h`.`indexUsuario` = `g`.`indexUsuario`)))) WHERE `u`.`nombreUsuario` IS NOT NULL order by `u`.`idUsuario`,`g`.`CRN`,`p`.`idPeriodo`;

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
