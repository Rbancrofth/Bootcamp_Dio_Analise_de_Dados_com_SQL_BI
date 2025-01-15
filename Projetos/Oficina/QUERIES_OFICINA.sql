use oficina;

-- Clientes
INSERT INTO Cliente (idCliente, Nome, Endereço, Telefone) VALUES
(1, 'Carlos Silva', 'Rua A, 123', '123456789'),
(2, 'Ana Souza', 'Rua B, 456', '987654321'),
(3, 'João Almeida', 'Rua E, 321', '456789123'),
(4, 'Maria Santos', 'Rua F, 654', '789123456'),
(5, 'Pedro Costa', 'Rua G, 987', '321654987'),
(6, 'Luciana Ramos', 'Rua H, 111', '654789321'),
(7, 'Marcos Lima', 'Rua I, 222', '987321654');

-- Carros
INSERT INTO Carro (idCarro, Modelo, Placa, Ano, Cliente_idCliente) VALUES
(1, 'Civic', 'ABC1234', 2020, 1),
(2, 'Corolla', 'XYZ5678', 2018, 2),
(3, 'Onix', 'DEF3456', 2021, 3),
(4, 'Compass', 'GHI7890', 2019, 4),
(5, 'Gol', 'JKL1234', 2017, 5),
(6, 'Palio', 'MNO5678', 2015, 6),
(7, 'HB20', 'PQR9012', 2022, 7);

INSERT INTO Equipe (idEquipe, Nome) VALUES
(1, 'Equipe Alfa'), 
(2, 'Equipe Beta');

INSERT INTO Mecanico (idMecanico, Nome, Especialidade, Endereço) VALUES
(1, 'João Pereira', 'Motor', 'Rua C, 789'),
(2, 'Maria Oliveira', 'Suspensão', 'Rua D, 101'),
(3, 'Carlos Martins', 'Freios', 'Rua E, 202'),
(4, 'Ana Ribeiro', 'Elétrica', 'Rua F, 303');

INSERT INTO Equipe_has_Mecanico (Equipe_idEquipe, Mecanico_idMecanico) VALUES
(1, 1), 
(1, 2),
(2, 3),
(2, 4);

INSERT INTO Servico (idServico, Descrição, Preço) VALUES
(1, 'Troca de óleo', 100),
(2, 'Alinhamento', 150),
(3, 'Revisão completa', 300),
(4, 'Substituição de pastilhas de freio', 200),
(5, 'Diagnóstico eletrônico', 250);

INSERT INTO Peça (idPeça, Descrição, Preço, Quantidade) VALUES
(1, 'Filtro de óleo', 50, 10),
(2, 'Pneu', 300, 20),
(3, 'Pastilha de freio', 100, 15),
(4, 'Bateria', 400, 5),
(5, 'Correia dentada', 150, 8);

-- Ordens de Serviço (OS)
INSERT INTO OS (idOS, Data_de_emissão, Valor, Data_de_Conclusão, Status, Carro_idCarro, Equipe_idEquipe, Autorizado) VALUES
(1, '2025-01-01', 500, '2025-01-03', 'Concluído', 1, 1, 1),
(2, '2025-01-02', 700, '2025-01-05', 'Concluído', 2, 2, 1),
(3, '2025-01-03', 400, NULL, 'Em andamento', 3, 1, 1),
(4, '2025-01-04', 600, '2025-01-06', 'Concluído', 4, 2, 1),
(5, '2025-01-05', 450, NULL, 'Em andamento', 5, 1, 1),
(6, '2025-01-06', 800, '2025-01-08', 'Concluído', 6, 2, 1),
(7, '2025-01-07', 300, NULL, 'Em andamento', 7, 1, 1),
(8, '2025-01-08', 550, '2025-01-09', 'Concluído', 1, 2, 1),
(9, '2025-01-09', 750, '2025-01-12', 'Concluído', 2, 1, 1),
(10, '2025-01-10', 650, NULL, 'Em andamento', 3, 2, 1);

-- Associação entre OS e serviços
INSERT INTO OS_has_Serviço (OS_idOS, Servico_idServico) VALUES
(1, 1), (1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1), (5, 3),
(6, 2), (6, 4),
(7, 5),
(8, 1), (8, 2),
(9, 3), (9, 5),
(10, 4);

