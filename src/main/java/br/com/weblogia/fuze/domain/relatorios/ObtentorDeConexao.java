package br.com.weblogia.fuze.domain.relatorios;

import java.sql.Connection;
import java.sql.SQLException;

public interface ObtentorDeConexao {
	Connection obtemConexao() throws SQLException;

}
