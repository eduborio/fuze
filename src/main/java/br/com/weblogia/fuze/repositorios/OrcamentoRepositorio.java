package br.com.weblogia.fuze.repositorios;

import java.util.Date;
import java.util.List;

import br.com.weblogia.fuze.domain.Orcamento;
public interface OrcamentoRepositorio{
    Orcamento buscaPorId(Long id);
    List<Orcamento> buscaTodos(int pagina);
    List<Orcamento> buscaTodos();
    Long buscaTotalDeRegistrosDaLista();
    void salva(Orcamento orcamento);
    void atualiza(Orcamento orcamento);
    void remover(Orcamento orcamento);
    List<Orcamento> buscaOrcamentoPorDescricao(String descricao);
	List<Orcamento> buscaPor(String agencia, Date dataInicial, Date dataFinal,String status);
	Long buscaProximoId();
}
