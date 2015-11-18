package br.com.weblogia.fuze.repositorios;

import java.util.List;

import br.com.weblogia.fuze.autorizacao.Usuario;
public interface UsuarioRepositorio{
    Usuario buscaPorId(Long id);
    List<Usuario> buscaTodos(int pagina);
    List<Usuario> buscaTodos();
    Long buscaTotalDeRegistrosDaLista();
    void salva(Usuario usuario);
    void atualiza(Usuario usuario);
    Usuario buscaUsuarioPorLogin(String login);
    List<Usuario> buscaUsuarioPorNome(String nome);
}
