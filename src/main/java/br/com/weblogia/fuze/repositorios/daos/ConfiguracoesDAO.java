package br.com.weblogia.fuze.repositorios.daos;


import br.com.weblogia.fuze.domain.Configuracoes;
import br.com.weblogia.fuze.repositorios.ConfiguracoesRepositorio;

import javax.enterprise.context.RequestScoped;

@RequestScoped
public class ConfiguracoesDAO extends DAO<Configuracoes> implements ConfiguracoesRepositorio{

    public ConfiguracoesDAO(){
        super(Configuracoes.class);
    }

}
