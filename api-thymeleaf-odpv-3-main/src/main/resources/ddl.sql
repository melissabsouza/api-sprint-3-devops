-- Criação do Banco no ORACLE

CREATE TABLE T_CHALLENGE_USUARIO (
                                     id_usuario INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                                     email_usuario VARCHAR(100) UNIQUE NOT NULL,
                                     senha_usuario VARCHAR(100) NOT NULL,
                                     status_usuario VARCHAR(100) NOT NULL
);

CREATE TABLE T_CHALLENGE_ENDERECO (
                                      id_endereco INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                                      rua_endereco VARCHAR(100) NOT NULL,
                                      numero_endereco INTEGER NOT NULL,
                                      complemento_endereco VARCHAR(100),
                                      bairro_endereco VARCHAR(100) NOT NULL,
                                      cidade_endereco VARCHAR(100) NOT NULL,
                                      estado_endereco VARCHAR(100) NOT NULL,
                                      cep VARCHAR(100) NOT NULL
);

CREATE TABLE T_CHALLENGE_TELEFONE (
                                      id_telefone INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                                      numero_telefone VARCHAR(15) NOT NULL,
                                      tipo_telefone VARCHAR(50)
);

CREATE TABLE T_CHALLENGE_CLINICA (
                                     cnpj_clinica VARCHAR(25) PRIMARY KEY,
                                     nome_clinica VARCHAR(100) NOT NULL,
                                     id_usuario INTEGER,
                                     id_endereco INTEGER,
                                     id_telefone INTEGER,
                                     FOREIGN KEY (id_usuario) REFERENCES T_CHALLENGE_USUARIO(id_usuario),
                                     FOREIGN KEY (id_endereco) REFERENCES T_CHALLENGE_ENDERECO(id_endereco),
                                     FOREIGN KEY (id_telefone) REFERENCES T_CHALLENGE_TELEFONE(id_telefone)

);

CREATE TABLE T_CHALLENGE_PACIENTE (
                                      cpf_paciente VARCHAR(25) PRIMARY KEY,
                                      nome_paciente VARCHAR(100) NOT NULL,
                                      data_nascimento DATE NOT NULL,
                                      genero_paciente VARCHAR(50) NOT NULL,
                                      cnpj_clinica VARCHAR(25),
                                      id_endereco INTEGER,
                                      id_telefone INTEGER,
                                      FOREIGN KEY (id_endereco) REFERENCES T_CHALLENGE_ENDERECO(id_endereco),
                                      FOREIGN KEY (cnpj_clinica) REFERENCES T_CHALLENGE_CLINICA(cnpj_clinica),
                                      FOREIGN KEY (id_telefone) REFERENCES T_CHALLENGE_TELEFONE(id_telefone)

);

CREATE TABLE T_CHALLENGE_DENTISTA (
                                      cpf_dentista VARCHAR(25) PRIMARY KEY,
                                      nome_dentista VARCHAR(100) NOT NULL,
                                      cro_dentista VARCHAR(50) UNIQUE NOT NULL,
                                      especialidade VARCHAR(100),
                                      email_dentista VARCHAR(100) UNIQUE NOT NULL,
                                      data_contratacao DATE NOT NULL,
                                      cnpj_clinica VARCHAR(25),
                                      id_endereco INTEGER,
                                      id_telefone INTEGER,
                                      FOREIGN KEY (id_telefone) REFERENCES T_CHALLENGE_TELEFONE(id_telefone),
                                      FOREIGN KEY (id_endereco) REFERENCES T_CHALLENGE_ENDERECO(id_endereco),
                                      FOREIGN KEY (cnpj_clinica) REFERENCES T_CHALLENGE_CLINICA(cnpj_clinica)
);

CREATE TABLE T_CHALLENGE_ATENDIMENTO (
                                         id_atendimento INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                                         tipo_procedimento VARCHAR(150) NOT NULL,
                                         descricao_atendimento VARCHAR(360),
                                         data_atendimento DATE NOT NULL,
                                         custo_estimado FLOAT NOT NULL,
                                         cpf_paciente VARCHAR(25),
                                         cpf_dentista VARCHAR(25),
                                         FOREIGN KEY (cpf_paciente) REFERENCES T_CHALLENGE_PACIENTE(cpf_paciente),
                                         FOREIGN KEY (cpf_dentista) REFERENCES T_CHALLENGE_DENTISTA(cpf_dentista)
);

-- drop table T_CHALLENGE_ATENDIMENTO;
-- drop table T_CHALLENGE_DENTISTA;
-- drop table T_CHALLENGE_PACIENTE;
-- drop table T_CHALLENGE_CLINICA;
-- drop table T_CHALLENGE_TELEFONE;
-- drop table T_CHALLENGE_ENDERECO;
-- drop table T_CHALLENGE_USUARIO;


-- SELECT * FROM T_CHALLENGE_ATENDIMENTO;
-- SELECT * FROM T_CHALLENGE_DENTISTA;
-- SELECT * FROM T_CHALLENGE_PACIENTE;
-- SELECT * FROM T_CHALLENGE_CLINICA;
-- SELECT * FROM T_CHALLENGE_TELEFONE;
-- SELECT * FROM T_CHALLENGE_ENDERECO;
-- SELECT * FROM T_CHALLENGE_USUARIO;