-- Para executar o script várias vezes
DROP DATABASE IF EXISTS oficina;

-- DB oficina
CREATE DATABASE IF NOT EXISTS oficina;
USE oficina;

-- Tabela Clientes
CREATE TABLE Clientes (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    TipoCliente ENUM('PF', 'PJ') NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    CPF CHAR(11) UNIQUE,
    CNPJ CHAR(14) UNIQUE,
    Endereco VARCHAR(255),
    Email VARCHAR(100) UNIQUE,
    Telefone VARCHAR(20),
    DataCadastro DATE NOT NULL
);

-- Tabela Veículos
CREATE TABLE Veiculos (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    Marca VARCHAR(100) NOT NULL,
    Modelo VARCHAR(100) NOT NULL,
    AnoFabricacao YEAR,
    Placa VARCHAR(10) UNIQUE,
    Cor VARCHAR(50),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente)
);

-- Tabela Serviços
CREATE TABLE Servicos (
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Preco DECIMAL(10, 2) NOT NULL,
    DataCadastro DATE NOT NULL
);

-- Tabela Agendamentos
CREATE TABLE Agendamentos (
    idAgendamento INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    idVeiculo INT,
    idServico INT,
    DataAgendamento DATETIME NOT NULL,
    Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente),
    FOREIGN KEY (idVeiculo) REFERENCES Veiculos (idVeiculo),
    FOREIGN KEY (idServico) REFERENCES Servicos (idServico)
);

-- Tabela Pagamentos
CREATE TABLE Pagamentos (
    idPagamento INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    Valor DECIMAL(10, 2) NOT NULL,
    DataPagamento DATE NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente)
);

-- Tabela HistoricoServicos
CREATE TABLE HistoricoServicos (
    idHistoricoServico INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    idVeiculo INT,
    idServico INT,
    DataExecucao DATETIME NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente),
    FOREIGN KEY (idVeiculo) REFERENCES Veiculos (idVeiculo),
    FOREIGN KEY (idServico) REFERENCES Servicos (idServico)
);

-- Tabela Mecanicos
CREATE TABLE Mecanicos (
    idMecanico INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Especialidade VARCHAR(100),
    Telefone VARCHAR(20),
    Email VARCHAR(100) UNIQUE
);

-- Tabela ServicosMecanicos
CREATE TABLE ServicosMecanicos (
    idServicoMecanico INT AUTO_INCREMENT PRIMARY KEY,
    idServico INT,
    idMecanico INT,
    DataExecucao DATETIME NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idServico) REFERENCES Servicos (idServico),
    FOREIGN KEY (idMecanico) REFERENCES Mecanicos (idMecanico)
);

-- Tabela Avaliacoes
CREATE TABLE Avaliacoes (
    idAvaliacao INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    Comentario TEXT,
    Nota INT NOT NULL CHECK (Nota >= 1 AND Nota <= 5),
    DataAvaliacao DATE NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente)
);

-- Inserts na tabela Clientes

INSERT INTO Clientes (TipoCliente, Nome, CPF, CNPJ, Endereco, Email, Telefone, DataCadastro)
VALUES
    ('PF', 'João Silva', '12345678901', NULL, 'Rua das Flores, 123', 'joao@gmail.com', '(11) 9999-8888', '2023-09-01'),
    ('PF', 'Maria Santos', '98765432109', NULL, 'Av. Principal, 456', 'maria@gmail.com', '(11) 7777-6666', '2023-09-02'),
    ('PJ', 'Auto Mecânica ABC', NULL, '12345678901234', 'Rua Comercial, 789', 'contato@automecanicaabc.com', '(11) 3333-2222', '2023-09-03'),
    ('PF', 'Pedro Oliveira', '55566677788', NULL, 'Rua da Oficina, 789', 'pedro@gmail.com', '(11) 4444-3333', '2023-09-04'),
    ('PF', 'Ana Rodrigues', '22233344455', NULL, 'Av. da República, 321', 'ana@gmail.com', '(11) 5555-4444', '2023-09-05'),
    ('PJ', 'Auto Center XYZ', NULL, '98765432100123', 'Rua das Ferramentas, 456', 'contato@autocenterxyz.com', '(11) 2222-1111', '2023-09-06'),
    ('PF', 'José Santos', '77788899900', NULL, 'Rua dos Carros, 654', 'jose@gmail.com', '(11) 6666-5555', '2023-09-07'),
    ('PF', 'Mariana Oliveira', '11122233344', NULL, 'Av. dos Veículos, 987', 'mariana@gmail.com', '(11) 7777-8888', '2023-09-08'),
    ('PJ', 'Oficina Mecânica FastCar', NULL, '55544433322211', 'Rua Veloz, 123', 'contato@fastcaroficina.com', '(11) 8888-9999', '2023-09-09'),
    ('PF', 'Carlos Silva', '99988877766', NULL, 'Av. dos Motores, 789', 'carlos@gmail.com', '(11) 9999-7777', '2023-09-10');

