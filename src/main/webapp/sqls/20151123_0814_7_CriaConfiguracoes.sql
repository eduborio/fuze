create table fuze.configuracoes(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  diariaCwb DECIMAL(15,2) DEFAULT 0,
  diariaSp DECIMAL(15,2) DEFAULT 0,
  bv DECIMAL(15,2) DEFAULT 0,
  nf DECIMAL(15,2) DEFAULT 0,
  primary key (id)
)ENGINE=InnoDB CHARSET=latin1;