-- Associação entre OS e peças
INSERT INTO OS_has_Peça (OS_idOS, Peça_idPeça) VALUES
(1, 1), (1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1), (5, 3),
(6, 2), (6, 4),
(7, 5),
(8, 1), (8, 2),
(9, 3), (9, 5),
(10, 4);

-- QUERIES DE CONSULTA

-- 01 -- LISTA DE CLIENTES COM ENDERECO E TELEFONE
SELECT * FROM Cliente;

-- 02 -- CARROS COM ANO IGUAL OU SUPERIOR A 2019
SELECT * FROM Carro WHERE Ano >= 2019;

-- 03 -- SERVIÇOS COM VALOR MAIOR OU IGUAL A 200 REAIS
SELECT Descrição, Preço 
FROM Servico 
WHERE Preço >= 200;

-- 04 -- CLIENTE POR EQUIPE E STATUS DA ORDEM DE SERVIÇO
SELECT 
    Cliente.Nome AS Cliente,
    Carro.Modelo AS Carro,
    Equipe.Nome AS Equipe,
    OS.Status AS Status_OS
FROM OS
JOIN Carro ON OS.Carro_idCarro = Carro.idCarro
JOIN Cliente ON Carro.Cliente_idCliente = Cliente.idCliente
JOIN Equipe ON OS.Equipe_idEquipe = Equipe.idEquipe;

-- 05 -- CLIENTE COM SERVICOS DE MAIOR VALOR REALIZADOS
SELECT 
    Cliente.Nome AS Nome_completo,
    Carro.Modelo AS Modelo_Carro,
    OS.idOS,
    (OS.Valor + COALESCE(SUM(Peça.Preço), 0) + COALESCE(SUM(Servico.Preço), 0)) AS Valor_Total_OS
FROM OS
JOIN Carro ON OS.Carro_idCarro = Carro.idCarro
JOIN Cliente ON Carro.Cliente_idCliente = Cliente.idCliente
LEFT JOIN OS_has_Peça ON OS.idOS = OS_has_Peça.OS_idOS
LEFT JOIN Peça ON OS_has_Peça.Peça_idPeça = Peça.idPeça
LEFT JOIN OS_has_Serviço ON OS.idOS = OS_has_Serviço.OS_idOS
LEFT JOIN Servico ON OS_has_Serviço.Servico_idServico = Servico.idServico
GROUP BY OS.idOS
ORDER BY Valor_Total_OS DESC;

-- 06 -- ORDENS DE SERVIÇO ONDE O VALOR TOTAL DE PEÇAS SUPERA 400
SELECT 
    OS.idOS, 
    SUM(Peça.Preço) AS Total_Peças
FROM OS
JOIN OS_has_Peça ON OS.idOS = OS_has_Peça.OS_idOS
JOIN Peça ON OS_has_Peça.Peça_idPeça = Peça.idPeça
GROUP BY OS.idOS
HAVING Total_Peças >= 400;

-- 07 -- CARRO EM QUE CADA MECANICO E EQUIPE TRABALHOU
SELECT 
    Cliente.Nome AS Cliente_Nome,
    Carro.Modelo AS Modelo_Carro,
    Mecanico.Nome AS Mecanico_Nome,
    Mecanico.Especialidade AS Mecanico_Especialidade,
    Equipe.Nome AS Equipe_Nome
FROM OS
JOIN Carro ON OS.Carro_idCarro = Carro.idCarro
JOIN Cliente ON Carro.Cliente_idCliente = Cliente.idCliente
JOIN Equipe ON OS.Equipe_idEquipe = Equipe.idEquipe
JOIN Equipe_has_Mecanico ON Equipe.idEquipe = Equipe_has_Mecanico.Equipe_idEquipe
JOIN Mecanico ON Equipe_has_Mecanico.Mecanico_idMecanico = Mecanico.idMecanico;

-- 08 -- CARROS COM MAIS ORDEM DE SERVIÇO
SELECT 
    Carro.Modelo AS Modelo_Carro,
    Carro.Placa AS Placa_Carro,
    COUNT(OS.idOS) AS Quantidade_OS
FROM Carro
JOIN OS ON Carro.idCarro = OS.Carro_idCarro
GROUP BY Carro.idCarro
ORDER BY Quantidade_OS DESC;
