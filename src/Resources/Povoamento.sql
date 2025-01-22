USE [Valhala];

GO

-- Tabela Cliente
INSERT INTO Cliente (ID, Nome, Senha) VALUES
(1, 'João Silva', 'cliente1'),
(2, 'Maria Oliveira', 'cliente2'),
(3, 'Carlos Souza', 'cliente3'),
(4, 'Ana Santos', 'cliente4'),
(5, 'Joaquim Costa', 'cliente5'),
(6, 'Julia Lima', 'cliente6'),
(7, 'José Rocha', 'cliente7'),
(8, 'Fernanda Melo', 'cliente8'),
(9, 'Tiago Freitas', 'cliente9'),
(10, 'Mariana Alves', 'cliente10');

-- Tabela Produto
INSERT INTO Produto (ID, Nome, [Preço], Descrição, [Imagem]) VALUES
(1, 'Cadeira LISABO', 55, 'Uma expressão artesanal que é tão confortável como robusta para se adequar até aos membros mais irrequietos da família. Ideal para todas as atividades à roda da mesa como comer, fazer jogos, desenhar e fazer os trabalhos de casa.', 'images/products/cadeira.png'),
(2, 'Estrutura da cama MALM', 159, 'Um design simples com chapa de madeira maciça. Posicione a cama com ou sem a cabeceira encostada à parede. Se precisar de espaço para guardar a roupa de cama, acrescente caixas de arrumação para cama MALM com rodízios.', 'images/products/cama.png'),
(3, 'Estante KALLAX', 50, 'Na vertical ou na horizontal: a gama KALLAX adapta-se ao seu gosto, espaço e orçamento. Personalize a estante com acessórios e caixas de acordo com as suas necessidades.', 'images/products/estante.png'),
(4, 'Mesa de centro LACK', 24, 'As mesas LACK têm uma construção única em papel que as torna leves, fáceis de deslocar e estáveis ao mesmo tempo. Para melhorar ainda mais a sua disposição, também mantemos o preço baixo.', 'images/products/mesa.png'),
(5, 'Banco com arrumação PERJOHAN', 30, 'Este banco multifuncional pode ser usado como assento, mesa de apoio ou mesa de cabeceira. O espaço de arrumação por baixo permite manter revistas ou acessórios de fácil alcance. Além disso, a pega recortada torna-o fácil de deslocar.', 'images/products/banco.png');

-- Tabela Etapa
INSERT INTO Etapa (ID, [Imagem], Produto) VALUES
-- Produto 1
(11, 'images/steps/1/11.png', 1),
(12, 'images/steps/1/12.png', 1),
(13, 'images/steps/1/13.png', 1),
(14, 'images/steps/1/14.png', 1),
(15, 'images/steps/1/15.png', 1),
(16, 'images/steps/1/16.png', 1),
(17, 'images/steps/1/17.png', 1),
-- Produto 2
(21, 'images/steps/2/21.png', 2),
(22, 'images/steps/2/22.png', 2),
(23, 'images/steps/2/23.png', 2),
(24, 'images/steps/2/24.png', 2),
(25, 'images/steps/2/25.png', 2),
(26, 'images/steps/2/26.png', 2),
(27, 'images/steps/2/27.png', 2),
(28, 'images/steps/2/28.png', 2),
(29, 'images/steps/2/29.png', 2),
(210, 'images/steps/2/210.png', 2),
(211, 'images/steps/2/211.png', 2),
-- Produto 3
(31, 'images/steps/3/31.png', 3),
(32, 'images/steps/3/32.png', 3),
(33, 'images/steps/3/33.png', 3),
(34, 'images/steps/3/34.png', 3),
(35, 'images/steps/3/35.png', 3),
(36, 'images/steps/3/36.png', 3),
(37, 'images/steps/3/37.png', 3),
(38, 'images/steps/3/38.png', 3),
(39, 'images/steps/3/39.png', 3),
(310, 'images/steps/3/310.png', 3),
(311, 'images/steps/3/311.png', 3),
-- Produto 4
(41, 'images/steps/4/41.png', 4),
(42, 'images/steps/4/42.png', 4),
(43, 'images/steps/4/43.png', 4),
(44, 'images/steps/4/44.png', 4),
(45, 'images/steps/4/45.png', 4),
(46, 'images/steps/4/46.png', 4),
(47, 'images/steps/4/47.png', 4),
(48, 'images/steps/4/48.png', 4),
-- Produto 5
(51, 'images/steps/5/51.png', 5),
(52, 'images/steps/5/52.png', 5),
(53, 'images/steps/5/53.png', 5),
(54, 'images/steps/5/54.png', 5),
(55, 'images/steps/5/55.png', 5),
(56, 'images/steps/5/56.png', 5),
(57, 'images/steps/5/57.png', 5),
(58, 'images/steps/5/58.png', 5),
(59, 'images/steps/5/59.png', 5),
(510, 'images/steps/5/510.png', 5);

