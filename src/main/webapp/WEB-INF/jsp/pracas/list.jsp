<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Pra�as</title>
</head>

<body>
	 <div id="content">
		 <div id="content-header">
			 <h1>Pra�as</h1>
		 </div>

		 <div id="content-container">
			<%@ include file="../_fragmentos/mostraErros.jspf" %>
			<%@ include file="../_fragmentos/sucesso.jspf" %>
			
			<div class="row">
				<div class="col-md-6">
					<a class="btn btn-app btn-inverse"
						href="<c:url value='/pracas/novo'/>"> 
						<i class="fa fa-plus-circle bigger-150 block"></i>
						Novo
					</a>
				</div>
			</div>		
					
			<jsp:include page="../_fragmentos/portletLista.jsp"><jsp:param name="iconClass" value="fa fa-tasks"/><jsp:param name="titulo" value="Pra�as"/></jsp:include>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Id</th>
								<th>Descri��o</th>
								<th>Excluir</th>
							</tr>

						</thead>
						<tbody>
							<c:forEach var="praca" items="${pracaList}">
								<tr id="praca-${praca.id}">
									<td>${praca.id}</td>
									<td><a href="<c:url value='/pracas/${praca.id}'/>" title="title">${praca.descricao}</a></td>
									<td>
										<a href="" onclick="remover(${praca.id}); return false;">
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
			 CriarPaginacao(registros,"/pracas/list",pagina);	
		});
		
		 function remover(id){
			 if (confirm('Confirma exclus�o desta Pra�a?')){	
			 	  $.get('remover?id=' + id, function(){
					   $('#praca-'+id).fadeOut('slow');
			   	  });
			 }
		  }
		</script>
	</content> 
</body>
</html>
