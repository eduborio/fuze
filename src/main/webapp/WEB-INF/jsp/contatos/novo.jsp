<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Contatos</title>
</head>
<body>
	<div id="content">

		<div id="content-header">
			<h1>Contatos</h1>
		</div>

		<div id="content-container">

			<%@ include file="../_fragmentos/mostraErros.jspf" %>
			<%@ include file="../_fragmentos/sucesso.jspf" %>

			<form method="POST" action="<c:url value='/contatos/salvar'/>">
				<jsp:include page="../_fragmentos/portlet.jsp"><jsp:param name="iconClass" value="fa fa-tasks"/></jsp:include>

 							<input type="hidden" name="contato.id" value="${contato.id}" />
						<div class="row">
							<div class="col-md-3">
								<label>Nome</label>
								<input type="text" name="contato.nome" value="${contato.nome}" class="form-control"/>
							</div>
						</div>
					<input value="Salvar" type="submit" class="btn btn-success"	/>

				<%@ include file="../_fragmentos/portletFim.jspf" %>
			</form>

		</div>
	</div>
</body>
</html>
