-- in progress
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

-- Tabela Produto, mudar imagens
INSERT INTO Produto (ID, Nome, Preço, Descrição, Imagem) VALUES
(1, 'Cadeira LISABO', 55.00, 'Uma expressão artesanal que é tão confortável como robusta para se adequar até aos membros mais irrequietos da família. Ideal para todas as atividades à roda da mesa como comer, fazer jogos, desenhar e fazer os trabalhos de casa.', NULL),
(2, 'Estrutura da cama MALM', 159.00, 'Um design simples com chapa de madeira maciça. Posicione a cama com ou sem a cabeceira encostada à parede. Se precisar de espaço para guardar a roupa de cama, acrescente caixas de arrumação para cama MALM com rodízios.', NULL),
(3, 'Estante KALLAX', 50.00, 'Na vertical ou na horizontal: a gama KALLAX adapta-se ao seu gosto, espaço e orçamento. Personalize a estante com acessórios e caixas de acordo com as suas necessidades.C', NULL),
(4, 'Mesa de centro LACK', 24.00, 'As mesas LACK têm uma construção única em papel que as torna leves, fáceis de deslocar e estáveis ao mesmo tempo. Para melhorar ainda mais a sua disposição, também mantemos o preço baixo.', NULL),
(5, 'Banco com arrumação PERJOHAN', 30.00, 'Este banco multifuncional pode ser usado como assento, mesa de apoio ou mesa de cabeceira. O espaço de arrumação por baixo permite manter revistas ou acessórios de fácil alcance. Além disso, a pega recortada torna-o fácil de deslocar.', NULL);

-- Tabela Etapa, mudar imagens
-- ID - 12 (1 - produto, 2 - nº etapa)
INSERT INTO Etapa (ID, Imagem, Produto) VALUES
-- Produto 1
(11, 'Imagem1', 1),
(12, 'Imagem2', 1),
(13, 'Imagem3', 1), -- apenas apertar, não tem peças
(14, 'Imagem4', 1),
(15, 'Imagem5', 1), -- apenas apertar, não tem peças
(16, 'Imagem6', 1),
(17, 'Imagem7', 1), -- apenas apertar, não tem peças
-- Produto 2
(21, 'Imagem8', 2),
(22, 'Imagem9', 2),
(23, 'Imagem9', 2),
(24, 'Imagem9', 2),
(25, 'Imagem9', 2),
(26, 'Imagem9', 2),
(27, 'Imagem9', 2),
(28, 'Imagem9', 2),
(29, 'Imagem9', 2),
(210, 'Imagem9', 2),
(211, 'Imagem9', 2),
-- Produto 3
(31, 'Imagem8', 3),
(32, 'Imagem9', 3),
(33, 'Imagem9', 3),
(34, 'Imagem9', 3),
(35, 'Imagem9', 3),
(36, 'Imagem9', 3),
(37, 'Imagem9', 3),
(38, 'Imagem9', 3),
(39, 'Imagem9', 3),
(310, 'Imagem9', 3),
(311, 'Imagem9', 3),
-- Produto 4
(41, 'Imagem8', 4),
(42, 'Imagem9', 4),
(43, 'Imagem9', 4),
(44, 'Imagem9', 4),
(45, 'Imagem9', 4),
(46, 'Imagem9', 4),
(47, 'Imagem9', 4),
(48, 'Imagem9', 4),
-- Produto 5
(51, 'Imagem8', 5),
(52, 'Imagem9', 5),
(53, 'Imagem9', 5),
(54, 'Imagem9', 5),
(55, 'Imagem9', 5),
(56, 'Imagem9', 5),
(57, 'Imagem9', 5),
(58, 'Imagem9', 5),
(59, 'Imagem9', 5),
(510, 'Imagem9', 5);

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