-- Tabela Fornecedor
INSERT INTO Fornecedor (ID, Nome, Senha) VALUES
(1, 'Joaquim Esteves', 'Fornecedor1'),
(2, 'Ferramentas e Companhia', 'Fornecedor2'),
(3, 'Ferreia Martim e Filhos', 'Fornecedor3'),
(4, 'MC Madeiras', 'Fornecedor4'),
(5, 'Madiplac', 'Fornecedor5');

-- Tabela Gestor
INSERT INTO Gestor (ID, Nome, Senha) VALUES
(1, 'Liliana Silva', 'Gestor1'),
(2, 'Margarida Costa', 'Gestor2'),
(3, 'Olívia Braga', 'Gestor3');

-- Tabela Funcionário
INSERT INTO Funcionário (ID, Nome, Senha) VALUES
(1, 'Joaquim Costa', 'Funcionario1'),
(2, 'Maria Silva', 'Funcionario2'),
(3, 'Ana Sousa', 'Funcionario3'),
(4, 'Carlos Almeida', 'Funcionario4'),
(5, 'João Pereira', 'Funcionario5'),
(6, 'Beatriz Santos', 'Funcionario6'),
(7, 'Ricardo Carvalho', 'Funcionario7'),
(8, 'Helena Martins', 'Funcionario8'),
(9, 'Fernanda Lopes', 'Funcionario9'),
(10, 'Luís Rodrigues', 'Funcionario10');

