CREATE TABLE Paciente (
codPaciente INT AUTO_INCREMENT NOT NULL, 
nome VARCHAR(50) NOT NULL,
telefone CHAR(11) NOT NULL,
cpf CHAR(11) NOT NULL,
tipoLogradouro VARCHAR(15),
nomeLogradouro VARCHAR(50) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(10) DEFAULT 'não existe',
CONSTRAINT PRIMARY KEY (codPaciente),
CONSTRAINT CHECK (tipoLogradouro='Praça' OR tipoLogradouro='Rua' OR tipoLogradouro='Avenida' OR tipoLogradouro='Rodovia' OR tipoLogradouro='Viela')
);


ALTER TABLE Paciente
DROP COLUMN tipologradouro;

ALTER TABLE Paciente
ADD tipologradouro VARCHAR(15) NOT NULL;


SELECT * FROM paciente 

CREATE TABLE Dentista (
codDentista INT AUTO_INCREMENT NOT NULL, 
nome VARCHAR(50) NOT NULL,
cro CHAR(8) NOT NULL,
especialidade VARCHAR(100) NOT NULL,
telefone CHAR(11) NOT NULL,
CONSTRAINT PRIMARY KEY (codDentista)
);

ALTER TABLE Dentista
ADD celular CHAR(9);


CREATE TABLE Consulta (
codConsulta INT AUTO_INCREMENT NOT NULL, 
datahora DATETIME NOT NULL,
tipoConsulta VARCHAR(15) NOT NULL,
codPaciente INT NOT NULL,
codDentista INT NOT NULL,
observacao CHAR(100),
CONSTRAINT PRIMARY KEY (codConsulta),
CONSTRAINT FK_paciente_consulta FOREIGN KEY (codPaciente) REFERENCES Paciente (codPaciente),
CONSTRAINT FK_dentista_consulta FOREIGN KEY (codDentista) REFERENCES Dentista (codDentista)
);

SELECT * FROM consulta 

ALTER TABLE Dentista
ADD constraint ck_especialidade check (especialidade= 'Ortodontia' or especialidade= 'geral' or especialidade= 'Periodontia' or especialidade= 'implantodontia' or especialidade= ' ');

ALTER TABLE Consulta
ADD constraint ck_tipoConsulta check (tipoconsulta= 'avaliação' or tipoconsulta= 'Tratamento');

ALTER TABLE Paciente
ADD cidade VARCHAR(30) NOT NULL;

INSERT INTO Paciente (nome, telefone, cpf, tipologradouro, nomelogradouro, numero, complemento, cidade) 
VALUES ('Anna','11224466114', '11335566110','Rua', 'Ana Costa', '15', 'casa', 'Santos');

INSERT INTO Paciente (nome, telefone, cpf, tipologradouro, nomelogradouro, numero, complemento, cidade) 
VALUES ('Paulo','11335566114', '11225577110','Avenida', 'Coelho', '12', 'casa', 'Santos');

INSERT INTO Paciente (nome, telefone, cpf, tipologradouro, nomelogradouro, numero, complemento, cidade) 
VALUES ('Alexia','11224455334', '11005566112','Praça', 'Da Saudade', '22', 'casa', 'Santos');

INSERT INTO Paciente (nome, telefone, cpf, tipologradouro, nomelogradouro, numero, complemento, cidade) 
VALUES ('Patricia','11225566884', '11338866115','Rua', 'Alcantara', '67', 'casa', 'Guarujá');

INSERT INTO Paciente (nome, telefone, cpf, tipologradouro, nomelogradouro, numero, complemento, cidade) 
VALUES ('Felipe','22114466114', '33115566110','Praça', 'Antonio Mello', '51', 'casa', 'São Vicente');

INSERT INTO Paciente (nome, telefone, cpf, tipologradouro, nomelogradouro, numero, complemento, cidade) 
VALUES ('Fernando','11442266114', '11336655110','Avenida', 'Santo Antonio', '21', 'casa', 'São Vicente');


SELECT * FROM paciente


INSERT INTO Dentista (nome, cro, especialidade, telefone) 
VALUES ('Gabriela', '33224455', 'Ortodontia', '11223355668');

INSERT INTO Dentista (nome, cro, especialidade, telefone) 
VALUES ('Gabriel', '33556622', 'Periodontia', '11223322667');

INSERT INTO Dentista (nome, cro, especialidade, telefone) 
VALUES ('Alice', '33446677', 'Implantodontia', '11224433668');

INSERT INTO Dentista (nome, cro, especialidade, telefone) 
VALUES ('Fabiana', '33445566', 'Geral', '11334477662');

SELECT * FROM dentista


INSERT INTO Consulta (datahora, tipoconsulta, codpaciente, coddentista, observacao)
VALUES ('2024-05-23 12:00:00', 'Avaliação', 1, 1, '');

INSERT INTO Consulta (datahora, tipoconsulta, codpaciente, coddentista, observacao)
VALUES ('2024-05-24 13:00:00', 'Avaliação', 2, 4, '');

INSERT INTO Consulta (datahora, tipoconsulta, codpaciente, coddentista, observacao)
VALUES ('2024-05-25 14:00:00', 'Avaliação', 3, 4, '');



SELECT * FROM paciente;
SELECT * FROM dentista

SELECT * FROM consulta 

UPDATE dentista 
SET especialidade = 'Geral', telefone= '11223344550', celular= '123456789'
WHERE coddentista= 3;

UPDATE consulta
SET datahora = '2024-05-30 15:00:00'
WHERE codconsulta= 3;

UPDATE consulta
SET tipoconsulta= 'tratamento', observacao= 'Tratamento será realizado em 10 consultas. Prioridade: Moderada. Remédio aplicado: Ponstan, caso sinta dores'
WHERE codconsulta= 1;

SELECT nome, cidade FROM paciente
WHERE cidade='Santos'
ORDER BY nome ASC 

SELECT * FROM dentista;
SELECT * FROM paciente


SELECT dentista.nome, paciente.nome,consulta.datahora, dentista.telefone, paciente.telefone
FROM consulta
INNER JOIN paciente
ON  consulta.codDentista = consulta.codPaciente
INNER JOIN dentista
ON dentista.coddentista = paciente.codpaciente 

SELECT COUNT(codDentista) AS 'Dentistas Registrados', especialidade FROM dentista
GROUP BY especialidade









 





