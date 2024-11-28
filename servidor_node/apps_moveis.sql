-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Jan-2024 às 18:33
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `apps_moveis`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `idMedico` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `sobrenome` varchar(255) NOT NULL,
  `utente` varchar(255) NOT NULL,
  `genero` varchar(255) NOT NULL,
  `idade` varchar(255) NOT NULL,
  `peso` varchar(255) NOT NULL,
  `altura` varchar(255) NOT NULL,
  `contacto` char(255) NOT NULL,
  `diagnostico` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `pacientes`
--

INSERT INTO `pacientes` (`id`, `idMedico`, `nome`, `sobrenome`, `utente`, `genero`, `idade`, `peso`, `altura`, `contacto`, `diagnostico`) VALUES
(2, 0, 'Gabriel', 'Reis', '8414 5123', 'Masculino', '13', '45.5', '1.64', '412 123 521', 'Não Urgente'),
(3, 13, 'Bruno', 'Silva', '123 532 123', 'Masculino', '19', '80', '1.78', '123 412 643', 'Urgência'),
(4, 13, 'Patrick', 'Antunes', '124 512 235', 'Masculino', '78', '69.9', '1.78', '123 412 124', 'Não Urgente'),
(5, 1, 'Sebastian', 'Cristo', '1232414', 'Masculino', '24', '78', '1,90', '123 213 535', 'Pouco Urgente'),
(6, 1, 'Anderson', 'Daronco', '1234153256', 'Masculino', '54', '92', '1,91', '120944395', 'Pouco Urgente'),
(19, 1, 'Everton', 'Soares', '1817729179', 'Masculine ', '27', '98', '1,60', '098 097 646', 'Pouco Urgente'),
(20, 1, 'Eliza', 'Batista', '210831209', 'Feminino', '36', '63', '1,69', '192 984 021', 'Não Urgente'),
(21, 1, 'Andressa', 'Leao', '123128712', 'Feminino', '47', '71', '1,82', '231 980 478', 'Pouco Urgente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nome` varchar(256) NOT NULL,
  `sobrenome` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `senha` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `nome`, `sobrenome`, `email`, `senha`) VALUES
(1, 'pedro', 'rangel', 'pedro.com', '123');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
