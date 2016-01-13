<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Orçamentos</title>
</head>

<body>
	 <div id="content">
		 <div id="content-header">
			 <h1>Orçamentos</h1>
		 </div>

		 <div id="content-container">
			<%@ include file="../_fragmentos/mostraErros.jspf" %>
			<%@ include file="../_fragmentos/sucesso.jspf" %>
			
			<div class="row">
				<div class="col-md-6">
					<a class="btn btn-app btn-inverse"
						href="<c:url value='/orcamentos/novo'/>"> 
						<i class="fa fa-plus-circle bigger-150 block"></i>
						Novo
					</a>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-10">
				<form action="<c:url value='/orcamentos/pesquisar'/>">
					<div class="row">
				    	<div class="col-md-2">
			         		<input type="text" placeholder="Numero" class="form-control" name="numero">
			         	</div>
				    </div>
				    
				    <div class="row">
				    	<div class="col-md-4">
				   			<input id="cli-nome" type="text"  placeholder="Agencia/Cliente" name="agencia" class="form-control">
				   		</div>
				    </div>
				    <!-- 
				    <div class="row">
				    	<div class="col-md-4">
				  	 	    <label>Cliente</label>
				   			<input id="cli-nome" type="text" name="cliente" class="form-control">
				   		</div>
				    </div>
				     -->
				    
				    <div class="row">
				       <div class="col-md-2">
				   			<input id="data-ini" type="text" placeholder="Data Inicial" class="form-control" name="dataInicial">
				   		</div>
				   		<div class="col-md-2">
				   			<input id="data-fim" type="text" placeholder="Data Final" class="form-control" name="dataFinal">
				   		</div>
				   		<div class="col-md-1">	
				   			<label>&nbsp;</label>
							<button type="submit" class="btn btn-success"><i class="fa fa-search"></i></button>
						</div>	
				   	</div>
				   	<br>
				   	<!-- 
					<div class="row">
						<div class="col-md-1">
							<input type="button" class="btn btn-inverse" value="Limpar Filtro" onClick="window.location.href='<c:url value='/orcamentos/list'/>'">
						</div>
					</div>	
				   	 -->
				</form>
				</div>
			</div>		
					
			<jsp:include page="../_fragmentos/portletLista.jsp"><jsp:param name="iconClass" value="fa fa-tasks"/><jsp:param name="titulo" value="Orçamentos"/></jsp:include>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Id</th>
								<th>Agencia</th>
								<th>Cliente</th>
								<th>Job</th>
								<th>Valor</th>
								<th>Status</th>
								<th>Icon</th>
								<th>Ações</th>
								<th>Excluir</th>
								<th>Responsável</th>
							</tr>

						</thead>
						<tbody>
							<c:forEach var="orcamento" items="${orcamentoList}">
								<tr id="orcamento-${orcamento.id}">
									<td>${orcamento.id}</td>
									<td><a href="<c:url value='/orcamentos/${orcamento.id}'/>" title="title">${orcamento.nomeAgencia}</a></td>
									<td><a href="<c:url value='/orcamentos/${orcamento.id}'/>" title="title">${orcamento.nomeCliente}</a></td>
									<td><a href="<c:url value='/orcamentos/${orcamento.id}'/>" title="title">${orcamento.job}</a></td>
									<td><a href="<c:url value='/orcamentos/${orcamento.id}'/>" title="title"><fmt:formatNumber value="${orcamento.valor}" pattern="#,##0.00" /></a></td>
									<td>${orcamento.status}</td>
									<td>
										<a href="">
											<i class="fa ${orcamento.icone} ${orcamento.cor} bigger-200"></i>
										</a> 
									</td>
									<td>
										<div class="btn-group">
											<button class="btn btn-info dropdown-toggle" data-toggle="dropdown">
											    Selecione
    											<span class="caret"></span>
 	 										</button>
											<ul class="dropdown-menu pull-right" role="menu">
											   <li><a tabindex="-1" target="_blank" href="<c:url value='/orcamentos/imprimir/${orcamento.id}'/>">Imprimir</a></li>
											   <li><a tabindex="-1" target="_blank" href="<c:url value='/orcamentos/download/${orcamento.id}'/>">Download</a></li>
											   <li><a tabindex="-1" href="<c:url value='/orcamentos/duplicar/${orcamento.id}'/>">Duplicar</a></li>
											   <li><a tabindex="-1" href="<c:url value='/orcamentos/selecionaEmail/${orcamento.id}'/>">Email</a></li>
											   <li><a tabindex="-1" href="<c:url value='/orcamentos/aprovar/${orcamento.id}'/>">Aprovar</a></li>
										   </ul>
										</div>
									</td>
									
									<td>
										<a href="" onclick="remover(${orcamento.id}); return false;">
											<i class="fa fa-times red bigger-120"></i>
										</a> 
									</td>
									<td><a href="<c:url value='/orcamentos/${orcamento.id}'/>" title="title">${orcamento.nomeSocio}</a></td>
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
			 CriarPaginacao(registros,"/orcamentos/list",pagina);	
		});
		
		 function remover(id){
			 if (confirm('Confirma exclusão deste Orçamento?')){	
			 	  $.get('remover?id=' + id, function(){
					   $('#orcamento-'+id).fadeOut('slow');
			   	  });
			 }
		  }
		</script>
	</content> 
</body>
</html>
