-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-07-2017 a las 16:21:26
-- Versión del servidor: 10.1.24-MariaDB
-- Versión de PHP: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `notice`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `title` varchar(300) NOT NULL,
  `description` text NOT NULL,
  `author` varchar(200) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `soft_delete` tinyint(1) DEFAULT '0',
  `seen` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notice`
--

INSERT INTO `notice` (`id`, `title`, `description`, `author`, `created_date`, `updated_date`, `soft_delete`, `seen`) VALUES
(3, 'sacsdcdsdsdds', 'cdccdccdbbb', 'loved11', '2017-07-10 00:00:00', '2017-07-11 13:16:06', 0, 0),
(4, 'que', 'como asi', 'love', '0000-00-00 00:00:00', '2017-07-11 13:16:10', 0, 0),
(5, 'cdcdc', 'dcdcdc', 'love', '2017-07-10 00:00:00', '2017-07-11 13:16:14', 0, 0),
(6, 'cdcdcdc', 'ededede', 'love', '2017-07-10 00:00:00', '2017-07-11 13:16:18', 0, 0),
(7, 'dceces', 'dccdcdc', 'love', '2017-07-10 00:00:00', '2017-07-11 13:16:23', 0, 0),
(8, 'cdscsdc', 'dscsdcd', 'love', '2017-07-10 00:00:00', '2017-07-11 13:15:47', 1, 0),
(9, 'hey', 'hey tu', 'love', '2017-07-10 00:00:00', '2017-07-11 13:16:30', 0, 0),
(10, 'hey tu como', 'que eee', 'love', '2017-07-10 00:00:00', '2017-07-11 13:16:35', 0, 0),
(11, 'claire', 'ndejdhed', 'love', '2017-07-10 00:00:00', '2017-07-11 13:32:51', 0, 0),
(12, 'hey', 'hey tu', 'love', '2017-07-11 14:37:15', '2017-07-11 13:37:15', 0, 0),
(13, 'heytu', 'nfefef', 'love', '2017-07-11 13:39:43', '2017-07-11 13:39:43', 0, 0),
(14, 'cwesfw', 'fefef', 'love', '2017-07-11 06:41:08', '2017-07-11 13:41:08', 0, 0),
(15, 'hey tu', 'como estas', 'love', '2017-07-11 06:42:12', '2017-07-11 13:42:12', 0, 0),
(16, 'fwefwfw', 'wefewfwfwe', 'love', '2017-07-11 15:42:45', '2017-07-11 13:42:45', 0, 0),
(17, 'EWF', 'FEWFWEF', 'love', '2017-07-11 13:44:33', '2017-07-11 13:44:33', 0, 0),
(18, 'R443R', '43R43R43', 'love', '2017-07-11 14:55:33', '2017-07-11 13:55:33', 0, 0),
(19, 'DEDED', 'EDEDED', 'love', '2017-07-11 08:56:31', '2017-07-11 13:56:31', 0, 0),
(20, 'FFWFWEGRGRGRG', 'EFWFEWFEEGRGR', 'love', '2017-07-11 09:58:07', '2017-07-11 13:59:27', 0, 0),
(21, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and ndustry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\ntypesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'love', '2017-07-11 10:00:51', '2017-07-11 14:01:18', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `active` varchar(255) NOT NULL,
  `resetToken` varchar(255) DEFAULT NULL,
  `resetComplete` varchar(3) DEFAULT 'No'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`userID`, `username`, `password`, `email`, `active`, `resetToken`, `resetComplete`) VALUES
(1, 'claire', '$2y$10$6e78p9xnY0sQf8JR43XzveQTRAxvTMTOY1Ky6drjjZBNdpTRbwhQ.', 'claire@gmail.com', '60ad22d70e857099665ae1ac280b85b8', '7e4795c947b30416b40ca888909790b4', 'No'),
(2, 'clairelove', '$2y$10$2I7T9z3a1aPFRd9W7sv7N.jyJeWwz2z2IXSXX6fPraArQIHlZ/qMu', 'holaclairefenelon@gmail.com', 'e83c27ee0d07f9eda3b657063bda5d77', '8bb5bd501a38f8a408381d7fa19d8ecf', 'No');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
