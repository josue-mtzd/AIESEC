
-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- Servidor: 68.178.217.44
-- Tiempo de generación: 27-10-2014 a las 22:27:10
-- Versión del servidor: 5.5.37
-- Versión de PHP: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `conaldb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

CREATE TABLE `agenda` (
  `idSesion` tinyint(4) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `sede` varchar(300) CHARACTER SET utf8 NOT NULL,
  `descripcion` varchar(300) CHARACTER SET utf8 NOT NULL,
  `ponente` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idSesion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancelar`
--

CREATE TABLE `cancelar` (
  `idUsuario` tinyint(4) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `idLC` tinyint(4) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idUsuario_2` (`idUsuario`),
  KEY `idLC` (`idLC`),
  KEY `idLC_2` (`idLC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_a`
--

CREATE TABLE `c_a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=212 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inf_us`
--

CREATE TABLE `inf_us` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `genero` varchar(7) NOT NULL,
  `ronda` tinyint(1) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `idLC` tinyint(4) NOT NULL,
  `idUniversidad` varchar(100) NOT NULL,
  `semestre` tinyint(4) NOT NULL,
  `carrera` varchar(100) NOT NULL,
  `entro_aiesec` varchar(50) NOT NULL,
  `area` varchar(25) NOT NULL,
  `currentrole` varchar(50) NOT NULL,
  `nickname` varchar(26) NOT NULL,
  `vegetariano` int(1) NOT NULL,
  `restricciones` varchar(300) NOT NULL,
  `ContactoEmergencia` varchar(80) NOT NULL,
  `tshirt` int(1) DEFAULT NULL,
  `party` int(1) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idLC` (`idLC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inv`
--

CREATE TABLE `inv` (
  `idSesion` tinyint(4) NOT NULL,
  `idTipo` tinyint(4) NOT NULL,
  KEY `idSesion` (`idSesion`),
  KEY `idTipo` (`idTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lc`
--

CREATE TABLE `lc` (
  `idLC` tinyint(4) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`idLC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multa`
--

CREATE TABLE `multa` (
  `idMulta` tinyint(4) NOT NULL,
  `fecha` date NOT NULL,
  `monto` int(11) NOT NULL,
  `idLC` tinyint(4) NOT NULL,
  PRIMARY KEY (`idMulta`),
  KEY `idLC` (`idLC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idPago` int(4) NOT NULL AUTO_INCREMENT,
  `idLC` tinyint(11) NOT NULL,
  `Npago` tinyint(4) NOT NULL,
  `completo` int(1) NOT NULL,
  `idMulta` tinyint(4) NOT NULL,
  `fecha` datetime NOT NULL,
  `img` int(11) NOT NULL,
  PRIMARY KEY (`idPago`),
  KEY `idLC` (`idLC`),
  KEY `idMulta` (`idMulta`),
  KEY `idLC_2` (`idLC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `idPreguntas` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `uno` varchar(250) NOT NULL,
  `dos` varchar(250) NOT NULL,
  `tres` varchar(250) NOT NULL,
  `cuatro` varchar(250) NOT NULL,
  `cinco` varchar(250) NOT NULL,
  PRIMARY KEY (`idPreguntas`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idUsuario_2` (`idUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `idTpago` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `descripcion` varchar(120) NOT NULL,
  `porcentaje` float NOT NULL,
  PRIMARY KEY (`idTpago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usr`
--

CREATE TABLE `tipo_usr` (
  `idTipo` tinyint(4) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(70) NOT NULL,
  `Pass` varchar(300) NOT NULL,
  `imgroute` varchar(50) DEFAULT NULL,
  `IdTipo` tinyint(11) NOT NULL DEFAULT '1',
  `idTpago` tinyint(4) NOT NULL DEFAULT '1',
  `permisos` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=152 ;

--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `cancelar`
--
ALTER TABLE `cancelar`
  ADD CONSTRAINT `cancelar_ibfk_1` FOREIGN KEY (`idLC`) REFERENCES `lc` (`idLC`);

--
-- Filtros para la tabla `inf_us`
--
ALTER TABLE `inf_us`
  ADD CONSTRAINT `inf_us_ibfk_3` FOREIGN KEY (`idLC`) REFERENCES `lc` (`idLC`);

--
-- Filtros para la tabla `inv`
--
ALTER TABLE `inv`
  ADD CONSTRAINT `inv_ibfk_1` FOREIGN KEY (`idSesion`) REFERENCES `agenda` (`idSesion`),
  ADD CONSTRAINT `inv_ibfk_2` FOREIGN KEY (`idTipo`) REFERENCES `tipo_usr` (`idTipo`);

--
-- Filtros para la tabla `multa`
--
ALTER TABLE `multa`
  ADD CONSTRAINT `multa_ibfk_1` FOREIGN KEY (`idLC`) REFERENCES `lc` (`idLC`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`idMulta`) REFERENCES `multa` (`idMulta`),
  ADD CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`idLC`) REFERENCES `lc` (`idLC`);

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);