-- Tabela Peca
INSERT INTO Peça (ID, Quantidade, [Imagem], Fornecedor) VALUES
-- produto 1 - cadeira
(123595, 100, "images/parts/123595.svg", 1),
(100212, 200, "images/parts/100212.svg", 1),
(10087753, 150, "images/parts/10087753.svg", 1),
(195701, 180, "images/parts/195701.svg", 1),
(111, 120, "images/parts/111.svg", 2), -- tabua 1 da cadeira
(112, 120, "images/parts/112.svg", 2), -- tabua 2 da cadeira
(113, 120, "images/parts/113.svg", 2), -- suporte da cadeira
(114, 120, "images/parts/114.svg", 2), -- sento da cadeira
(115, 120, "images/parts/115.svg", 2), -- pedaço de madeira do passo2
-- produto 2 - cama
(101367, 140, "images/parts/101367.svg", 3),
(101359, 140, "images/parts/101359.svg", 3),
(110789, 140, "images/parts/110789.svg", 3),
(105163, 140, "images/parts/105163.svg", 3),
(130507, 140, "images/parts/130507.svg", 4),
(10096286, 140, "images/parts/10096286.svg", 4),
(114254, 140, "images/parts/114254.svg", 5),
(123491, 140, "images/parts/123491.svg", 2),
(114334, 140, "images/parts/114334.svg", 1),
(114670, 140, "images/parts/114670.svg", 3),
(122998, 140, "images/parts/122998.svg", 3),
(100049, 140, "images/parts/100049.svg", 3),
(113453, 140, "images/parts/113453.svg", 4),
(122628, 140, "images/parts/122628.svg", 4),
(211, 140, "images/parts/211.svg", 4), -- tabua 1 da cama
(212, 140, "images/parts/212.svg", 5), -- tabua 2 da cama
(213, 140, "images/parts/213.svg", 5), -- tabua 3 da cama
(214, 140, "images/parts/214.svg", 5), -- tabua direita lateral da cama
(215, 140, "images/parts/215.svg", 2), -- tabua esquerda lateral da cama
(216, 140, "images/parts/216.svg", 1), -- grades onde se coloca o colchão da cama
(117228, 140, "images/parts/117228.svg", 5), -- tabua do fundo da cama
-- produto 3 - estante
(10002300, 140, "images/parts/10002300.svg", 3),
(104321, 140, "images/parts/104321.svg", 3),
(118331, 140, "images/parts/118331.svg", 3),
(119250, 140, "images/parts/119250.svg", 3),
(100372, 140, "images/parts/100372.svg", 3),
(121030, 140, "images/parts/121030.svg", 3),
(100092, 140, "images/parts/100092.svg", 4),
(115753, 140, "images/parts/115753.svg", 4),
(103693, 140, "images/parts/103693.svg", 4),
(115754, 140, "images/parts/115754.svg", 4),
(311, 140, "images/parts/311.svg", 5), -- tabuas grandes
(312, 140, "images/parts/312.svg", 5), -- tabuas pequeninas interiores
(313, 140, "images/parts/313.svg", 5), -- tabuas superior e inferior
-- produto 4 - mesa de centro
(115980, 140, "images/parts/115980.svg", 5),
(108530, 140, "images/parts/108530.svg", 5),
(109041, 140, "images/parts/109041.svg", 2),
(120298, 140, "images/parts/120298.svg", 2),
(120938, 140, "images/parts/120938.svg", 2),
(411, 140, "images/parts/411.svg", 2), -- tabua grande
(412, 140, "images/parts/412.svg", 2), -- pernas da mesa
(413, 140, "images/parts/413.svg", 2), -- tabua por baixo
-- produto 5 - banco com arrumação
(100214, 140, "images/parts/100214.svg", 1),
(101350, 140, "images/parts/101350.svg", 2),
(100001, 140, "images/parts/100001.svg", 3),
(511, 140, "images/parts/511.svg", 4), -- tabuas laterais
(512, 140, "images/parts/512.svg", 5), -- pernas
(513, 140, "images/parts/513.svg", 1), -- tabua de arrumação
(514, 140, "images/parts/514.svg", 2); -- tabuas superiores

