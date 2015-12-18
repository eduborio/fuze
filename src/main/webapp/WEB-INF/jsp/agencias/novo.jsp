<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Agência</title>
</head>
<body>
	<div id="content">

		<div id="content-header">
			<h1>Agência</h1>
		</div>

		<div id="content-container">

			<%@ include file="../_fragmentos/mostraErros.jspf" %>
			<%@ include file="../_fragmentos/sucesso.jspf" %>

			<form method="POST" action="<c:url value='/agencias/salvar'/>">
				<jsp:include page="../_fragmentos/portlet.jsp"><jsp:param name="iconClass" value="fa fa-tasks"/></jsp:include>

 						<input type="hidden" name="agencia.id" value="${agencia.id}" />
						
						<div class="row">
							<div class="col-md-8">
								<label>Nome</label>
								<input type="text" name="agencia.nome" value="${agencia.nome}" class="form-control"/>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-4">
								<label>Cnpj</label>
								<input type="text" name="agencia.cnpj" value="${agencia.cnpj}" class="form-control"/>
							</div>
						</div>	
						
						<div class="row">
							<div class="col-md-4">
								<label>Contato</label>
								<input type="text" name="agencia.contato" value="${agencia.contato}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<label>Telefone</label>
								<input type="text" name="agencia.telefone" value="${agencia.telefone}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-8">
								<label>Email</label>
								<input type="text" name="agencia.email" value="${agencia.email}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label>Logradouro</label>
								<input type="text" name="agencia.logradouro" value="${agencia.logradouro}" class="form-control"/>
							</div>

							<div class="col-md-2">
								<label>Numero</label>
								<input type="text" name="agencia.numero" value="${agencia.numero}" class="form-control"/>
							</div>
						</div>

						<div class="row">
							<div class="col-md-3">
								<label>Bairro</label>
								<input type="text" name="agencia.bairro" value="${agencia.bairro}" class="form-control"/>
							</div>
							<div class="col-md-3">
								<label>Cidade</label>
								<input type="text" name="agencia.cidade" value="${agencia.cidade}" class="form-control"/>
							</div>
							<div class="col-md-2">
								<label>UF</label>
								<input type="text" name="agencia.uf" value="${agencia.uf}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<label>Cep</label>
								<input type="text" name="agencia.cep" value="${agencia.cep}" class="form-control"/>
							</div>
						</div>
						<hr>
							
						<div class="row">
							<div class="col-md-4">
								<input value="Salvar" type="submit" class="btn btn-success"	/>
								<input type="button" value="Voltar" class="btn btn-danger" onClick="window.location.href='<c:url value='/agencias/list'/>'" />
							</div>
						</div>	

				<%@ include file="../_fragmentos/portletFim.jspf" %>
			</form>
	</div>
</content>
</body>
</html>
