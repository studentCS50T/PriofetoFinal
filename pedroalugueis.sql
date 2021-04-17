-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 03-Dez-2019 às 09:05
-- Versão do servidor: 5.5.36
-- PHP Version: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pedroalugueis`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `contrato`
--

CREATE TABLE IF NOT EXISTS `contrato` (
  `idcontrato` int(11) NOT NULL AUTO_INCREMENT,
  `total` double NOT NULL,
  `qtdmensalidade` int(11) NOT NULL,
  `datainicio` date NOT NULL,
  `datafim` date NOT NULL,
  `status` int(11) NOT NULL,
  `idimovel` int(11) NOT NULL,
  `idlocatario` int(11) NOT NULL,
  `idlocador` int(11) NOT NULL,
  PRIMARY KEY (`idcontrato`),
  KEY `fk_contrato_imovel1_idx` (`idimovel`),
  KEY `fk_contrato_locatario1_idx` (`idlocatario`),
  KEY `fk_contrato_locador1_idx` (`idlocador`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel`
--

CREATE TABLE IF NOT EXISTS `imovel` (
  `idimovel` int(11) NOT NULL AUTO_INCREMENT,
  `endereco` varchar(150) NOT NULL,
  `qtdcomodo` int(11) NOT NULL,
  `garagem` int(11) NOT NULL,
  `area` varchar(15) NOT NULL,
  `status` int(11) NOT NULL,
  `idtipo` int(11) NOT NULL,
  PRIMARY KEY (`idimovel`),
  KEY `fk_imovel_tipo1_idx` (`idtipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `imovel`
--

INSERT INTO `imovel` (`idimovel`, `endereco`, `qtdcomodo`, `garagem`, `area`, `status`, `idtipo`) VALUES
(1, 'Comércio, número 200, Vicente Pires', 5, 1, '400m²', 1, 4),
(2, 'kitnet 01, Rua 04, Vicente PIres', 3, 1, '50m2', 1, 1),
(3, 'kitnet 02, Rua 04, Vicente PIres', 3, 1, '50m² ', 1, 1),
(4, 'kitnet 03, Rua 04, Vicente PIres', 3, 1, '50m2', 1, 1),
(5, 'kitnet 03, Quadra 403, Recanto das Emas', 4, 2, '70m² ', 1, 1),
(6, 'kitnet 04, Quadra 403, Recanto das Emas', 4, 2, '60m²', 1, 1),
(7, 'Casa 01, QI 03, número 125, Guará I', 5, 1, '150m²', 1, 3),
(8, 'Casa 02, QE 06, número 95, Guará I', 5, 1, '150m²', 1, 3),
(9, 'Apartamento 01, QI 04, número 10, Guará I', 5, 2, '100m²', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `locador`
--

CREATE TABLE IF NOT EXISTS `locador` (
  `idlocador` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `rg` varchar(15) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `endereco` varchar(150) NOT NULL,
  `status` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idlocador`),
  KEY `fk_locador_usuario1_idx` (`idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `locador`
--

INSERT INTO `locador` (`idlocador`, `nome`, `rg`, `cpf`, `telefone`, `endereco`, `status`, `idusuario`) VALUES
(1, 'Ederson Pedro', '234567', '234.645.234-02', '98927-7734', 'Conjunto E, casa 90. Guará I', 1, 2),
(2, 'Ketlin Fernanda', '5421487', '002.786.982-47', '99998-1066', 'Rua 2, casa 20. Guará II', 1, 5),
(3, 'Marli Endlich', '213456', '945.643.678-00', '3382-6821', 'Quadra QE 44, conjunto D. Guara', 1, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `locatario`
--

CREATE TABLE IF NOT EXISTS `locatario` (
  `idlocatario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `rg` varchar(15) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `datanasc` date NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idlocatario`),
  KEY `fk_locatario_usuario1_idx` (`idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `locatario`
--

INSERT INTO `locatario` (`idlocatario`, `nome`, `rg`, `cpf`, `datanasc`, `telefone`, `status`, `idusuario`) VALUES
(1, 'Robson Freitas', '1231223', '559.800.343-65', '1980-10-03', '8927-7355', 1, 3),
(2, 'Paula Souza', '9823094', '734.546.123-02', '1993-12-02', '9927-3634', 1, 6),
(3, 'Fernanda Rodrigues', '984131', '006.698.871-02', '1985-04-15', '98267-8721', 1, 8),
(4, 'Carolina Alves', '9874351', '897.651.658-00', '1965-08-20', '98874-1058', 1, 9),
(5, 'André Fernandes', '8741256', '254.698.103-85', '1998-12-12', '99988-1045', 1, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensalidade`
--

CREATE TABLE IF NOT EXISTS `mensalidade` (
  `idmensalidade` int(11) NOT NULL AUTO_INCREMENT,
  `idcontrato` int(11) NOT NULL,
  `vencimento` date NOT NULL,
  `valor` double NOT NULL,
  `valorpago` double NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`idmensalidade`,`idcontrato`),
  KEY `fk_mensalidade_contrato1_idx` (`idcontrato`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `idmenu` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(45) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icone` varchar(45) NOT NULL,
  `exibir` int(11) NOT NULL,
  PRIMARY KEY (`idmenu`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`idmenu`, `menu`, `link`, `icone`, `exibir`) VALUES
(1, 'Home', 'index.jsp', '', 1),
(2, 'Perfis', 'listar_perfil.jsp', '', 1),
(3, 'Cadastrar Perfil', 'form_perfil.jsp', '', 2),
(4, 'Alterar Perfil ', 'gerenciar_perfil.do?acao=alterar', '', 2),
(5, 'Desativar Perfil', 'gerenciar_perfil.do?acao=desativar', '', 2),
(6, 'Gerenciar Acessos', 'gerenciar_menu_perfil.do?acao=gerenciar', '', 2),
(7, 'Formulario Menu Perfil', 'form_menu_perfil.jsp', '', 2),
(8, 'Menus', 'listar_menu.jsp', '', 1),
(9, 'Cadastrar Menu', 'form_menu.jsp', '', 2),
(10, 'Alterar Menu', 'gerenciar_menu.do?acao=alterar', '', 2),
(11, 'Deletar Menu', 'gerenciar_menu.do?acao=deletar', '', 2),
(12, 'Desvincula Menus', 'gerenciar_menu_perfil.do?acao=desvincular', '', 2),
(13, 'Locador', 'listar_locador.jsp', '', 1),
(14, 'Cadastrar Locador', 'form_locador.jsp', '', 2),
(15, 'Alterar Locador', 'gerenciar_locador.do?acao=alterar', '', 2),
(16, 'Desativar Locador', 'gerenciar_locador.do?acao=desativar', '', 2),
(17, 'Locatário', 'listar_locatario.jsp', '', 1),
(18, 'Cadastrar Locatario', 'form_locatario.jsp', '', 2),
(19, 'Alterar Locatario', 'gerenciar_locatario.do?acao=alterar', '', 2),
(20, 'Desativar Locatario', 'gerenciar_locatario.do?acao=desativar', '', 2),
(21, 'Imóvel', 'listar_imovel.jsp', '', 1),
(22, 'Cadastrar Imovel', 'form_imovel.jsp', '', 2),
(23, 'Alterar Imóvel', 'gerenciar_imovel.do?acao=alterar', '', 2),
(24, 'Desativar Imovel', 'gerenciar_imovel.do?acao=desativar', '', 2),
(25, 'Tipo', 'listar_tipo.jsp', '', 1),
(26, 'Cadastrar Tipo', 'form_tipo.jsp', '', 2),
(27, 'Alterar Tipo', 'gerenciar_tipo.do?acao=alterar', '', 2),
(28, 'Excluir Tipo', 'gerenciar_tipo.do?acao=excluir', '', 2),
(29, 'Contrato', 'listar_contrato.jsp', '', 1),
(30, 'Cadastrar Contrato', 'form_contrato.jsp', '', 2),
(31, 'Alterar Contrato', 'gerenciar_contrato.do?acao=alterar', '', 2),
(32, 'Cancelar Contrato', 'gerenciar_contrato.do?acao=cancelar', '', 2),
(33, 'Mensalidade', 'listar_mensalidade.jsp', '', 2),
(34, 'Cadastrar Mensalidade', 'form_mensalidade.jsp', '', 2),
(35, 'Alterar Mensalidade', 'gerenciar_mensalidade.do?acao=alterar', '', 2),
(36, 'Excluir Mensalidade', 'gerenciar_mensalidade.do?acao=cancelar', '', 2),
(37, 'Usuário', 'listar_usuario.jsp', '', 1),
(38, 'Cadastrar Usuário', 'form_usuario.jsp', '', 2),
(39, 'Alterar Usuário', 'gerenciar_usuario.do?acao=alterar', '', 2),
(40, 'Desativar Usuário', 'gerenciar_usuario.do?acao=desativar', '', 2),
(41, 'Visualizar Contrato', 'visualizar_contrato.jsp', '', 2),
(42, 'Imprimir', 'gerenciar_contrato.do?acao=gerarpdf', '', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_perfil`
--

CREATE TABLE IF NOT EXISTS `menu_perfil` (
  `idmenu` int(11) NOT NULL,
  `idperfil` int(11) NOT NULL,
  PRIMARY KEY (`idmenu`,`idperfil`),
  KEY `fk_menu_has_perfil_perfil1_idx` (`idperfil`),
  KEY `fk_menu_has_perfil_menu_idx` (`idmenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `menu_perfil`
--

INSERT INTO `menu_perfil` (`idmenu`, `idperfil`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(1, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(1, 3),
(29, 3),
(33, 3),
(41, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
  `idperfil` int(11) NOT NULL AUTO_INCREMENT,
  `perfil` varchar(45) NOT NULL,
  PRIMARY KEY (`idperfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`idperfil`, `perfil`) VALUES
(1, 'Administrador'),
(2, 'Locador'),
(3, 'Locatario');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo`
--

CREATE TABLE IF NOT EXISTS `tipo` (
  `idtipo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `tipo`
--

INSERT INTO `tipo` (`idtipo`, `nome`) VALUES
(1, 'Kitnet'),
(2, 'Apartamento'),
(3, 'Casa'),
(4, 'Comercial');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `login` varchar(15) NOT NULL,
  `senha` varchar(10) NOT NULL,
  `status` int(11) NOT NULL,
  `idperfil` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_usuario_perfil1_idx` (`idperfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nome`, `login`, `senha`, `status`, `idperfil`) VALUES
(1, 'Administrador', 'admin', '123', 1, 1),
(2, 'Ederson', 'ederson', '123', 1, 2),
(3, 'Robson Freitas', 'locatario1', '123', 1, 3),
(4, 'Marli', 'marli', '123', 1, 2),
(5, 'Ketlin', 'ketlin', '123', 1, 2),
(6, 'Paula Souza', 'locatario2', '123', 1, 3),
(7, 'Emerson', 'emerson', '123', 1, 2),
(8, 'Fernanda Rodrigues', 'locatario3', '123', 1, 3),
(9, 'Carolina Alves', 'locatario4', '123', 1, 3),
(10, 'André Fernandes', 'locatario5', '123', 1, 3);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `fk_contrato_imovel1` FOREIGN KEY (`idimovel`) REFERENCES `imovel` (`idimovel`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contrato_locador1` FOREIGN KEY (`idlocador`) REFERENCES `locador` (`idlocador`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contrato_locatario1` FOREIGN KEY (`idlocatario`) REFERENCES `locatario` (`idlocatario`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `imovel`
--
ALTER TABLE `imovel`
  ADD CONSTRAINT `fk_imovel_tipo1` FOREIGN KEY (`idtipo`) REFERENCES `tipo` (`idtipo`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `locador`
--
ALTER TABLE `locador`
  ADD CONSTRAINT `fk_locador_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `locatario`
--
ALTER TABLE `locatario`
  ADD CONSTRAINT `fk_locatario_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `mensalidade`
--
ALTER TABLE `mensalidade`
  ADD CONSTRAINT `fk_mensalidade_contrato1` FOREIGN KEY (`idcontrato`) REFERENCES `contrato` (`idcontrato`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `menu_perfil`
--
ALTER TABLE `menu_perfil`
  ADD CONSTRAINT `fk_menu_has_perfil_menu` FOREIGN KEY (`idmenu`) REFERENCES `menu` (`idmenu`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_menu_has_perfil_perfil1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_perfil1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
