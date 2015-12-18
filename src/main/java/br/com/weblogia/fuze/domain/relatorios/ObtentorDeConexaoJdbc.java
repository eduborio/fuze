package br.com.weblogia.fuze.domain.relatorios;

import java.sql.Connection;
import java.sql.SQLException;

import javax.enterprise.context.RequestScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.hibernate.engine.jdbc.connections.spi.ConnectionProvider;
import org.hibernate.engine.spi.SessionFactoryImplementor;


@RequestScoped
public class ObtentorDeConexaoJdbc implements ObtentorDeConexao {

	@PersistenceContext
	private EntityManager entityManager;

	public Connection obtemConexao() throws SQLException {
		Session session = this.getEntityManager().unwrap(Session.class);
		SessionFactoryImplementor sfi = (SessionFactoryImplementor) session.getSessionFactory();
		@SuppressWarnings("deprecation")
		ConnectionProvider cp = sfi.getConnectionProvider();
	   
	   return cp.getConnection();
	}

	public EntityManager getEntityManager() {
		return this.entityManager;
	}

	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

}
