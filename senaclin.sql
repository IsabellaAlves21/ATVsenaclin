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
hora DATETIME NOT NULL,
tipoConsulta VARCHAR(15) NOT NULL,
CONSTRAINT PRIMARY KEY (codConsulta),
CONSTRAINT fk_paciente_consulta FOREIGN KEY (codPaciente) 
REFERENCES Paciente (codPaciente),
CONSTRAINT fk_dentista_consulta FOREIGN KEY (codDentista) 
REFERENCES Dentista (codDentista)
);