-- Inserts na tabela Veiculos

INSERT INTO Veiculos (Marca, Modelo, AnoFabricacao, Placa, Cor, idCliente)
VALUES
    ('Toyota', 'Corolla', 2020, 'ABC-1234', 'Prata', 1),
    ('Ford', 'Focus', 2018, 'XYZ-5678', 'Azul', 2),
    ('Honda', 'Civic', 2022, 'DEF-4321', 'Preto', 3),
    ('Volkswagen', 'Golf', 2019, 'MNO-8765', 'Branco', 4),
    ('Chevrolet', 'Cruze', 2021, 'JKL-9876', 'Vermelho', 5),
    ('Hyundai', 'Elantra', 2017, 'QRS-2468', 'Prata', 6),
    ('Fiat', 'Uno', 2015, 'TUV-1357', 'Vermelho', 7),
    ('Renault', 'Duster', 2018, 'IJK-3456', 'Verde', 8),
    ('Nissan', 'Sentra', 2021, 'PQR-7890', 'Azul', 9),
    ('Kia', 'Sportage', 2019, 'LMN-6789', 'Branco', 10);

-- Inserts na tabela Servicos

INSERT INTO Servicos (Nome, Descricao, Preco, DataCadastro)
VALUES
    ('Troca de Óleo', 'Substituição do óleo do motor e filtro de óleo.', 100.00, '2023-09-01'),
    ('Alinhamento e Balanceamento', 'Alinhamento e balanceamento das rodas.', 80.00, '2023-09-02'),
    ('Revisão Geral', 'Revisão completa do veículo.', 250.00, '2023-09-03'),
    ('Troca de Pastilhas de Freio', 'Substituição das pastilhas de freio.', 120.00, '2023-09-04'),
    ('Troca de Bateria', 'Troca da bateria do veículo.', 150.00, '2023-09-05'),
    ('Pintura Automotiva', 'Serviço de pintura e retoques na lataria.', 300.00, '2023-09-06'),
    ('Troca de Amortecedores', 'Substituição dos amortecedores do veículo.', 200.00, '2023-09-07'),
    ('Troca de Correia Dentada', 'Troca da correia dentada e tensionadores.', 180.00, '2023-09-08'),
    ('Limpeza de Bicos Injetores', 'Limpeza dos bicos injetores do motor.', 90.00, '2023-09-09'),
    ('Reparo de Sistema de Ar Condicionado', 'Reparo e recarga do sistema de ar condicionado.', 160.00, '2023-09-10');


-- Inserts na tabela Agendamentos

INSERT INTO Agendamentos (idCliente, idVeiculo, idServico, DataAgendamento, Status)
VALUES
    (1, 1, 1, '2023-09-15 10:00:00', 'Agendado'),
    (2, 2, 2, '2023-09-16 14:30:00', 'Agendado'),
    (3, 3, 3, '2023-09-17 09:15:00', 'Agendado'),
    (4, 4, 4, '2023-09-18 11:45:00', 'Agendado'),
    (5, 5, 5, '2023-09-19 16:00:00', 'Agendado'),
    (6, 6, 6, '2023-09-20 08:30:00', 'Agendado'),
    (7, 7, 7, '2023-09-21 13:00:00', 'Agendado'),
    (8, 8, 8, '2023-09-22 15:30:00', 'Agendado'),
    (9, 9, 9, '2023-09-23 10:45:00', 'Agendado'),
    (10, 10, 10, '2023-09-24 12:15:00', 'Agendado');


-- Inserts na tabela Pagamentos

INSERT INTO Pagamentos (idCliente, Valor, DataPagamento)
VALUES
    (1, 100.00, '2023-09-15'),
    (2, 80.00, '2023-09-16'),
    (3, 250.00, '2023-09-17'),
    (4, 120.00, '2023-09-18'),
    (5, 150.00, '2023-09-19'),
    (6, 300.00, '2023-09-20'),
    (7, 200.00, '2023-09-21'),
    (8, 180.00, '2023-09-22'),
    (9, 90.00, '2023-09-23'),
    (10, 160.00, '2023-09-24');


-- Inserts na tabela HistoricoServicos

INSERT INTO HistoricoServicos (idCliente, idVeiculo, idServico, DataExecucao, Valor)
VALUES
    (1, 1, 1, '2023-09-16 10:30:00', 100.00),
    (2, 2, 2, '2023-09-17 15:00:00', 80.00),
    (3, 3, 3, '2023-09-18 11:00:00', 250.00),
    (4, 4, 4, '2023-09-19 13:45:00', 120.00),
    (5, 5, 5, '2023-09-20 16:30:00', 150.00),
    (6, 6, 6, '2023-09-21 09:15:00', 300.00),
    (7, 7, 7, '2023-09-22 14:30:00', 200.00),
    (8, 8, 8, '2023-09-23 10:00:00', 180.00),
    (9, 9, 9, '2023-09-24 12:45:00', 90.00),
    (10, 10, 10, '2023-09-25 14:15:00', 160.00);


