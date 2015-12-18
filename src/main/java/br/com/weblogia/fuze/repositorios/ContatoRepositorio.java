package br.com.weblogia.fuze.repositorios;

import java.util.List;
import br.com.weblogia.fuze.controllers.Contato;
public interface ContatoRepositorio{
    Contato buscaPorId(Long id);
    List<Contato> buscaTodos(int pagina);
    List<Contato> buscaTodos();
    Long buscaTotalDeRegistrosDaLista();
    void salva(Contato contato);
    void atualiza(Contato contato);
    List<Contato> buscaContatoPorNome(String nome);
}