-- Tabela Peca, mudar imagens
INSERT INTO Peca (ID, Quantidade, Imagem, Fornecedor) VALUES
-- produto 1 - cadeira
(123595, 100, 'Imagem1', 1),
(100212, 200, 'Imagem2', 1),
(10087753, 150, 'Imagem3', 1),
(195701, 180, 'Imagem4', 1),
(111, 120, 'Imagem5', 2), -- tabula 1 da cadeira
(112, 120, 'Imagem6', 2), -- tabula 2 da cadeira
(113, 120, 'Imagem7', 2), -- suporte da cadeira
(114, 120, 'Imagem8', 2), -- sento da cadeira
(115, 120, 'Imagem9', 2), -- pedaço de madeira do passo2
-- produto 2 - cama
(101367, 140, 'Imagem10', 3),
(101359, 140, 'Imagem10', 3),
(110789, 140, 'Imagem10', 3),
(105163, 140, 'Imagem10', 3),
(130507, 140, 'Imagem10', 4),
(10096286, 140, 'Imagem10', 4),
(114254, 140, 'Imagem10', 5),
(123491, 140, 'Imagem10', 2),
(114334, 140, 'Imagem10', 1),
(114670, 140, 'Imagem10', 3),
(122998, 140, 'Imagem10', 3),
(100049, 140, 'Imagem10', 3),
(113453, 140, 'Imagem10', 4),
(122628, 140, 'Imagem10', 4),
(211, 140, 'Imagem10', 4), -- tabua 1 da cama
(212, 140, 'Imagem10', 5), -- tabua 2 da cama
(213, 140, 'Imagem10', 5), -- tabua 3 da cama
(214, 140, 'Imagem10', 5), -- tabua direita lateral da cama
(215, 140, 'Imagem10', 2), -- tabua esquerda lateral da cama
(216, 140, 'Imagem10', 1), -- grades onde se coloca o colchão da cama
(117228, 140, 'Imagem10', 5), -- tabua do fundo da cama
-- produto 3 - estante
(10002300, 140, 'Imagem10', 3),
(104321, 140, 'Imagem10', 3),
(118331, 140, 'Imagem10', 3),
(119250, 140, 'Imagem10', 3),
(100372, 140, 'Imagem10', 3),
(121030, 140, 'Imagem10', 3),
(100092, 140, 'Imagem10', 4),
(115753, 140, 'Imagem10', 4),
(103693, 140, 'Imagem10', 4),
(115754, 140, 'Imagem10', 4),
(311, 140, 'Imagem10', 5), -- tabuas grandes
(312, 140, 'Imagem10', 5), -- tabuas pequeninas interiores
(313, 140, 'Imagem10', 5), -- tabuas superior e inferior
-- produto 4 - mesa de centro
(115980, 140, 'Imagem10', 5),
(108530, 140, 'Imagem10', 5),
(109041, 140, 'Imagem10', 2),
(120298, 140, 'Imagem10', 2),
(120938, 140, 'Imagem10', 2),
(411, 140, 'Imagem10', 2), -- tabua grande
(412, 140, 'Imagem10', 2), -- pernas da mesa
(413, 140, 'Imagem10', 2), -- tabua por baixo
-- produto 5 - banco com arrumação
(100214, 140, 'Imagem10', 1),
(101350, 140, 'Imagem10', 2),
(100001, 140, 'Imagem10', 3),
(511, 140, 'Imagem10', 4), -- tabuas laterais
(512, 140, 'Imagem10', 5), -- pernas
(513, 140, 'Imagem10', 1), -- tabua de arrumação
(514, 140, 'Imagem10', 2); -- tabuas superiores

-- Tabela Produto_Peça
INSERT INTO Produto_Peça (Peca_ID, Produto_ID) VALUES
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

-- Tabela Peca_Etapa
INSERT INTO Peca_Etapa (Peca_ID, Etapa_ID, Quantidade) VALUES
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

-- Tabela Peca_Funcionário, precisámos mesmo desta tabela? Acho que não faz muito sentido, por causa do sistema que temos
INSERT INTO Peca_Funcionário (Peca_ID, Funcionário_ID) VALUES
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

-- Tabela PedidoPeca (0 - não entregue, 1 - entregue)
INSERT INTO PedidoPeca (ID, Quantidade, Estado, Peca, Gestor) VALUES
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

-- Tabela Encomenda (Estado 0 - por começar, 1 - em processamento, 2 - concluída)
INSERT INTO Encomenda (ID, Estado, `Data de Criação`, `Data de Entrega`, Cliente, Produto, Etapa) VALUES
(1, 2, '2025-01-01', '2025-10-01', 1, 1, 12),
(2, 0, '2025-01-02', NULL, 1, 2, 21),
(3, 1, '2025-01-03', NULL, 1, 3, 33),
(4, 1, '2025-01-04', NULL, 2, 4, 44),
(5, 1, '2025-01-05', NULL, 3, 5, 55),
(6, 1, '2025-01-06', NULL, 4, 1, 16),
(7, 1, '2025-01-07', NULL, 5, 4, 42),
(8, 1, '2025-01-08', NULL, 3, 3, 38),
(9, 1, '2025-01-09', NULL, 6, 2, 25),
(10, 1, '2025-01-09', NULL, 7, 1, 13),
(11, 1, '2025-01-09', NULL, 8, 2, 29),
(12, 1, '2025-01-09', NULL, 9, 1, 12),
(13, 0, '2025-01-09', NULL, 10, 4, 41),
(14, 1, '2025-01-09', NULL, 3, 5, 53),
(15, 1, '2025-01-10', NULL, 7, 5, 54);

-- Tabela Funcionário_Encomenda
INSERT INTO Funcionário_Encomenda (Funcionário_ID, Encomenda_ID) VALUES
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
