package br.com.weblogia.fuze.repositorios;

import java.util.List;
import br.com.weblogia.fuze.domain.Orcamento;
public interface OrcamentoRepositorio{
    Orcamento buscaPorId(Long id);
    List<Orcamento> buscaTodos(int pagina);
    List<Orcamento> buscaTodos();
    Long buscaTotalDeRegistrosDaLista();
    void salva(Orcamento orcamento);
    void atualiza(Orcamento orcamento);
    List<Orcamento> buscaOrcamentoPorDescricao(String descricao);
}
