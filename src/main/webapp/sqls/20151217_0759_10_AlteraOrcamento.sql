ALTER TABLE fuze.orcamentos 
ADD COLUMN acrescimo DECIMAL(5,2) NULL DEFAULT 0 AFTER valorDiaria,
ADD COLUMN desconto DECIMAL(5,2) NULL DEFAULT 0 AFTER acrescimo,
ADD COLUMN praca_id INT UNSIGNED NULL AFTER desconto,
ADD INDEX fk_orc_praca_idx (praca_id ASC);
ALTER TABLE fuze.orcamentos 
ADD CONSTRAINT fk_orc_praca
  FOREIGN KEY (praca_id)
  REFERENCES fuze.pracas (id)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;
