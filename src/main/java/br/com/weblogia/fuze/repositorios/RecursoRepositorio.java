package br.com.weblogia.fuze.repositorios;

import java.util.List;

import br.com.weblogia.fuze.autorizacao.Recurso;

public interface RecursoRepositorio{
    Recurso buscaPorId(Long id);
    List<Recurso> buscaTodos(int pagina);
    List<Recurso> buscaTodos();
    Long buscaTotalDeRegistrosDaLista();
    void salva(Recurso recurso);
    void atualiza(Recurso recurso);
    Recurso buscaPorUrl(String url);
}
