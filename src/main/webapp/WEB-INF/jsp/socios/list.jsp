<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Responsáveis</title>
</head>

<body>
	 <div id="content">
		 <div id="content-header">
			 <h1>Responsáveis</h1>
		 </div>

		 <div id="content-container">
			<%@ include file="../_fragmentos/mostraErros.jspf" %>
			<%@ include file="../_fragmentos/sucesso.jspf" %>
			
			<div class="row">
				<div class="col-md-6">
					<a class="btn btn-app btn-inverse"
						href="<c:url value='/socios/novo'/>"> 
						<i class="fa fa-plus-circle bigger-150 block"></i>
						Novo
					</a>
				</div>
			</div>		
					
			<jsp:include page="../_fragmentos/portletLista.jsp"><jsp:param name="iconClass" value="fa fa-tasks"/><jsp:param name="titulo" value="Sócio"/></jsp:include>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Id</th>
								<th>Nome</th>
								<th>Excluir</th>
							</tr>

						</thead>
						<tbody>
							<c:forEach var="socio" items="${socioList}">
								<tr id="socio-${socio.id}">
									<td>${socio.id}</td>
									<td><a href="<c:url value='/socios/${socio.id}'/>" title="title">${socio.nome}</a></td>
									<td>
										<a href="" onclick="remover(${socio.id}); return false;">
											<i class="fa fa-times red bigger-120"></i>
										</a> 
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			<%@ include file="../_fragmentos/portletListaFim.jspf" %>
		</div>
	 </div>

	<content tag="local_script"> 
		<script type="text/javascript">
		$(function(){
			 var registros = "${registros}";
			 var pagina = "${pagina}"
			 CriarPaginacao(registros,"/socios/list",pagina);	
		});
		</script>
	</content> 
</body>
</html>
