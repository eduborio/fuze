package br.com.weblogia.fuze.repositorios;

import java.util.List;
import br.com.weblogia.fuze.domain.Praca;
public interface PracaRepositorio{
    Praca buscaPorId(Long id);
    List<Praca> buscaTodos(int pagina);
    List<Praca> buscaTodos();
    Long buscaTotalDeRegistrosDaLista();
    void salva(Praca praca);
    void atualiza(Praca praca);
    void remover(Praca praca);
    List<Praca> buscaPracaPorDescricao(String descricao);
}
