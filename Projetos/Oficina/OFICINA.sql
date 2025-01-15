CREATE DATABASE Oficina;
USE Oficina;

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    Nome VARCHAR(45),
    Endereço VARCHAR(45),
    Telefone VARCHAR(45)
);

CREATE TABLE Carro (
    idCarro INT PRIMARY KEY,
    Modelo VARCHAR(45),
    Placa VARCHAR(45),
    Ano VARCHAR(45),
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Equipe (
    idEquipe INT PRIMARY KEY,
    Nome VARCHAR(45)
);

CREATE TABLE Mecanico (
    idMecanico INT PRIMARY KEY,
    Nome VARCHAR(45),
    Especialidade VARCHAR(45),
    Endereço VARCHAR(45)
);

CREATE TABLE Equipe_has_Mecanico (
    Equipe_idEquipe INT,
    Mecanico_idMecanico INT,
    PRIMARY KEY (Equipe_idEquipe, Mecanico_idMecanico),
    FOREIGN KEY (Equipe_idEquipe) REFERENCES Equipe(idEquipe),
    FOREIGN KEY (Mecanico_idMecanico) REFERENCES Mecanico(idMecanico)
);

CREATE TABLE Servico (
    idServico INT PRIMARY KEY,
    Descrição VARCHAR(45),
    Preço FLOAT
);

CREATE TABLE Peça (
    idPeça INT PRIMARY KEY,
    Descrição VARCHAR(45),
    Preço FLOAT,
    Quantidade INT
);

CREATE TABLE OS (
    idOS INT PRIMARY KEY,
    Data_de_emissão DATE,
    Valor FLOAT,
    Data_de_Conclusão DATE,
    Status VARCHAR(45),
    Carro_idCarro INT,
    Equipe_idEquipe INT,
    Autorizado TINYINT,
    FOREIGN KEY (Carro_idCarro) REFERENCES Carro(idCarro),
    FOREIGN KEY (Equipe_idEquipe) REFERENCES Equipe(idEquipe)
);

CREATE TABLE OS_has_Serviço (
    OS_idOS INT,
    Servico_idServico INT,
    PRIMARY KEY (OS_idOS, Servico_idServico),
    FOREIGN KEY (OS_idOS) REFERENCES OS(idOS),
    FOREIGN KEY (Servico_idServico) REFERENCES Servico(idServico)
);

CREATE TABLE OS_has_Peça (
    OS_idOS INT,
    Peça_idPeça INT,
    PRIMARY KEY (OS_idOS, Peça_idPeça),
    FOREIGN KEY (OS_idOS) REFERENCES OS(idOS),
    FOREIGN KEY (Peça_idPeça) REFERENCES Peça(idPeça)
);
