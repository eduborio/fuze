package br.com.weblogia.fuze.autorizacao;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.com.caelum.vraptor.Accepts;
import br.com.caelum.vraptor.AroundCall;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.controller.ControllerMethod;
import br.com.caelum.vraptor.interceptor.SimpleInterceptorStack;
import br.com.weblogia.fuze.anotacoes.NaoPrecisaAutorizacao;


//@Intercepts
@RequestScoped
public class AutorizacaoInterceptor {
	private static final Logger LOGGER = LoggerFactory.getLogger(AutorizacaoInterceptor.class);
	
	private Autorizador autorizador;
	private Autorizavel autorizavel;
	private Result result;
	private HttpServletRequest request;

	private Usuario usuario;

	/**
	 * @deprecated cdi eyes only
	 */
	@Deprecated
	protected AutorizacaoInterceptor() {

	}

	@Inject
	public AutorizacaoInterceptor(Autorizador autorizador,Autorizavel autorizavel, Result result, HttpServletRequest request,Usuario usuario) {
		this.autorizador = autorizador;
		this.autorizavel = autorizavel;
		this.result = result;
		this.request = request;
		this.usuario = usuario;
	}

	@Accepts
	public boolean accepts(ControllerMethod method) {
		return !(method.getMethod().isAnnotationPresent(NaoPrecisaAutorizacao.class) || isAnnotationPresent(method.getController().getType()));
	}

	@AroundCall
	public void intercept(SimpleInterceptorStack stack) {
		
		Autorizavel autorizavel = this.autorizavel;
		
		if (autorizavel == null) {
			LOGGER.error("Usuario nao encontraodo");
			throw new IllegalStateException("Sem usuario pra autenticar");
		}else if (! autorizavel.isLogado()){
			autorizavel.setLastUrlAttempt(getCurrentURL());
			result.include("usuario",usuario);
			result.redirectTo("/login/login");
		} else if (isAllowed(autorizavel)) {
			result.include("usuario",usuario);
			stack.next();
		} else {
			result.include("usuario",usuario);
			result.redirectTo("/login/negado");
		}
	}

	private boolean isAllowed(Autorizavel autorizavel) {
		String currentURL = getCurrentURL();
		
		if(autorizavel.getRole().getNome().equals("SuperUsuario"))
			return true;
		
		if (autorizador.temPermicao(autorizavel.getRole(), currentURL)) {
			return true;
		}
		return false;
	}

	private String getCurrentURL() {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		return requestURI.replaceFirst(contextPath, "");
	}

	private boolean isAnnotationPresent(Class<?> type) {
		return type.isAnnotationPresent(NaoPrecisaAutorizacao.class) || (!type.equals(Object.class) && isAnnotationPresent(type.getSuperclass()));
	}

}
