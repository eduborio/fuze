package br.com.weblogia.fuze.repositorios.daos;

import java.util.Date;
import java.util.List;

import br.com.weblogia.fuze.domain.Orcamento;
import br.com.weblogia.fuze.repositorios.OrcamentoRepositorio;

import javax.enterprise.context.RequestScoped;
import javax.persistence.Query;

@SuppressWarnings("unchecked")
@RequestScoped
public class OrcamentoDAO extends DAO<Orcamento> implements OrcamentoRepositorio{

    public OrcamentoDAO(){
        super(Orcamento.class);
    }

    @Override
    public List<Orcamento> buscaOrcamentoPorDescricao(String descricao) {
        StringBuilder hql = new StringBuilder();
        hql.append(" From Orcamento orcamento "); 
        hql.append(" where orcamento.descricao like :descricao "); 


        hql.append(" order by orcamento.descricao ");


        Query query = entityManager.createQuery(hql.toString());
        query.setParameter("descricao", "%" + descricao + "%");

        return query.getResultList();
    }

	@Override
	public void remover(Orcamento orcamento) {
		entityManager.remove(orcamento);
	}
	
	@Override
	public List<Orcamento> buscaPor(String agencia, Date dataInicial, Date dataFinal) {
		
		StringBuilder hql = new StringBuilder();
		
		hql.append(" From Orcamento o ");
		hql.append(" where 1 = 1  ");
		
		
		if(agencia != null){
			hql.append(" and ( o.cliente.nome like :nome ");
			hql.append(" or  o.agencia.nome like :nome) ");
		}
		
		if(dataInicial != null)
			hql.append(" and o.dataOrcamento between :dataIni and :dataFim ");
		
		hql.append(" order by o.dataOrcamento desc");
		
		Query query = getEntityManager().createQuery(hql.toString());
		
		if(agencia != null)
			query.setParameter("nome", "%"+ agencia +"%");
		
		if(dataInicial != null)
			query.setParameter("dataIni", dataInicial);
		
		if(dataFinal != null){
			query.setParameter("dataFim", dataFinal);
		}
		
		return query.getResultList();
	}

	@Override
	public Long buscaProximoId() {
		// TODO Auto-generated method stub
		return null;
	}
}
