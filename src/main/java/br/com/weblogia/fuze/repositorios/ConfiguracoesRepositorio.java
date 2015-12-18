package br.com.weblogia.fuze.repositorios;

import java.util.List;
import br.com.weblogia.fuze.domain.Configuracoes;
public interface ConfiguracoesRepositorio{
    Configuracoes buscaPorId(Long id);
    List<Configuracoes> buscaTodos(int pagina);
    List<Configuracoes> buscaTodos();
    Long buscaTotalDeRegistrosDaLista();
    void salva(Configuracoes configuracoes);
    void atualiza(Configuracoes configuracoes);
}