-- Inserts na tabela Mecanicos

INSERT INTO Mecanicos (Nome, Especialidade, Telefone, Email)
VALUES
    ('José Mecânico', 'Mecânica Geral', '(11) 1111-2222', 'jose@oficinamecanica.com'),
    ('Maria Silva', 'Elétrica Automotiva', '(11) 2222-3333', 'maria@oficinamecanica.com'),
    ('Carlos Ferreira', 'Funilaria e Pintura', '(11) 3333-4444', 'carlos@oficinamecanica.com'),
    ('Ana Santos', 'Ar Condicionado', '(11) 4444-5555', 'ana@oficinamecanica.com'),
    ('Pedro Oliveira', 'Alinhamento e Balanceamento', '(11) 5555-6666', 'pedro@oficinamecanica.com'),
    ('Mariana Rodrigues', 'Motor e Transmissão', '(11) 6666-7777', 'mariana@oficinamecanica.com'),
    ('Luiz Costa', 'Suspensão e Freios', '(11) 7777-8888', 'luiz@oficinamecanica.com'),
    ('Fernanda Santos', 'Injeção Eletrônica', '(11) 8888-9999', 'fernanda@oficinamecanica.com'),
    ('Ricardo Almeida', 'Mecânica Geral', '(11) 9999-1111', 'ricardo@oficinamecanica.com'),
    ('Luisa Fernandes', 'Elétrica Automotiva', '(11) 1111-2222', 'luisa@oficinamecanica.com');


-- Inserts na tabela ServicosMecanicos

INSERT INTO ServicosMecanicos (idServico, idMecanico, DataExecucao, Valor)
VALUES
    (1, 1, '2023-09-16 11:00:00', 100.00),
    (2, 2, '2023-09-17 15:30:00', 80.00),
    (3, 3, '2023-09-18 11:30:00', 250.00),
    (4, 4, '2023-09-19 14:00:00', 120.00),
    (5, 5, '2023-09-20 16:45:00', 150.00),
    (6, 6, '2023-09-21 10:00:00', 300.00),
    (7, 7, '2023-09-22 14:45:00', 200.00),
    (8, 8, '2023-09-23 10:15:00', 180.00),
    (9, 9, '2023-09-24 13:00:00', 90.00),
    (10, 10, '2023-09-25 15:00:00', 160.00);


-- Inserts na tabela Avaliacoes

INSERT INTO Avaliacoes (idCliente, Comentario, Nota, DataAvaliacao)
VALUES
    (1, 'Ótimo serviço, recomendo!', 5, '2023-09-17'),
    (2, 'Rápido e eficiente.', 4, '2023-09-18'),
    (3, 'Serviço de qualidade.', 5, '2023-09-19'),
    (4, 'Bom atendimento, preço justo.', 4, '2023-09-20'),
    (5, 'Profissionais qualificados.', 5, '2023-09-21'),
    (6, 'Reparo perfeito, carro ficou como novo.', 5, '2023-09-22'),
    (7, 'Preço um pouco alto, mas serviço excelente.', 4, '2023-09-23'),
    (8, 'Atendimento rápido e eficaz.', 4, '2023-09-24'),
    (9, 'Recomendo a todos.', 5, '2023-09-25'),
    (10, 'Muito satisfeito com o serviço.', 5, '2023-09-26');

-- Quais os detalhes do servico agendado com ID 5?
SELECT Agendamentos.*, Clientes.Nome AS NomeCliente, Veiculos.Marca, Veiculos.Modelo, Servicos.Nome AS NomeServico
FROM Agendamentos
JOIN Clientes ON Agendamentos.idCliente = Clientes.idCliente
JOIN Veiculos ON Agendamentos.idVeiculo = Veiculos.idVeiculo
JOIN Servicos ON Agendamentos.idServico = Servicos.idServico
WHERE Agendamentos.idAgendamento = 5;

-- Quais avaliações têm notas abaixo de 8?
SELECT * FROM Avaliacoes WHERE Nota < 8;

-- Qual é o total de pagamentos feitos por cada cliente?
SELECT Pagamentos.idCliente, Nome, SUM(Valor) AS TotalPagamentos
FROM Pagamentos
JOIN Clientes ON Pagamentos.idCliente = Clientes.idCliente
GROUP BY idCliente, Nome;

-- Quais mecânicos têm a especialidade 'Mecânica Geral'?
SELECT * FROM Mecanicos WHERE Especialidade = 'Mecânica Geral';

-- Quais serviços foram agendados e ainda não foram executados?
SELECT * FROM Agendamentos WHERE Status = 'Agendado';

-- Qual é a média de avaliações por cliente que têm uma média de nota maior ou igual a 4?
SELECT idCliente, AVG(Nota) AS MediaAvaliacoes
FROM Avaliacoes
GROUP BY idCliente
HAVING AVG(Nota) >= 4;