-- Tabela ProdutoPeça
INSERT INTO ProdutoPeça (Peca_ID, Produto_ID) VALUES
(123595, 1),
(100212, 1),
(10087753, 1),
(195701, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(101367, 2),
(101359, 2),
(110789, 2),
(105163, 2),
(130507, 2),
(10096286, 2),
(114254, 2),
(123491, 2),
(114334, 2),
(114670, 2),
(122998, 2),
(100049, 2),
(113453, 2),
(122628, 2),
(211, 2),
(212, 2),
(213, 2),
(214, 2),
(215, 2),
(216, 2),
(117228, 2),
(10002300,3),
(104321,3),
(118331,3),
(119250,3),
(100372,3),
(121030,3),
(100092,3),
(115753,3),
(103693,3),
(115754,3),
(311, 3),
(312, 3),
(313, 3),
(115980, 4),
(108530, 4),
(109041, 4),
(120298, 4),
(120938, 4),
(411, 4),
(412, 4),
(413, 4),
(100214, 5),
(101350, 5),
(100001, 5),
(511, 5),
(512, 5),
(513, 5),
(514, 5);

-- Tabela PeçaEtapa
INSERT INTO PeçaEtapa (Peca_ID, Etapa_ID, Quantidade) VALUES
-- Etapas do Produto 1
(111, 11, 1),
(112, 11, 1),
(115, 12, 1),
(195701, 12, 1),
(100212, 12, 4),
(10087753, 14, 4),
(113, 14, 1),
(123595, 16, 6),
(114, 16, 1),
-- Etapas do Produto 2
(211, 21, 1),
(212, 21, 1),
(213, 21, 1),
(122628, 21, 4),
(123491, 22, 8),
(113453, 22, 1),
(101359, 23, 12),
(214, 23, 1),
(215, 23, 1),
(114670, 24, 8),
(101367, 25, 3),
(114334, 25, 3),
(122998, 27, 3),
(110789, 28, 16),
(117228, 29, 2),
(130507, 29, 5),
(105163, 210, 4),
(10096286, 210, 4),
-- Etapas do Produto 3
(118331, 31, 12),
(311, 31, 2),
(312, 32, 3),
(119250, 34, 12),
(313, 35, 2),
(121030, 36, 1),
(100092, 36, 1),
(104321, 36, 8),
(10002300, 37, 4),
(115753, 38, 2),
(100372, 38, 4),
(103693, 311, 2),
(115754, 311, 2),
-- Etapas do Produto 4
(115980, 41, 4),
(411, 41, 1),
(412, 42, 4),
(120938, 43, 2),
(108530, 44, 2),
(120298, 44, 2),
(108530, 46, 2),
(120298, 46, 2),
(413, 47, 1),
(109041, 48, 4),
-- Etapas do Produto 5
(101350, 41, 8),
(511, 51, 2),
(512, 52, 1),
(100214, 53, 4),
(101350, 54, 2),
(513, 54, 1),
(512, 56, 1),
(100214, 57, 4),
(101350, 58, 4),
(514, 59, 2),
(100214, 510, 4);

-- Tabela PeçaFuncionário, precisámos mesmo desta tabela? Acho que não faz muito sentido, por causa do sistema que temos
INSERT INTO PeçaFuncionário (Peca_ID, Funcionario_ID) VALUES
(123595, 1),
(114334, 2),
(311, 3),
(311, 4),
(101350, 5),
(118331, 6),
(101367, 7),
(10096286, 8),
(100092, 9),
(115753, 10);

-- Tabela PedidoPeça
INSERT INTO PedidoPeça (ID, Quantidade, [Estado], Peça, Gestor) VALUES
(1, 50, 1, 123595, 3),
(2, 70, 0, 114334, 2),
(3, 40, 1, 100092, 1),
(4, 60, 0, 311, 2),
(5, 30, 1, 101350, 2),
(6, 20, 0, 118331, 2),
(7, 10, 1, 115753, 1),
(8, 90, 0, 195701, 1),
(9, 80, 1, 101367, 1),
(10, 100, 0, 10096286, 3);

-- Tabela Encomenda
INSERT INTO Encomenda (ID, Estado, [Data de Criação], [Data de Entrega], Cliente, Produto, Etapa) VALUES
(1, 2, '2025-01-01', '2025-10-01', 1, 1, 12),
(2, 2, '2025-01-02', '2025-01-13', 1, 2, 21),
(3, 2, '2025-01-03', '2025-01-15', 1, 3, 33),
(4, 1, '2025-01-04', NULL, 2, 4, 44),
(5, 2, '2025-01-05', '2025-01-15', 3, 5, 55),
(6, 2, '2025-01-06', '2025-01-16', 4, 1, 16),
(7, 2, '2025-01-07', '2025-01-16', 5, 4, 42),
(8, 1, '2025-01-08', NULL, 3, 3, 38),
(9, 2, '2025-01-09', '2025-01-17', 6, 2, 25),
(10, 2, '2025-01-09', '2025-01-18', 7, 1, 13),
(11, 2, '2025-01-09', '2025-01-18', 8, 2, 29),
(12, 1, '2025-01-09', NULL, 9, 1, 12),
(13, 1, '2025-01-09', NULL, 10, 4, 41),
(14, 0, '2025-01-09', NULL, 3, 5, 53),
(15, 0, '2025-01-10', NULL, 7, 5, 54);

-- Tabela FuncionárioEncomenda
INSERT INTO FuncionárioEncomenda (Funcionario_ID, Encomenda_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(2, 10),
(3, 11),
(4, 12),
(4, 13),
(7, 14),
(10, 15);
