package br.com.weblogia.fuze.repositorios;

import java.util.List;

import br.com.weblogia.fuze.autorizacao.PermissaoDeAcesso;
import br.com.weblogia.fuze.autorizacao.Recurso;
import br.com.weblogia.fuze.autorizacao.UserRole;
public interface PermissaoDeAcessoRepositorio{
    PermissaoDeAcesso buscaPorId(Long id);
    List<PermissaoDeAcesso> buscaTodos(int pagina);
    List<PermissaoDeAcesso> buscaTodos();
    Long buscaTotalDeRegistrosDaLista();
    void salva(PermissaoDeAcesso permissaodeacesso);
    void atualiza(PermissaoDeAcesso permissaodeacesso);
    PermissaoDeAcesso buscaPorRoleERecurso(UserRole role, Recurso recurso);
}
