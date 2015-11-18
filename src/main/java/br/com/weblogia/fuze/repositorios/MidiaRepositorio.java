package br.com.weblogia.fuze.repositorios;

import java.util.List;
import br.com.weblogia.fuze.domain.Midia;
public interface MidiaRepositorio{
    Midia buscaPorId(Long id);
    List<Midia> buscaTodos(int pagina);
    List<Midia> buscaTodos();
    Long buscaTotalDeRegistrosDaLista();
    void salva(Midia midia);
    void atualiza(Midia midia);
    List<Midia> buscaMidiaPorDescricao(String descricao);
}
