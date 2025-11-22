-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Creato il: Nov 22, 2025 alle 11:29
-- Versione del server: 11.3.2-MariaDB-1:11.3.2+maria~ubu2204
-- Versione PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `AziendaDolciaria`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Dipendenti`
--

CREATE TABLE `Dipendenti` (
  `Matricola` varchar(20) NOT NULL,
  `CF` char(16) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Cognome` varchar(50) NOT NULL,
  `Indirizzo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Dipendenti`
--

INSERT INTO `Dipendenti` (`Matricola`, `CF`, `Nome`, `Cognome`, `Indirizzo`) VALUES
('DIP001', 'RSSMRA85M01H501Z', 'Mario', 'Rossi', 'Via Roma 10, Milano'),
('DIP002', 'BNCLRA90L45F205X', 'Laura', 'Bianchi', 'Corso Italia 25, Torino'),
('DIP003', 'VRDGPP88H15L219Y', 'Giuseppe', 'Verdi', 'Piazza Garibaldi 5, Napoli'),
('DIP004', 'FRNMRA92D50A662W', 'Maria', 'Ferrari', 'Via Dante 33, Bologna'),
('DIP005', 'RSSLCU80C12D612V', 'Luca', 'Russo', 'Viale Europa 18, Firenze'),
('DIP006', 'CNTANN95T55H703U', 'Anna', 'Conti', 'Via Mazzini 42, Roma'),
('DIP007', 'MRNPLO87A20L736T', 'Paolo', 'Marini', 'Corso Vittorio 8, Palermo'),
('DIP008', 'GLLFNC91M28F839S', 'Francesca', 'Galli', 'Via Cavour 15, Genova'),
('DIP009', 'BRNGCM83S05E625R', 'Giacomo', 'Bruno', 'Piazza Duomo 3, Venezia'),
('DIP010', 'RCCSLV89P18G273Q', 'Silvia', 'Ricci', 'Via Verdi 27, Bari');

-- --------------------------------------------------------

--
-- Struttura della tabella `Magazzini`
--

