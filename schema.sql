-- Criar a base de dados com charset e collation definidos
CREATE DATABASE codeduck
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE codeduck;

-- Tabela de usuários
CREATE TABLE tb_Users (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    numero_telefone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de login
CREATE TABLE tb_Login (
    id_login INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    senha VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_user) REFERENCES tb_Users(id_user)
      ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela de sites
CREATE TABLE tb_Site (
    id_site INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    url VARCHAR(255),
    FOREIGN KEY (id_user) REFERENCES tb_Users(id_user)
      ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela de métodos de pagamento
CREATE TABLE tb_MetodoPagamento (
    id_metodo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Tabela de contratos
CREATE TABLE tb_Contratos (
    id_contratos INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    id_metodo INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    FOREIGN KEY (id_user) REFERENCES tb_Users(id_user)
      ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_metodo) REFERENCES tb_MetodoPagamento(id_metodo)
      ON DELETE SET NULL ON UPDATE CASCADE
);
