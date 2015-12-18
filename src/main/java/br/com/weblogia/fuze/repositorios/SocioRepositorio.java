package br.com.weblogia.fuze.repositorios;

import java.util.List;
import br.com.weblogia.fuze.domain.Socio;
public interface SocioRepositorio{
    Socio buscaPorId(Long id);
    List<Socio> buscaTodos(int pagina);
    List<Socio> buscaTodos();
    Long buscaTotalDeRegistrosDaLista();
    void salva(Socio socio);
    void atualiza(Socio socio);
    List<Socio> buscaSocioPorNome(String nome);
}
