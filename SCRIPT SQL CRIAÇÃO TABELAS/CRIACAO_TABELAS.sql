/*=================[NOME_BANCO_DE_DADOS]=================*/
CREATE DATABASE ESC_GP06;
USE ESC_GP06;


/*=================[TABELA_ALUNO]=================*/
DROP TABLE IF EXISTS ALUNO;
CREATE TABLE IF NOT EXISTS ALUNO(
    RA_ALUNO			INT     	    	NOT NULL    AUTO_INCREMENT,
    NOME_ALUNO  		VARCHAR(150) 		NOT NULL,
    SEXO 			    CHAR(1) 	    	NOT NULL,
    CONSTRAINT PK_RA_ALUNO PRIMARY KEY (RA_ALUNO),
    CONSTRAINT CK_ALUNO_SEXO CHECK (SEXO IN ('F','M'))
    );


/*=================[DISCIPLINA]=================*/
DROP TABLE IF EXISTS DISCIPLINA;
CREATE TABLE IF NOT EXISTS DISCIPLINA(
	COD_DISCIPLINA		INT		        NOT NULL AUTO_INCREMENT,
    	NOME			VARCHAR(150)		NOT NULL,
    CONSTRAINT PK_DISCIPLINA_COD_DISCIPLINA PRIMARY KEY(COD_DISCIPLINA)
);



/*=================[PROFESSOR]=================*/
DROP TABLE IF EXISTS PROFESSOR;
CREATE TABLE IF NOT EXISTS PROFESSOR(
	MATRICULA_PROF 	INT 		    	NOT NULL AUTO_INCREMENT,
    	NOME 		VARCHAR(150) 		NOT NULL,
    CONSTRAINT PK_PROFESSOR_MATRICULA_PROF PRIMARY KEY(MATRICULA_PROF)
);


/*=================[TABELA_TURMA]=================*/
DROP TABLE IF EXISTS TURMA;
CREATE TABLE IF NOT EXISTS TURMA(
	NUM_TURMA               INT	    	NOT NULL	AUTO_INCREMENT,
	DATA_INICIO             DATE		NOT NULL,
	DATA_TERMINO            DATE,
  		CONSTRAINT PK_TURMA_NUM_TURMA PRIMARY KEY(NUM_TURMA)
);



/*=================[OFERECIDA]=================*/
DROP TABLE IF EXISTS OFERECIDA;
CREATE TABLE IF NOT EXISTS OFERECIDA(
	NUM_OFERECIDA	    INT		    	NOT NULL	AUTO_INCREMENT,
	SALA		    VARCHAR(50)		NOT NULL,
    	BLOCO		    VARCHAR(50)		NOT NULL,
    	NUM_TURMA	    INT		    	NOT NULL,
    	MATRICULA_PROF	INT		    	NOT NULL,
    	COD_DISCIPLINA	INT		   	NOT NULL,
  CONSTRAINT PK_OFERECIDA_NUM_OFERECIDA PRIMARY KEY (NUM_OFERECIDA),
	CONSTRAINT FK_OFERECIDA_2_NUM_TURMA FOREIGN KEY(NUM_TURMA) REFERENCES TURMA(NUM_TURMA),
	CONSTRAINT PK_OFERECIDA_2_MATRICULA_PROF FOREIGN KEY(MATRICULA_PROF) REFERENCES PROFESSOR(MATRICULA_PROF),
	CONSTRAINT PK_OFERECIDA_2_COD_DISCIPLINA FOREIGN KEY(COD_DISCIPLINA) REFERENCES DISCIPLINA(COD_DISCIPLINA)
);



/*=================[TABELA_MATRICULA]=================*/
DROP TABLE IF EXISTS MATRICULA;
CREATE TABLE IF NOT EXISTS MATRICULA(
    NUM_MATRICULA       INT     	NOT NULL	AUTO_INCREMENT,
    DATA_MATRICULA      DATE    	NOT NULL,
    DATA_CANCELAMENTO	DATE,
    RA_ALUNO		INT		NOT NULL,
    NUM_TURMA		INT		NOT NULL,
    CONSTRAINT PK_MATRICULA_NUM_MATRICULA PRIMARY KEY(NUM_MATRICULA),
    CONSTRAINT FK_MATRICULA_2_ALUNO FOREIGN KEY (RA_ALUNO) REFERENCES ALUNO(RA_ALUNO),
	CONSTRAINT FK_MATRICULA_2_TURMAFOREIGN KEY (NUM_TURMA) REFERENCES TURMA(NUM_TURMA)
);


/*=================[E_AVALIADO]=================*/
DROP TABLE IF EXISTS E_AVALIADO;
CREATE TABLE IF NOT EXISTS E_AVALIADO(
	RA_ALUNO		INT 		NOT NULL,
    	NUM_OFERECIDA		INT 		NOT NULL,
    	A1			FLOAT 		NOT NULL,
    	A2			FLOAT 		NOT NULL,
    	AF			FLOAT,
	
    	CONSTRAINT PK_E_AVALIADO_ PRIMARY KEY (RA_ALUNO, NUM_OFERECIDA),
	CONSTRAINT FK_E_AVALIADO_2_RA_ALUNO FOREIGN KEY(RA_ALUNO) REFERENCES ALUNO(RA_ALUNO),
	CONSTRAINT PK_OFERECIDA_2_NUM_OFERECIDA FOREIGN KEY(NUM_OFERECIDA) REFERENCES OFERECIDA(NUM_OFERECIDA)
);
