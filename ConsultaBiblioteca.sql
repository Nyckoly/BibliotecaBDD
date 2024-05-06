CREATE TABLE Usuario (
idUsuario INT AUTO_INCREMENT NOT NULL,
nome VARCHAR(50) NOT NULL,
senha CHAR(11) NOT NULL,
cpf CHAR(11) NOT NULL,
email VARCHAR(30) NOT NULL,
genero CHAR(1),
tipoLog VARCHAR(10) NOT NULL,
nomeLog VARCHAR(30) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(10) DEFAULT 'não existe', /*a plica não existe se for deixado nulo */
cep CHAR(8) NOT NULL,
cidade VARCHAR(30) NOT NULL,
estado CHAR(2) NOT NULL,
bairro VARCHAR(20) NOT NULL,
CONSTRAINT PRIMARY KEY (idUsuario));

DROP TABLE usario

CREATE TABLE ContatoTelefonico (
idContatoTelefonico INT AUTO_INCREMENT NOT NULL,
ddi VARCHAR(5) NOT NULL,
ddd CHAR(2) NOT NULL,
numero CHAR(9) NOT NULL,
idUsuario INT NOT NULL,
CONSTRAINT PRIMARY KEY (idContatoTelefonico),
CONSTRAINT FK_ContatoTelefonico_Usuario FOREIGN KEY (idUsuario) REFERENCES Usuario (idUsuario));



DROP table aluno;
DROP table professor;

DROP table recepcionista;


CREATE TABLE Aluno (
idAluno INT NOT NULL,
matricula VARCHAR(10) NOT NULL,
nivelPontualidade TINYINT(1),
CONSTRAINT PRIMARY KEY (idAluno),
CONSTRAINT FK_Aluno_Usuario FOREIGN KEY (idAluno) REFERENCES Usuario (idUsuario));

CREATE TABLE Professor (
idProfessor INT NOT NULL,
areaAtuacao VARCHAR(30) NOT NULL,
salario DECIMAL(7,2) NOT NULL,
CONSTRAINT PRIMARY KEY (idProfessor),
CONSTRAINT FK_Professor_Usuario FOREIGN KEY (idProfessor) REFERENCES Usuario (idUsuario));

CREATE TABLE Recepcionista (
idRecepcionista INT NOT NULL,
CTPS VARCHAR(30),
CONSTRAINT PRIMARY KEY (idRecepcionista),
CONSTRAINT FK_Recepcionista_Usuario FOREIGN KEY (idRecepcionista) REFERENCES usuario (idUsuario));

CREATE TABLE Emprestimo (
idEmprestimo INT AUTO_INCREMENT NOT NULL,
idUsuario INT NOT NULL,
idRecepcionista INT NOT NULL,
dataEmprestimno DATETIME NOT NULL,
dataDevolucao DATETIME NOT NULL,
dataDevolucaoEfetiva DATETIME,
multa DECIMAL (6,2),
CONSTRAINT PRIMARY KEY (idEmprestimo),
CONSTRAINT FK_Emprestimo_Recepcionista FOREIGN KEY (idRecepcionista) REFERENCES Recepcionista (idRecepcionista),
CONSTRAINT FK_Emprestimo_Usuario FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario));

CREATE TABLE Autor (
nome VARCHAR(50) NOT NULL,
nacionalidade VARCHAR(30),
idAutor INT NOT NULL AUTO_INCREMENT,
CONSTRAINT PRIMARY KEY (idAutor));
 
CREATE TABLE Editora (
nome VARCHAR(30) NOT NULL,
celular VARCHAR(14) NOT NULL,
email VARCHAR(50) NOT NULL,
responsavel VARCHAR(50) NOT NULL,
isbn CHAR(10),
idEditora INT NOT NULL AUTO_INCREMENT,
CONSTRAINT PRIMARY KEY (idEditora));

CREATE TABLE Livro (
idLivro INT AUTO_INCREMENT NOT NULL,
idEditora INT NOT NULL,
nome VARCHAR(100) NOT NULL,
tombo VARCHAR(10) NOT NULL,
genero VARCHAR(15) NOT NULL,
qtdPaginas INT,
idioma VARCHAR(20) NOT NULL,
ano INT,
edicao INT,
ISBN CHAR(13),
CONSTRAINT PRIMARY KEY (idLivro),
CONSTRAINT FK_Livro_Editora FOREIGN KEY (idEditora) REFERENCES Editora (idEditora));

CREATE TABLE LivroAutor (
idLivro INT NOT NULL,
idAutor INT NOT NULL,
CONSTRAINT PRIMARY KEY (idLivro, idAutor),
CONSTRAINT FK_LivroAutor_Livro FOREIGN KEY (idLivro) REFERENCES Livro (idLivro),
CONSTRAINT FK_LivroAutor_Autor FOREIGN KEY (idAutor) REFERENCES Autor (idAutor));

CREATE TABLE ItemEmprestimo (
idEmprestimo INT NOT NULL,
idLivro INT NOT NULL,
CONSTRAINT PRIMARY KEY (idEmprestimo, idLivro),
CONSTRAINT FK_ItemEmprestimo_Emprestimo FOREIGN KEY (idEmprestimo) REFERENCES Emprestimo (idEmprestimo),
CONSTRAINT FK_ItemEmprestimo_Livro FOREIGN KEY (idLivro) REFERENCES Livro (idLivro));