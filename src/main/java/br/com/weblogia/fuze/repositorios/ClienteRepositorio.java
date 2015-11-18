package br.com.weblogia.fuze.repositorios;

import java.util.List;
import br.com.weblogia.fuze.domain.Cliente;
public interface ClienteRepositorio{
    Cliente buscaPorId(Long id);
    List<Cliente> buscaTodos(int pagina);
    List<Cliente> buscaTodos();
    Long buscaTotalDeRegistrosDaLista();
    void salva(Cliente cliente);
    void atualiza(Cliente cliente);
    List<Cliente> buscaClientePorNome(String nome);
}
