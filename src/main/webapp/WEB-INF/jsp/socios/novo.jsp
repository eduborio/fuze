<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Responsável</title>
</head>
<body>
	<div id="content">

		<div id="content-header">
			<h1>Responsável</h1>
		</div>

		<div id="content-container">

			<%@ include file="../_fragmentos/mostraErros.jspf" %>
			<%@ include file="../_fragmentos/sucesso.jspf" %>

			<form method="POST" action="<c:url value='/socios/salvar'/>">
				<jsp:include page="../_fragmentos/portlet.jsp"><jsp:param name="iconClass" value="fa fa-tasks"/></jsp:include>

 							<input type="hidden" name="socio.id" value="${socio.id}" />
						<div class="row">
							<div class="col-md-3">
								<label>Nome</label>
								<input type="text" name="socio.nome" value="${socio.nome}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<label>RG</label>
								<input type="text" name="socio.rg" value="${socio.rg}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<label>CPF</label>
								<input type="text" name="socio.cpf" value="${socio.cpf}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<label>E-mail</label>
								<input type="text" name="socio.email" value="${socio.email}" class="form-control"/>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-3">
								<label>E-mail</label>
								<input type="text" name="socio.telefone" value="${socio.telefone}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<input value="Salvar" type="submit" class="btn btn-success"	/>
								<button type="button" class="btn btn-danger" onClick="window.location.href='<c:url value='/socios/list'/>'">Voltar</button>
							</div>
						</div>

				<%@ include file="../_fragmentos/portletFim.jspf" %>
			</form>
		</div>
	</div>
</body>
</html>
