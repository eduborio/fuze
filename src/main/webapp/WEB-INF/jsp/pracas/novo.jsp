<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Praças</title>
</head>
<body>
	<div id="content">

		<div id="content-header">
			<h1>Praças</h1>
		</div>

		<div id="content-container">

			<%@ include file="../_fragmentos/mostraErros.jspf" %>
			<%@ include file="../_fragmentos/sucesso.jspf" %>

			<form method="POST" action="<c:url value='/pracas/salvar'/>">
				<jsp:include page="../_fragmentos/portlet.jsp"><jsp:param name="iconClass" value="fa fa-tasks"/></jsp:include>

 							<input type="hidden" name="praca.id" value="${praca.id}" />
						<div class="row">
							<div class="col-md-8">
								<label>Descrição</label>
								<input type="text" name="praca.descricao" value="${praca.descricao}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<input value="Salvar" type="submit" class="btn btn-success"	/>
								<button type="button" class="btn btn-danger" onClick="window.location.href='<c:url value='/pracas/list'/>'">Voltar</button>
							</div>
						</div>

				<%@ include file="../_fragmentos/portletFim.jspf" %>
			</form>

		</div>
	</div>
</body>
</html>
