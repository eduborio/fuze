ALTER TABLE fuze.orcamentos 
ADD COLUMN contato_id INT UNSIGNED NULL AFTER praca_id,
ADD INDEX fk_orc_cont_idx (contato_id ASC);
ALTER TABLE fuze.orcamentos 
ADD CONSTRAINT fk_orc_cont
  FOREIGN KEY (contato_id)
  REFERENCES fuze.contato (id)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;