CREATE TABLE `Magazzini` (
  `Codice` varchar(20) NOT NULL,
  `Capienza` int(11) NOT NULL,
  `Indirizzo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Magazzini`
--

INSERT INTO `Magazzini` (`Codice`, `Capienza`, `Indirizzo`) VALUES
('MAG001', 5000, 'Zona Industriale Nord, Milano'),
('MAG002', 3500, 'Area Logistica Sud, Torino'),
('MAG003', 4200, 'Polo Commerciale Est, Roma'),
('MAG004', 6000, 'Comprensorio Industriale, Bologna'),
('MAG005', 2800, 'Zona Artigianale, Firenze'),
('MAG006', 4500, 'Area Produttiva, Napoli'),
('MAG007', 3000, 'Distretto Logistico, Palermo'),
('MAG008', 5500, 'Zona Industriale Porto, Genova'),
('MAG009', 2500, 'Area Commerciale, Venezia'),
('MAG010', 3800, 'Zona Produttiva, Bari');

-- --------------------------------------------------------

--
-- Struttura della tabella `MateriePrime`
--

CREATE TABLE `MateriePrime` (
  `Tipologia` varchar(50) NOT NULL,
  `CostoUnitario` decimal(10,2) NOT NULL,
  `PesoUnitario` decimal(10,3) NOT NULL,
  `Codice` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `MateriePrime`
--

INSERT INTO `MateriePrime` (`Tipologia`, `CostoUnitario`, `PesoUnitario`, `Codice`) VALUES
('Burro', 8.50, 0.250, 'MAG002'),
('Cacao', 6.50, 0.250, 'MAG005'),
('Cioccolato', 12.00, 0.100, 'MAG003'),
('Farina00', 0.85, 1.000, 'MAG001'),
('Latte', 1.30, 1.000, 'MAG003'),
('Lievito', 2.50, 0.025, 'MAG004'),
('Mandorle', 15.00, 0.500, 'MAG006'),
('Miele', 9.00, 0.500, 'MAG007'),
('Sale', 0.50, 1.000, 'MAG004'),
('Uova', 3.50, 0.060, 'MAG002'),
('Vanillina', 4.00, 0.010, 'MAG005'),
('Zucchero', 1.20, 1.000, 'MAG001');

-- --------------------------------------------------------

--
-- Struttura della tabella `Prodotti`
--

CREATE TABLE `Prodotti` (
  `Id` int(11) NOT NULL,
  `Codice` varchar(20) NOT NULL,
  `Matricola` varchar(20) NOT NULL,
  `Descrizione` text DEFAULT NULL,
  `Nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Prodotti`
--

INSERT INTO `Prodotti` (`Id`, `Codice`, `Matricola`, `Descrizione`, `Nome`) VALUES
(1, 'MAG001', 'DIP001', 'Torta al cioccolato con glassa fondente', 'Torta Sacher'),
(2, 'MAG001', 'DIP002', 'Biscotti friabili al burro con gocce di cioccolato', 'Cookies Classici'),
(3, 'MAG002', 'DIP003', 'Pan di spagna farcito con crema pasticcera', 'Millefoglie'),
(4, 'MAG002', 'DIP001', 'Croissant sfogliati al burro', 'Cornetti Francesi'),
(5, 'MAG003', 'DIP004', 'Ciambellone soffice allo yogurt', 'Ciambella Casalinga'),
(6, 'MAG003', 'DIP005', 'Torta alle mandorle e miele', 'Torta Caprese'),
(7, 'MAG004', 'DIP002', 'Muffin al cioccolato con cuore morbido', 'Muffin Fondente'),
(8, 'MAG005', 'DIP006', 'Biscotti secchi alla vaniglia', 'Frollini Vaniglia'),
(9, 'MAG006', 'DIP007', 'Plumcake integrale con frutta secca', 'Plumcake Rustico'),
(10, 'MAG007', 'DIP008', 'Brownies al cioccolato fondente', 'Brownies Americani'),
(11, 'MAG008', 'DIP009', 'Tortine monoporzione al limone', 'Cupcake Limone'),
(12, 'MAG009', 'DIP010', 'Biscotti alle mandorle', 'Amaretti Morbidi');

-- --------------------------------------------------------

--
-- Struttura della tabella `Ricette`
--

CREATE TABLE `Ricette` (
  `Tipologia` varchar(50) NOT NULL,
  `Id` int(11) NOT NULL,
  `Qta` decimal(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Ricette`
--

INSERT INTO `Ricette` (`Tipologia`, `Id`, `Qta`) VALUES
('Burro', 1, 0.120),
('Burro', 2, 0.150),
('Burro', 3, 0.200),
('Burro', 4, 0.180),
('Burro', 7, 0.100),
('Burro', 8, 0.150),
('Burro', 10, 0.180),
('Burro', 11, 0.100),
('Cacao', 7, 0.050),
('Cioccolato', 1, 0.150),
('Cioccolato', 2, 0.100),
('Cioccolato', 6, 0.150),
('Cioccolato', 10, 0.200),
('Farina00', 1, 0.200),
('Farina00', 2, 0.250),
('Farina00', 3, 0.300),
('Farina00', 4, 0.350),
('Farina00', 5, 0.300),
('Farina00', 7, 0.200),
('Farina00', 8, 0.300),
('Farina00', 9, 0.250),
('Farina00', 10, 0.150),
('Farina00', 11, 0.200),
('Latte', 3, 0.250),
('Latte', 4, 0.100),
('Latte', 5, 0.150),
('Latte', 11, 0.080),
('Lievito', 4, 0.015),
('Mandorle', 6, 0.200),
('Mandorle', 9, 0.080),
('Mandorle', 12, 0.250),
('Miele', 6, 0.050),
('Miele', 9, 0.040),
('Uova', 1, 0.180),
('Uova', 3, 0.120),
('Uova', 5, 0.180),
('Uova', 6, 0.240),
('Uova', 7, 0.120),
('Uova', 9, 0.180),
('Uova', 10, 0.180),
('Uova', 11, 0.120),
('Uova', 12, 0.060),
('Vanillina', 8, 0.005),
('Vanillina', 12, 0.003),
('Zucchero', 1, 0.180),
('Zucchero', 2, 0.120),
('Zucchero', 3, 0.150),
('Zucchero', 4, 0.050),
('Zucchero', 5, 0.200),
('Zucchero', 6, 0.180),
('Zucchero', 7, 0.150),
('Zucchero', 8, 0.100),
('Zucchero', 9, 0.120),
('Zucchero', 10, 0.200),
('Zucchero', 11, 0.150),
('Zucchero', 12, 0.200);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Dipendenti`
--
ALTER TABLE `Dipendenti`
  ADD PRIMARY KEY (`Matricola`),
  ADD UNIQUE KEY `CF` (`CF`);

--
-- Indici per le tabelle `Magazzini`
--
ALTER TABLE `Magazzini`
  ADD PRIMARY KEY (`Codice`);

--
-- Indici per le tabelle `MateriePrime`
--
ALTER TABLE `MateriePrime`
  ADD PRIMARY KEY (`Tipologia`),
  ADD KEY `Codice` (`Codice`);

--
-- Indici per le tabelle `Prodotti`
--
ALTER TABLE `Prodotti`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Codice` (`Codice`),
  ADD KEY `Matricola` (`Matricola`);

--
-- Indici per le tabelle `Ricette`
--
ALTER TABLE `Ricette`
  ADD PRIMARY KEY (`Tipologia`,`Id`),
  ADD KEY `Id` (`Id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Prodotti`
--
ALTER TABLE `Prodotti`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `MateriePrime`
--
ALTER TABLE `MateriePrime`
  ADD CONSTRAINT `MateriePrime_ibfk_1` FOREIGN KEY (`Codice`) REFERENCES `Magazzini` (`Codice`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `Prodotti`
--
ALTER TABLE `Prodotti`
  ADD CONSTRAINT `Prodotti_ibfk_1` FOREIGN KEY (`Codice`) REFERENCES `Magazzini` (`Codice`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Prodotti_ibfk_2` FOREIGN KEY (`Matricola`) REFERENCES `Dipendenti` (`Matricola`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `Ricette`
--
ALTER TABLE `Ricette`
  ADD CONSTRAINT `Ricette_ibfk_1` FOREIGN KEY (`Tipologia`) REFERENCES `MateriePrime` (`Tipologia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Ricette_ibfk_2` FOREIGN KEY (`Id`) REFERENCES `Prodotti` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
