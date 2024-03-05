-- Nome da minha tabela é empresa
CREATE DATABASE Empresa;
-- As criações das tabelas
CREATE TABLE CategoriasPacote (
    categoriaid INT PRIMARY KEY,
    nome VARCHAR(45),
    preco_min FLOAT,
    preco_max FLOAT
);
CREATE TABLE Departamento (
    departamentoid INT PRIMARY KEY,
    nome VARCHAR(45)
);
CREATE TABLE Pacotes (
    pacoteid INT PRIMARY KEY,
    velocidade VARCHAR(45),
    data_inicio DATE,
    mensalidade FLOAT,
    desconto_mensal DECIMAL(10,2),
    num_pacotes INT,
    Departamento_departamentoid INT,
    FOREIGN KEY (Departamento_departamentoid) REFERENCES Departamento(departamentoid)
);
CREATE TABLE Clientes (
    clienteid INT PRIMARY KEY,
    nome VARCHAR(45),
    sobrenome VARCHAR(45),
    data_de_nascimento DATE,
    data_de_cadastro DATE,
    cidade VARCHAR(45),
    estado CHAR(2),
    endereco VARCHAR(45),
    telefone VARCHAR(45),
    celular VARCHAR(45),
    desconto_mensal VARCHAR(45),
    pacotes_pacoteid INT,
    FOREIGN KEY (pacotes_pacoteid) REFERENCES Pacotes(pacoteid)
);
-- Inserts com exemplos de valores para as novas colunas
 
 

INSERT INTO Pacotes (pacoteid, velocidade, data_inicio, mensalidade, desconto_mensal, num_pacotes, Departamento_departamentoid)
VALUES (1, '100 Mbps', '2023-01-01', 50.00, 0.05, 10, 1);  
INSERT INTO Pacotes (pacoteid, velocidade, data_inicio, mensalidade, desconto_mensal, num_pacotes, Departamento_departamentoid)
VALUES (2, '200 Mbps', '2023-01-01', 70.00, 0.10, 15, 2);
INSERT INTO CategoriasPacote (categoriaid, nome, preco_min, preco_max)
VALUES (1, 'Categoria A', 40.00, 60.00);
INSERT INTO CategoriasPacote (categoriaid, nome, preco_min, preco_max)
VALUES (2, 'Categoria B', 70.00, 90.00);
INSERT INTO Departamento (departamentoid, nome)
VALUES (1, 'Vendas');
INSERT INTO Departamento (departamentoid, nome)
VALUES (2, 'Suporte');
INSERT INTO Clientes (clienteid, nome, sobrenome, data_de_nascimento, data_de_cadastro, cidade, estado, endereco, telefone, celular, desconto_mensal, pacotes_pacoteid)
VALUES (1, 'João', 'Silva', '1990-05-15', '2023-01-15', 'São Paulo', 'SP', 'Rua A, 123', '123-4567', '9876-5432', '10%', 1);
INSERT INTO Clientes (clienteid, nome, sobrenome, data_de_nascimento, data_de_cadastro, cidade, estado, endereco, telefone, celular, desconto_mensal, pacotes_pacoteid)
VALUES (2, 'Maria', 'Santos', '1988-12-20', '2023-02-10', 'Rio de Janeiro', 'RJ', 'Avenida B, 456', '987-6543', '8765-4321', '5%', 2);
 

 
-- Mostrar o estado e o número de clientes de cada estado.
SELECT estado, COUNT(*) AS numero_de_clientes
FROM Clientes
GROUP BY estado;
 

-- 2) Mostrar a velocidade de internet e a média de pagamento mensal para cada velocidade.
SELECT velocidade, AVG(mensalidade) AS media_de_pagamento_mensal
FROM Pacotes
GROUP BY velocidade;
-- 3) Mostrar o estado e o número de cidades para cada estado.
SELECT estado, COUNT(DISTINCT cidade) AS numero_de_cidades
FROM Clientes
GROUP BY estado;
-- 4) Mostrar o número do departamento e o maior pagamento mensal por departamento.
SELECT Departamento_departamentoid AS numero_do_departamento, MAX(mensalidade) AS maior_pagamento_mensal
FROM Pacotes
GROUP BY Departamento_departamentoid;
-- 5) Mostrar o número do pacote e a média de desconto mensal para cada pacote.
 
SELECT pacoteid, AVG(CAST(desconto_mensal AS DECIMAL(10,2))) AS media_de_desconto_mensal
FROM Pacotes
GROUP BY pacoteid;
 

-- 6) Mostrar o número do pacote e a média de desconto mensal para cada pacote, apenas para pacotes cujos números sejam 22 ou 13.
SELECT pacoteid, AVG(CAST(desconto_mensal AS DECIMAL(10,2))) AS media_de_desconto_mensal
FROM Pacotes
WHERE pacoteid IN (22, 13)
GROUP BY pacoteid;
-- 7) Mostrar o maior, o menor e a média mensal de pagamento para cada velocidade de internet.
SELECT velocidade, MAX(mensalidade) AS maior_pagamento_mensal, MIN(mensalidade) AS menor_pagamento_mensal, AVG(mensalidade) AS media_de_pagamento_mensal
FROM Pacotes
GROUP BY velocidade;
-- 8) Mostrar a velocidade de internet e o número do pacote para cada velocidade de internet, apenas para velocidades de internet com mais de 8 pacotes.
SELECT P.velocidade, P.pacoteid
FROM Pacotes AS P
JOIN (
    SELECT velocidade, COUNT(*) AS num_pacotes
    FROM Pacotes
    GROUP BY velocidade
    HAVING COUNT(*) > 8
) AS Subquery
ON P.velocidade = Subquery.velocidade; 
 
