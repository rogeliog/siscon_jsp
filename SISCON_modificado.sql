-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 04, 2012 at 11:41 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `SISCON`
--

-- --------------------------------------------------------

--
-- Table structure for table `actividadesExtra`
--

CREATE TABLE IF NOT EXISTS `actividadesExtra` (
  `idActividadesExtra` int(11) NOT NULL AUTO_INCREMENT,
  `idDepartamento` int(11) NOT NULL,
  `indexUsuario` int(11) NOT NULL,
  `idPeriodo` int(11) NOT NULL,
  `diaSemana` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `horaInicio` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `horaFin` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `duracion` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `actividad` varchar(15) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Comida',
  PRIMARY KEY (`idActividadesExtra`,`idDepartamento`,`indexUsuario`,`idPeriodo`),
  KEY `AEUsuario` (`indexUsuario`,`idDepartamento`),
  KEY `AEPeriodo` (`idPeriodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `actividadesExtra`
--


-- --------------------------------------------------------

--
-- Table structure for table `Carrera`
--

CREATE TABLE IF NOT EXISTS `Carrera` (
  `idCarrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCarrera` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `siglasCarrera` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idCarrera`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=472 ;

--
-- Dumping data for table `Carrera`
--

INSERT INTO `Carrera` (`idCarrera`, `nombreCarrera`, `siglasCarrera`) VALUES
(1, 'Ingeniero en Tecnologias de la Computacion', 'ITC'),
(2, 'Ingeniero en Tecnologias de la Informacion y la Comunicacion', 'ITIC');

-- --------------------------------------------------------

--
-- Table structure for table `Departamento`
--

CREATE TABLE IF NOT EXISTS `Departamento` (
  `idDepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `siglas` varchar(10) COLLATE utf8_spanish_ci NOT NULL COMMENT 'CS(Ciencias Computacioanles), son las siglas del departamento',
  `departamento` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Nombre del Departamento',
  PRIMARY KEY (`idDepartamento`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `Departamento`
--

INSERT INTO `Departamento` (`idDepartamento`, `siglas`, `departamento`) VALUES
(1, 'CS', 'Ciencias Computacionales'),
(2, '', 'Física'),
(3, '', 'Ingeniería Civil'),
(4, '', 'Ingeniería Eléctrica y Computacional'),
(5, '', 'Ingeniería Industrial y de Sistemas'),
(6, '', 'Ingeniería Mecánica'),
(7, '', 'Ingeniería Química'),
(8, '', 'Matemáticas'),
(9, '', 'Mecatrónica y Automatización'),
(10, '', 'Sistemas de Información');

-- --------------------------------------------------------

--
-- Table structure for table `Grupo`
--

CREATE TABLE IF NOT EXISTS `Grupo` (
  `CRN` int(11) NOT NULL,
  `materia` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `curso` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `idDepartamento` int(11) NOT NULL,
  `indexUsuario` int(11) NOT NULL,
  `idPeriodo` int(11) NOT NULL,
  `atributos` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Atributos de la clase, vienen en el excel en la casilla Atributos',
  `horasClase` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'HC en el excel',
  `horasLaboratorio` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'HL en el excel',
  `unidades` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'UN en el excel',
  `porcentajeClase` varchar(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Porcentaje de clase que da el profesor.',
  `numeroProfesores` smallint(6) NOT NULL COMMENT 'Numero de profesores que dan la clase',
  `claseExclusiva` smallint(6) NOT NULL COMMENT 'Si la clase es exclusiva de un profesor, 0 si no 1 si si',
  `alumnosInscritos` int(11) NOT NULL,
  PRIMARY KEY (`CRN`,`materia`,`idDepartamento`,`indexUsuario`,`idPeriodo`,`curso`),
  KEY `GrupoUsuario` (`indexUsuario`,`idDepartamento`),
  KEY `GrupoPeriodo` (`idPeriodo`),
  KEY `GrupoMateria` (`materia`,`curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `Grupo`
--


-- --------------------------------------------------------

--
-- Table structure for table `Horarios`
--

CREATE TABLE IF NOT EXISTS `Horarios` (
  `idHorarios` int(11) NOT NULL AUTO_INCREMENT,
  `CRN` int(11) NOT NULL,
  `materia` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `curso` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `idDepartamento` int(11) NOT NULL,
  `indexUsuario` int(11) NOT NULL,
  `idPeriodo` int(11) NOT NULL,
  `salon` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `diaSemana` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `horaInicio` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `horaFin` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idHorarios`,`CRN`,`materia`,`idDepartamento`,`indexUsuario`,`idPeriodo`,`curso`),
  KEY `HGrupos` (`CRN`,`materia`,`idDepartamento`,`indexUsuario`,`idPeriodo`,`curso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=950 ;

--
-- Dumping data for table `Horarios`
--


-- --------------------------------------------------------

--
-- Table structure for table `Materia`
--

CREATE TABLE IF NOT EXISTS `Materia` (
  `materia` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `curso` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `nombreMateria` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `disciplina` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`materia`,`curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `Materia`
--

INSERT INTO `Materia` (`materia`, `curso`, `nombreMateria`, `disciplina`) VALUES
('TC', '1013', 'Métodos numéricos y álgebra lineal', 'prueba'),
('TC', '1014', 'Fundamentos de Programacion', 'Ciencias Computacionales'),
('TC', '1015', 'Fundamentos de diseño interactivo', 'prueba'),
('TC', '1016', 'Organización computacional', 'prueba'),
('TC', '1017', 'Solución de problemas con programación', 'prueba'),
('TC', '1019', 'Fundamentos de ingeniería de software', 'prueba'),
('TC', '1021', 'Proyecto de Desarrollo de Videojuegos', 'Ciencias Computacionales'),
('TC', '1022', 'Introduccion a la Ingenieria en Tecnologias Computacionales', 'Ciencias Computacionales'),
('TC', '1024', 'Introducción a la ingeniería en tecnologías de información y comunicaciones', 'prueba'),
('TC', '2001', 'Análisis y diseño de algoritmos', 'prueba'),
('TC', '2002', 'Redes II', 'prueba'),
('TC', '2003', 'Teoría de la computación', 'prueba'),
('TC', '2004', 'Análisis y modelación de sistemas de software', 'prueba'),
('TC', '2005', 'Desarrollo de aplicaciones distribuidas', 'prueba'),
('TC', '2006', 'Lenguajes de programación', 'prueba'),
('TC', '2007', 'Métodos cuantitativos y simulación', 'prueba'),
('TC', '2008', 'Sistemas operativos', 'prueba'),
('TC', '2009', 'Uso y administración de sistemas operativos', 'prueba'),
('TC', '2010', 'Seguridad informática', 'prueba'),
('TC', '2011', 'Sistemas inteligentes', 'prueba'),
('TC', '2012', 'Proyecto de desarrollo de software', 'prueba'),
('TC', '2013', 'Introducción a gráficas computacionales', 'prueba'),
('TC', '2014', 'Análisis y diseño de algoritmos', 'prueba'),
('TC', '2015', 'Desarrollo de aplicaciones en lenguaje ensamblador', 'prueba'),
('TC', '2016', 'Programación orientada a objetos', 'prueba'),
('TC', '2021', 'Programación para artistas digitales', 'prueba'),
('TC', '3001', 'Optimización y programación lineal', 'prueba'),
('TC', '3002', 'Administración de proyectos de ingeniería de software', 'prueba'),
('TC', '3003', 'Diseño y arquitectura de software', 'prueba'),
('TC', '3004', 'Ingeniería de requerimientos', 'prueba');

-- --------------------------------------------------------

--
-- Table structure for table `Periodo`
--

CREATE TABLE IF NOT EXISTS `Periodo` (
  `idPeriodo` int(11) NOT NULL,
  `anio` varchar(4) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Esta llave se toma del excel, esta llave es auto descriptiva, los 4 primeros caracteres corresponden al año y los ultimos dos al periodo (Ene-Mayo,Vernao,Ago-Dic)',
  `periodoValue` varchar(4) COLLATE utf8_spanish_ci NOT NULL COMMENT '11 es Ene-May, 12 es Verano, y 13 es Ago-Dic',
  `periodo` varchar(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'El periodo en formato Ene-May, Verano, Ago-Dic',
  PRIMARY KEY (`idPeriodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `Periodo`
--

INSERT INTO `Periodo` (`idPeriodo`, `anio`, `periodoValue`, `periodo`) VALUES
(201111, '2011', '11', 'Enero-Mayo'),
(201112, '2011', '12', 'Verano'),
(201113, '2011', '13', 'Agosto-Diciembre'),
(201211, '2012', '11', 'Enero-Mayo'),
(201212, '2012', '12', 'Verano'),
(201213, '2012', '13', 'Agosto-Diciembre');

-- --------------------------------------------------------

--
-- Table structure for table `PlanDeEstudios`
--

CREATE TABLE IF NOT EXISTS `PlanDeEstudios` (
  `idPlanDeEstudios` int(11) NOT NULL AUTO_INCREMENT,
  `idCarrera` int(11) NOT NULL DEFAULT '0',
  `anioPlan` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci,
  PRIMARY KEY (`idPlanDeEstudios`,`idCarrera`),
  KEY `planDeEstudiosCarrera` (`idCarrera`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `PlanDeEstudios`
--

INSERT INTO `PlanDeEstudios` (`idPlanDeEstudios`, `idCarrera`, `anioPlan`, `descripcion`) VALUES
(1, 1, '2009', 'Plan de Estudios 2009');

-- --------------------------------------------------------

--
-- Table structure for table `registroExcel`
--

CREATE TABLE IF NOT EXISTS `registroExcel` (
  `idregistroExcel` int(11) NOT NULL AUTO_INCREMENT,
  `indexUsuario` int(11) NOT NULL,
  `deptPlan` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `nombreArchivo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` bit(1) NOT NULL,
  PRIMARY KEY (`idregistroExcel`,`indexUsuario`),
  KEY `REUsuario` (`indexUsuario`,`deptPlan`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `registroExcel`
--


-- --------------------------------------------------------

--
-- Table structure for table `Semestre`
--

CREATE TABLE IF NOT EXISTS `Semestre` (
  `idSemestre` int(11) NOT NULL AUTO_INCREMENT,
  `idPlan` int(11) NOT NULL DEFAULT '0',
  `idCarrera` int(11) NOT NULL DEFAULT '0',
  `semestre` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idSemestre`,`idPlan`,`idCarrera`),
  KEY `SemestrePlanDeEstudios` (`idPlan`,`idCarrera`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=31 ;

--
-- Dumping data for table `Semestre`
--

INSERT INTO `Semestre` (`idSemestre`, `idPlan`, `idCarrera`, `semestre`) VALUES
(1, 1, 1, '0'),
(2, 1, 1, '1'),
(3, 1, 1, '2'),
(4, 1, 1, '3'),
(5, 1, 1, '4'),
(6, 1, 1, '5'),
(7, 1, 1, '6'),
(8, 1, 1, '7'),
(9, 1, 1, '8'),
(10, 1, 1, '9');

-- --------------------------------------------------------

--
-- Table structure for table `semestreMateria`
--

CREATE TABLE IF NOT EXISTS `semestreMateria` (
  `materia` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `curso` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `idSemestre` int(11) NOT NULL,
  `idPlan` int(11) NOT NULL,
  `idCarrera` int(11) NOT NULL,
  PRIMARY KEY (`idSemestre`,`idPlan`,`materia`,`curso`,`idCarrera`),
  KEY `SMSem` (`idSemestre`,`idPlan`,`idCarrera`),
  KEY `SMMateria` (`materia`,`curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `semestreMateria`
--


-- --------------------------------------------------------

--
-- Table structure for table `tablaNotificacion`
--

CREATE TABLE IF NOT EXISTS `tablaNotificacion` (
  `idtablaNotificacion` int(11) NOT NULL AUTO_INCREMENT,
  `indexUsuario` int(11) NOT NULL DEFAULT '0',
  `idDepartamento` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtablaNotificacion`,`indexUsuario`,`idDepartamento`),
  KEY `notificacionUsuario` (`indexUsuario`,`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tablaNotificacion`
--


-- --------------------------------------------------------

--
-- Table structure for table `Telefono`
--

CREATE TABLE IF NOT EXISTS `Telefono` (
  `idTelefono` int(11) NOT NULL AUTO_INCREMENT,
  `indexUsuario` int(11) NOT NULL DEFAULT '0',
  `idDepartamento` int(11) NOT NULL DEFAULT '0',
  `telefono` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `extension` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idTelefono`,`indexUsuario`,`idDepartamento`),
  KEY `TelefonoUsuario` (`indexUsuario`,`idDepartamento`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Telefono`
--

INSERT INTO `Telefono` (`idTelefono`, `indexUsuario`, `idDepartamento`, `telefono`, `extension`) VALUES
(1, 1, 1, '83284488', NULL),
(2, 1, 1, '83582000', '4592');

-- --------------------------------------------------------

--
-- Table structure for table `Usuario`
--

CREATE TABLE IF NOT EXISTS `Usuario` (
  `indexUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `idDepartamento` int(11) NOT NULL DEFAULT '0',
  `idUsuario` varchar(9) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Es la "Matricula del Profesor"',
  `nombreUsuario` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `apellidoUsuario` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `genero` char(1) COLLATE utf8_spanish_ci DEFAULT 'M' COMMENT 'Masculino o Femenino',
  `email` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `alta` bit(1) NOT NULL DEFAULT b'0',
  `password` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `administrador` bit(1) NOT NULL DEFAULT b'0',
  `rol` char(5) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'P' COMMENT 'Profesor\nDirector... Cualquier rol que se desee\nAgregar',
  PRIMARY KEY (`indexUsuario`,`idDepartamento`),
  KEY `idDepartamentoUsuario` (`idDepartamento`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `Usuario`
--

INSERT INTO `Usuario` (`indexUsuario`, `idDepartamento`, `idUsuario`, `nombreUsuario`, `apellidoUsuario`, `genero`, `email`, `alta`, `password`, `administrador`, `rol`) VALUES
(1, 1, 'L00215087', 'Elda Guadalupe', 'Quiroga Gonzalez', 'F', 'x@itesm.mx', '1', 'elda', '1', 'C'),
(2, 1, 'L00276543', 'Ramon Felipe', 'Brena Pinero', 'M', 'y@itesm.mx', '0', '''''', '0', 'P'),
(3, 1, 'L00265355', 'Hugo', 'Terashima Marin', 'M', 'w@itesm.mx', '0', '''''', '0', 'P'),
(4, 1, 'L00234153', 'Juan Arturo', 'Nolazco Flores', 'M', 'z@itesm.mx', '1', '12345', '0', 'D'),
(5, 1, 'admin', 'Admin', 'istrador', 'M', 'admin@gmail.com', '1', 'admin', '1', 'O');

-- --------------------------------------------------------

--
-- Stand-in structure for view `VactividadesProfesores`
--
CREATE TABLE IF NOT EXISTS `VactividadesProfesores` (
`idDepartamento` int(11)
,`indexUsuario` int(11)
,`idUsuario` varchar(9)
,`nombreUsuario` varchar(45)
,`apellidoUsuario` varchar(45)
,`genero` char(1)
,`email` varchar(100)
,`actividad` varchar(15)
,`diaSemana` varchar(45)
,`horaInicio` varchar(6)
,`horaFin` varchar(6)
,`duracion` varchar(4)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `VhorariosProfesores`
--
CREATE TABLE IF NOT EXISTS `VhorariosProfesores` (
`idUsuario` varchar(9)
,`nombreUsuario` varchar(45)
,`apellidoUsuario` varchar(45)
,`CRN` int(11)
,`horasClase` varchar(20)
,`horasLaboratorio` varchar(20)
,`unidades` varchar(2)
,`porcentajeClase` varchar(20)
,`numeroProfesores` smallint(6)
,`claseExclusiva` smallint(6)
,`alumnosInscritos` int(11)
,`materia` varchar(5)
,`curso` varchar(5)
,`nombreMateria` varchar(100)
,`idPeriodo` int(11)
,`anio` varchar(4)
,`periodo` varchar(20)
,`salon` varchar(10)
,`diaSemana` varchar(10)
,`horaInicio` varchar(15)
,`horaFin` varchar(15)
);
-- --------------------------------------------------------

--
-- Table structure for table `vplanescarreras`
--

CREATE TABLE IF NOT EXISTS `vplanescarreras` (
  `nombreCarrera` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `siglasCarrera` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `anioPlan` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcionPlan` text COLLATE utf8_spanish_ci,
  `semestre` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `materia` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `curso` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombreMateria` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `vplanescarreras`
--


-- --------------------------------------------------------

--
-- Stand-in structure for view `VplanesCarreras`
--
CREATE TABLE IF NOT EXISTS `VplanesCarreras` (
`nombreCarrera` varchar(100)
,`siglasCarrera` varchar(5)
,`anioPlan` varchar(5)
,`descripcionPlan` text
,`semestre` varchar(2)
,`materia` varchar(5)
,`curso` varchar(5)
,`nombreMateria` varchar(100)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `VtelefonosUsuarios`
--
CREATE TABLE IF NOT EXISTS `VtelefonosUsuarios` (
`idDepartamento` int(11)
,`idUsuario` varchar(9)
,`siglas` varchar(10)
,`departamento` varchar(45)
,`indexUsuario` int(11)
,`email` varchar(100)
,`nombreUsuario` varchar(45)
,`apellidoUsuario` varchar(45)
,`telefono` varchar(20)
,`extension` varchar(10)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `VusuarioRegistroExcel`
--
CREATE TABLE IF NOT EXISTS `VusuarioRegistroExcel` (
`idDepartamento` int(11)
,`indexUsuario` int(11)
,`idUsuario` varchar(9)
,`nombreUsuario` varchar(45)
,`apellidoUsuario` varchar(45)
,`email` varchar(100)
,`rol` char(5)
,`fecha` datetime
,`nombreArchivo` varchar(100)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `VusuariosNotificacion`
--
CREATE TABLE IF NOT EXISTS `VusuariosNotificacion` (
`idtablaNotificacion` int(11)
,`idDepartamento` int(11)
,`departamento` varchar(45)
,`siglas` varchar(10)
,`indexUsuario` int(11)
,`idUsuario` varchar(9)
,`nombreUsuario` varchar(45)
,`apellidoUsuario` varchar(45)
,`genero` char(1)
,`email` varchar(100)
,`alta` bit(1)
,`rol` char(5)
,`administrador` bit(1)
);
-- --------------------------------------------------------

--
-- Structure for view `VactividadesProfesores`
--
DROP TABLE IF EXISTS `VactividadesProfesores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `VactividadesProfesores` AS select `u`.`idDepartamento` AS `idDepartamento`,`u`.`indexUsuario` AS `indexUsuario`,`u`.`idUsuario` AS `idUsuario`,`u`.`nombreUsuario` AS `nombreUsuario`,`u`.`apellidoUsuario` AS `apellidoUsuario`,`u`.`genero` AS `genero`,`u`.`email` AS `email`,`ae`.`actividad` AS `actividad`,`ae`.`diaSemana` AS `diaSemana`,`ae`.`horaInicio` AS `horaInicio`,`ae`.`horaFin` AS `horaFin`,`ae`.`duracion` AS `duracion` from (`Usuario` `u` join `actividadesExtra` `ae`) where ((`ae`.`indexUsuario` = `u`.`indexUsuario`) and (`ae`.`idDepartamento` = `u`.`idDepartamento`)) order by `u`.`idDepartamento`,`u`.`indexUsuario`,`ae`.`diaSemana`,`ae`.`horaInicio`,`ae`.`horaFin`;

-- --------------------------------------------------------

--
-- Structure for view `VhorariosProfesores`
--
DROP TABLE IF EXISTS `VhorariosProfesores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `VhorariosProfesores` AS select `u`.`idUsuario` AS `idUsuario`,`u`.`nombreUsuario` AS `nombreUsuario`,`u`.`apellidoUsuario` AS `apellidoUsuario`,`g`.`CRN` AS `CRN`,`g`.`horasClase` AS `horasClase`,`g`.`horasLaboratorio` AS `horasLaboratorio`,`g`.`unidades` AS `unidades`,`g`.`porcentajeClase` AS `porcentajeClase`,`g`.`numeroProfesores` AS `numeroProfesores`,`g`.`claseExclusiva` AS `claseExclusiva`,`g`.`alumnosInscritos` AS `alumnosInscritos`,`m`.`materia` AS `materia`,`m`.`curso` AS `curso`,`m`.`nombreMateria` AS `nombreMateria`,`p`.`idPeriodo` AS `idPeriodo`,`p`.`anio` AS `anio`,`p`.`periodo` AS `periodo`,`h`.`salon` AS `salon`,`h`.`diaSemana` AS `diaSemana`,`h`.`horaInicio` AS `horaInicio`,`h`.`horaFin` AS `horaFin` from ((((`Usuario` `u` join `Grupo` `g` on(((`u`.`indexUsuario` = `g`.`indexUsuario`) and (`u`.`idDepartamento` = `g`.`idDepartamento`)))) join `Materia` `m` on(((`g`.`materia` = `m`.`materia`) and (`g`.`curso` = `m`.`curso`)))) join `Periodo` `p` on((`g`.`idPeriodo` = `p`.`idPeriodo`))) join `Horarios` `h` on(((`h`.`CRN` = `g`.`CRN`) and (`h`.`indexUsuario` = `g`.`indexUsuario`)))) order by `u`.`idUsuario`,`g`.`CRN`,`p`.`idPeriodo`;

-- --------------------------------------------------------

--
-- Structure for view `VplanesCarreras`
--
DROP TABLE IF EXISTS `VplanesCarreras`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `VplanesCarreras` AS select `c`.`nombreCarrera` AS `nombreCarrera`,`c`.`siglasCarrera` AS `siglasCarrera`,`p`.`anioPlan` AS `anioPlan`,`p`.`descripcion` AS `descripcionPlan`,`s`.`semestre` AS `semestre`,`m`.`materia` AS `materia`,`m`.`curso` AS `curso`,`m`.`nombreMateria` AS `nombreMateria` from ((((`Carrera` `c` join `PlanDeEstudios` `p` on((`c`.`idCarrera` = `p`.`idCarrera`))) join `Semestre` `s` on((`s`.`idPlan` = `p`.`idPlanDeEstudios`))) join `semestreMateria` `sm` on((`sm`.`idSemestre` = `s`.`idSemestre`))) join `Materia` `m` on(((`sm`.`materia` = `m`.`materia`) and (`sm`.`curso` = `m`.`curso`)))) order by `c`.`siglasCarrera`,`p`.`anioPlan`,`s`.`semestre`,`m`.`materia`,`m`.`curso`;

-- --------------------------------------------------------

--
-- Structure for view `VtelefonosUsuarios`
--
DROP TABLE IF EXISTS `VtelefonosUsuarios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `VtelefonosUsuarios` AS select `u`.`idDepartamento` AS `idDepartamento`,`u`.`idUsuario` AS `idUsuario`,`d`.`siglas` AS `siglas`,`d`.`departamento` AS `departamento`,`u`.`indexUsuario` AS `indexUsuario`,`u`.`email` AS `email`,`u`.`nombreUsuario` AS `nombreUsuario`,`u`.`apellidoUsuario` AS `apellidoUsuario`,`t`.`telefono` AS `telefono`,`t`.`extension` AS `extension` from ((`Usuario` `u` join `Telefono` `t` on((`u`.`indexUsuario` = `t`.`indexUsuario`))) join `Departamento` `d` on((`d`.`idDepartamento` = `u`.`idDepartamento`))) order by `u`.`idUsuario`;

-- --------------------------------------------------------

--
-- Structure for view `VusuarioRegistroExcel`
--
DROP TABLE IF EXISTS `VusuarioRegistroExcel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `VusuarioRegistroExcel` AS select `u`.`idDepartamento` AS `idDepartamento`,`u`.`indexUsuario` AS `indexUsuario`,`u`.`idUsuario` AS `idUsuario`,`u`.`nombreUsuario` AS `nombreUsuario`,`u`.`apellidoUsuario` AS `apellidoUsuario`,`u`.`email` AS `email`,`u`.`rol` AS `rol`,`re`.`fecha` AS `fecha`,`re`.`nombreArchivo` AS `nombreArchivo` from (`Usuario` `u` join `registroExcel` `re` on(((`re`.`indexUsuario` = `u`.`indexUsuario`) and (`re`.`deptPlan` = `u`.`idDepartamento`))));

-- --------------------------------------------------------

--
-- Structure for view `VusuariosNotificacion`
--
DROP TABLE IF EXISTS `VusuariosNotificacion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `VusuariosNotificacion` AS select `t`.`idtablaNotificacion` AS `idtablaNotificacion`,`u`.`idDepartamento` AS `idDepartamento`,`d`.`departamento` AS `departamento`,`d`.`siglas` AS `siglas`,`u`.`indexUsuario` AS `indexUsuario`,`u`.`idUsuario` AS `idUsuario`,`u`.`nombreUsuario` AS `nombreUsuario`,`u`.`apellidoUsuario` AS `apellidoUsuario`,`u`.`genero` AS `genero`,`u`.`email` AS `email`,`u`.`alta` AS `alta`,`u`.`rol` AS `rol`,`u`.`administrador` AS `administrador` from ((`Departamento` `d` join `Usuario` `u` on((`u`.`idDepartamento` = `d`.`idDepartamento`))) join `tablaNotificacion` `t` on(((`u`.`idDepartamento` = `t`.`idDepartamento`) and (`u`.`indexUsuario` = `t`.`indexUsuario`))));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actividadesExtra`
--
ALTER TABLE `actividadesExtra`
  ADD CONSTRAINT `AEPeriodo` FOREIGN KEY (`idPeriodo`) REFERENCES `Periodo` (`idPeriodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `AEUsuario` FOREIGN KEY (`indexUsuario`, `idDepartamento`) REFERENCES `Usuario` (`indexUsuario`, `idDepartamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Grupo`
--
ALTER TABLE `Grupo`
  ADD CONSTRAINT `GrupoMateria` FOREIGN KEY (`materia`, `curso`) REFERENCES `Materia` (`materia`, `curso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `GrupoPeriodo` FOREIGN KEY (`idPeriodo`) REFERENCES `Periodo` (`idPeriodo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `GrupoUsuario` FOREIGN KEY (`indexUsuario`, `idDepartamento`) REFERENCES `Usuario` (`indexUsuario`, `idDepartamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Horarios`
--
ALTER TABLE `Horarios`
  ADD CONSTRAINT `HGrupos` FOREIGN KEY (`CRN`, `materia`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `curso`) REFERENCES `Grupo` (`CRN`, `materia`, `idDepartamento`, `indexUsuario`, `idPeriodo`, `curso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `PlanDeEstudios`
--
ALTER TABLE `PlanDeEstudios`
  ADD CONSTRAINT `planDeEstudiosCarrera` FOREIGN KEY (`idCarrera`) REFERENCES `Carrera` (`idCarrera`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Semestre`
--
ALTER TABLE `Semestre`
  ADD CONSTRAINT `SemestrePlanDeEstudios` FOREIGN KEY (`idPlan`, `idCarrera`) REFERENCES `PlanDeEstudios` (`idPlanDeEstudios`, `idCarrera`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `semestreMateria`
--
ALTER TABLE `semestreMateria`
  ADD CONSTRAINT `SMMateria` FOREIGN KEY (`materia`, `curso`) REFERENCES `Materia` (`materia`, `curso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SMSem` FOREIGN KEY (`idSemestre`, `idPlan`, `idCarrera`) REFERENCES `Semestre` (`idSemestre`, `idPlan`, `idCarrera`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tablaNotificacion`
--
ALTER TABLE `tablaNotificacion`
  ADD CONSTRAINT `notificacionUsuario` FOREIGN KEY (`indexUsuario`, `idDepartamento`) REFERENCES `Usuario` (`indexUsuario`, `idDepartamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Telefono`
--
ALTER TABLE `Telefono`
  ADD CONSTRAINT `TelefonoUsuario` FOREIGN KEY (`indexUsuario`, `idDepartamento`) REFERENCES `Usuario` (`indexUsuario`, `idDepartamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `idDepartamentoUsuario` FOREIGN KEY (`idDepartamento`) REFERENCES `Departamento` (`idDepartamento`) ON DELETE CASCADE ON UPDATE CASCADE;
