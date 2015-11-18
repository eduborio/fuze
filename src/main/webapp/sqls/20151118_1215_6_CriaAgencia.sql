create table fuze.agencias(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(65) NOT NULL,
  contato VARCHAR(45) DEFAULT NULL,
  telefone VARCHAR(45) DEFAULT NULL,
  email VARCHAR(45) DEFAULT NULL,
  logradouro VARCHAR(45) DEFAULT NULL,
  numero VARCHAR(45) DEFAULT NULL,
  bairro VARCHAR(45) DEFAULT NULL,
  cidade VARCHAR(45) DEFAULT NULL,
  uf VARCHAR(45) DEFAULT NULL,
  cep VARCHAR(45) DEFAULT NULL,
  cnpj VARCHAR(45) DEFAULT NULL,
  primary key (id)
)ENGINE=InnoDB CHARSET=latin1;