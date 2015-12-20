<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

			<form method="POST" action="<c:url value='/orcamentos/salvar'/>">
				<jsp:include page="../_fragmentos/portlet.jsp"><jsp:param name="iconClass" value="fa fa-tasks"/></jsp:include>

 							<input type="hidden" name="orcamento.id" value="${orcamento.id}" />
								<div class="row">
									<div class="col-md-3">
										<label>Data Orçamento</label>
										<input type="text" class="form-control" name="orcamento.dataOrcamento" data-behaviour="data" value="<fmt:formatDate value='${orcamento.dataOrcamento}' pattern='dd/MM/yyyy'/>" />
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-4">
										<label>Agencia</label>
										<select id="agencia-select" class="form-control" name="orcamento.agencia.id">
											<option value="${orcamento.agencia.id}" selected="selected">${orcamento.agencia.nome}</option>										
										</select>
									</div>
									<div class="col-md-4">
										<label>Cliente</label>
										<select id="cliente-select" class="form-control" name="orcamento.cliente.id">
											<option value="${orcamento.cliente.id}" selected="selected">${orcamento.cliente.nome}</option>										
										</select>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<label>Praça</label>
										<select id="praca-select" class="form-control" name="orcamento.praca.id">
											<option value="${orcamento.praca.id}" selected="selected">${orcamento.praca.descricao}</option>										
										</select>
									</div>
									
									<div class="col-md-4">
										<label>Mídias</label>
										<input type="text" name="orcamento.midias" value="${orcamento.midias}" class="form-control"/>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-4">
										<label>Periodo De Uso</label>
										<input type="text" name="orcamento.periodoDeUso" value="${orcamento.periodoDeUso}" class="form-control"/>
									</div>
									<div class="col-md-4">
										<label>A/C</label>
										<select id="contato-select" class="form-control" name="orcamento.contato.id">
											<option value="${orcamento.contato.id}" selected="selected">${orcamento.contato.nome}</option>										
										</select>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-8">
										<label>Job</label>
										<input type="text" name="orcamento.job" value="${orcamento.job}" class="form-control"/>
									</div>
								</div>
								
								<%@ include file="../_fragmentos/portletFim.jspf" %>
								
								<jsp:include page="../_fragmentos/portlet.jsp"><jsp:param name="iconClass" value="fa fa-tasks"/></jsp:include>
								
								<div class="row">
									<div class="col-md-4">
										<label>Responsável</label>
										<select id="socio-select" class="form-control" name="orcamento.socio.id">
											<option value="${orcamento.socio.id}" selected="selected">${orcamento.socio.nome}</option>										
										</select>
									</div>
									<div class="col-md-4">
										<label>Responsavel no rodapé</label>
										<select name="orcamento.socioRodape" value="${orcamento.socioRodape}" class="form-control">
											<option value="false" <c:if test="${orcamento.socioRodape == false}">selected="selected"</c:if>>Não</option>
											<option value="true" <c:if test="${orcamento.socioRodape == true}">selected="selected"</c:if>>Sim</option>
										</select>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-4">
										<label>Empresa no rodapé</label>
										<select name="orcamento.empresaRodape" value="${orcamento.empresaRodape}" class="form-control">
											<option value="false" <c:if test="${orcamento.empresaRodape == false}">selected="selected"</c:if>>Não</option>
											<option value="true" <c:if test="${orcamento.empresaRodape == true}">selected="selected"</c:if>>Sim</option>
										</select>
									</div>
									
									<div class="col-md-4">
										<label>Prazo Execução</label>
										<input type="text" name="orcamento.prazoExecucao" value="${orcamento.prazoExecucao}" class="form-control"/>
									</div>
								</div>
								<%@ include file="../_fragmentos/portletFim.jspf" %>
								
								<jsp:include page="../_fragmentos/portlet.jsp"><jsp:param name="iconClass" value="fa fa-tasks"/></jsp:include>
								
								<div class="row">
									<div class="col-md-3"> 
										<label>Tipo da Diária</label>
										<select id="tipo" class="form-control" name="orcamento.tipo">
											<c:forEach items="${tipoList}" var="tipo">
												<option value="${tipo}" <c:if test="${orcamento.tipo==tipo}">selected="selected"</c:if>>${tipo}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-md-3">
										<label>Valor da Diária</label>
										<input id="val-uni" type="text" class="form-control" name="orcamento.valorDiaria"  value="<fmt:formatNumber value='${orcamento.valorDiaria}' pattern='#,##0.00' />" readonly="readonly"/>
									</div>
								</div>		
								<div class="row">	
									<div class="col-md-3">
										<label>Diárias</label>
										<input type="text" class="form-control" name="orcamento.dias" value="${orcamento.dias}" />
									</div>
									<div class="col-md-3">
										<label>Total das Diárias</label>
										<input id="tot-dir" type="text" class="form-control"  readonly="readonly"/>
									</div>
								</div>
								
								<div class="row">	
									<div class="col-md-3">
										<label>% BV</label>
										<input type="text" data-behaviour="valor" class="form-control" name="orcamento.bv" value="<fmt:formatNumber value='${orcamento.bv}' pattern='#,##0.00'/>" />
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-3">
										<label>Acréscimo %</label>
									    <input type="text" class="form-control" data-behaviour="valor" name="orcamento.acrescimo" value="<fmt:formatNumber value='${orcamento.acrescimo}' pattern='#,##0.00'/>" />
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-3">
										<label>Desconto %</label>
									    <input type="text" class="form-control" data-behaviour="valor" name="orcamento.desconto" value="<fmt:formatNumber value='${orcamento.desconto}' pattern='#,##0.00'/>" />
									</div>
								</div>
								
								<div class="row">	
									<div class="col-md-3">
										<label>Tem NF</label>
										<select name="orcamento.temNF" value="${orcamento.temNF}" class="form-control">
											<option value="false" <c:if test="${orcamento.temNF == false}">selected="selected"</c:if>>Não</option>
											<option value="true" <c:if test="${orcamento.temNF == true}">selected="selected"</c:if>>Sim</option>
										</select>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-3">
										<label>Total</label>
									    <input id="total" type="text" class="form-control" data-behaviour="valor" name="orcamento.valor" value="<fmt:formatNumber value='${orcamento.valor}' pattern='#,##0.00'/>" />
									</div>
								</div>
								
								<%@ include file="../_fragmentos/portletFim.jspf" %>
								<jsp:include page="../_fragmentos/portlet.jsp"><jsp:param name="iconClass" value="fa fa-tasks"/></jsp:include>
						
								<div class="row">
									<div class="col-md-8">
										<label>Pedido</label>
										<textarea name="orcamento.descricao" cols="10" rows="15" class="form-control">${orcamento.descricao}</textarea>
									</div>
								</div>
								
								
								<div class="row">
									<div class="col-md-4">
										<input value="Salvar" type="submit" class="btn btn-success"	/>
										<input type="button" value="Voltar" class="btn btn-danger" onClick="window.location.href='<c:url value='/orcamentos/list'/>'" />

									</div>
								</div>

				<%@ include file="../_fragmentos/portletFim.jspf" %>
				
				<jsp:include page="../_fragmentos/portlet.jsp"><jsp:param name="iconClass" value="fa fa-tasks"/></jsp:include>
				
				<div class="row">
					<div class="col-md-12">
					<h4 class="heading">Imagens</h4>
						<div class="ui-lightbox-gallery">
							<c:forEach var="img" items="${orcamento.imgs}">
								<!--  <a target="_blank" href="<c:url value='/orcamentos/imagens/${orcamento.id}/${img}'/>">${img}</a>-->
								<a class="" target="_blank" href="<c:url value='/orcamentos/imagens/${orcamento.id}/${img}'/>" title="${img}">
									<img src="<c:url value='/orcamentos/imagens/${orcamento.id}/${img}'/>" width="125" alt="${img}">
								</a>	
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">
						<input type="button" value=" + Imagem" class="btn btn-info" onClick="this.form.action='<c:url value='/orcamentos/adicionaImagem'/>';this.form.submit()"/>
					</div>
				</div>

				<%@ include file="../_fragmentos/portletFim.jspf" %>
			</form>

		</div>
	</div>
 <content tag="local_script">
  <script src="<c:url value='/resources/canvas-theme/js/plugins/select2/js/select2.js'/>"></script>
  <script src="<c:url value='/resources/canvas-theme/js/plugins/select2/js/i18n/pt-BR.js'/>"></script>
  <script src="<c:url value='/resources/canvas-theme/js/borioselect2.js'/>"></script>
  <script src="<c:url value='/resources/canvas-theme/js/plugins/jquery.meiomask.1.1.14.js'/>"></script>
  
  <script type="text/javascript">
  $(document).ready(function() {
	  
  	$('[data-behaviour~=data]').setMask('date');
  	$('[data-behaviour~=valor]').setMask('decimal');
  	$('[data-behaviour~=integer]').setMask('integer');
  	
  	$("#agencia-select").borioSelect({
     selecao : {param1 :"nome"},
     url: "<c:url value='/orcamentos/listarAgencias.json'/>",
    }).change(function (){
    	
    	var nome = $(this).val();
    	var id = parseInt(nome);
    	
    	if( isNaN(id)){
	    	$.post("<c:url value='/agencias/salvarPeloNome'/>",{ nome: nome})
	    	.done(function( agencia ) {
	    		$("#agencia-select").empty();
	    		var option=$("<option>").attr("value",agencia.id).html(agencia.nome);
	    		$("#agencia-select").append(option);
	    		$("#agencia-select").val(agencia.id).trigger("change");
	    	  });
    	}
    });
  
  	$("#socio-select").borioSelect({
     selecao : {param1 :"nome"},
     url: "<c:url value='/orcamentos/listarSocios.json'/>",
    });
  	
  	$("#cliente-select").borioSelect({
  		selecao : {param1 :"nome"},
        url: "<c:url value='/orcamentos/listarClientes.json'/>"
    }).change(function (){
    	
    	var nome = $(this).val();
    	var id = parseInt(nome);
    	
    	if( isNaN(id)){
	    	$.post("<c:url value='/clientes/salvarPeloNome'/>",{ nome: nome})
	    	.done(function( cliente ) {
	    		$("#cliente-select").empty();
	    		var option=$("<option>").attr("value",cliente.id).html(cliente.nome);
	    		$("#cliente-select").append(option);
	    		$("#cliente-select").val(cliente.id).trigger("change");
	    	  });
    	}
    });
  	
  	$("#contato-select").borioSelect({
  		selecao : {param1 :"nome"},
        url: "<c:url value='/orcamentos/listarContatos.json'/>"
    }).change(function (){
    	
    	var nome = $(this).val();
    	var id = parseInt(nome);
    	
    	if( isNaN(id)){
	    	$.post("<c:url value='/contatos/salvarPeloNome'/>",{ nome: nome})
	    	.done(function( contato ) {
	    		$("#contato-select").empty();
	    		var option=$("<option>").attr("value",contato.id).html(contato.nome);
	    		$("#contato-select").append(option);
	    		$("#contato-select").val(contato.id).trigger("change");
	    	  });
    	}
    });
  	
  	$("#praca-select").borioSelect({
  	     selecao : {param1 :"descricao"},
  	     url: "<c:url value='/orcamentos/listarPracas.json'/>",
  	    }).change(function (){
  	    	
  	    	var nome = $(this).val();
  	    	var id = parseInt(nome);
  	    	
  	    	if( isNaN(id)){
  		    	$.post("<c:url value='/pracas/salvarPeloNome'/>",{ nome: nome})
  		    	.done(function( praca ) {
  		    		$("#praca-select").empty();
  		    		var option=$("<option>").attr("value",praca.id).html(praca.descricao);
  		    		$("#praca-select").append(option);
  		    		$("#praca-select").val(praca.id).trigger("change");
  		    	  }).fail( function( praca ) { alert(praca)});
  	    	}
  	    });
  
  	
 });
</script>
</content>
</body>
</html>
