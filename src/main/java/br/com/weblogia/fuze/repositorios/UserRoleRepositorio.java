package br.com.weblogia.fuze.repositorios;

import java.util.List;

import br.com.weblogia.fuze.autorizacao.UserRole;
public interface UserRoleRepositorio{
    UserRole buscaPorId(Long id);
    List<UserRole> buscaTodos(int pagina);
    List<UserRole> buscaTodos();
    Long buscaTotalDeRegistrosDaLista();
    void salva(UserRole userrole);
    void atualiza(UserRole userrole);
    List<UserRole> buscaUserRolePorNome(String nome);
}
