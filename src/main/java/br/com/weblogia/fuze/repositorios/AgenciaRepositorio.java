package br.com.weblogia.fuze.repositorios;

import java.util.List;
import br.com.weblogia.fuze.domain.Agencia;
public interface AgenciaRepositorio{
    Agencia buscaPorId(Long id);
    List<Agencia> buscaTodos(int pagina);
    List<Agencia> buscaTodos();
    Long buscaTotalDeRegistrosDaLista();
    void salva(Agencia agencia);
    void atualiza(Agencia agencia);
    void remover(Agencia agencia);
    List<Agencia> buscaAgenciaPorNome(String nome);
}
