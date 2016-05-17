<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Orçamentos</title>
<style type="text/css">
.btn-overlay {
    position:absolute;
    top: 0px;
}

</style>

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
											<option value="">Selecione</option>
											<c:forEach items="${tipoList}" var="tipo">
												<option value="${tipo}" <c:if test="${orcamento.tipo==tipo}">selected="selected"</c:if>>${tipo}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-md-3">
										<label>Valor da Diária</label>
										<input id="val-uni" type="text" class="form-control" name="orcamento.valorDiaria"  value="<fmt:formatNumber value='${orcamento.valorDiaria}' pattern='#,##0.00' />" readonly="readonly" tabindex="-1"/>
									</div>
								</div>		
								<div class="row">	
									<div class="col-md-3">
										<label>Diárias</label>
										<input id="quant" type="text" class="form-control" name="orcamento.dias" value="${orcamento.dias}" />
									</div>
									<div class="col-md-3">
										<label>Total das Diárias</label>
										<input id="tot-dir" type="text" class="form-control"  readonly="readonly" tabindex="-1"/>
									</div>
								</div>
								
								<div class="row">	
									<div class="col-md-3">
										<label>% BV</label>
										<input id="bv" type="text" data-behaviour="valor" class="form-control" name="orcamento.bv" value="<fmt:formatNumber value='${orcamento.bv}' pattern='#,##0.00'/>" />
									</div>
									<div class="col-md-3">
										<label>Valor BV</label>
										<input id="tot-bv" type="text" class="form-control"  readonly="readonly" tabindex="-1"/>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-3">
										<label>Acréscimo %</label>
									    <input id="ac" type="text" class="form-control" data-behaviour="valor" name="orcamento.acrescimo" value="<fmt:formatNumber value='${orcamento.acrescimo}' pattern='#,##0.00'/>" />
									</div>
									<div class="col-md-3">
										<label>Valor Acréscimo</label>
										<input id="tot-ac" type="text" class="form-control"  readonly="readonly" tabindex="-1"/>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-3">
										<label>Desconto %</label>
									    <input id="dc" type="text" class="form-control" data-behaviour="valor" name="orcamento.desconto" value="<fmt:formatNumber value='${orcamento.desconto}' pattern='#,##0.00'/>" />
									</div>
									<div class="col-md-3">
										<label>Valor Desconto</label>
										<input id="tot-dc" type="text" class="form-control"  readonly="readonly" tabindex="-1"/>
									</div>
								</div>
								
								<div class="row">	
									<div class="col-md-3">
										<label>Tem NF</label>
										<select id="nf" name="orcamento.temNF" value="${orcamento.temNF}" class="form-control">
											<option value="false" <c:if test="${orcamento.temNF == false}">selected="selected"</c:if>>Não</option>
											<option value="true" <c:if test="${orcamento.temNF == true}">selected="selected"</c:if>>Sim</option>
										</select>
									</div>
									<div class="col-md-3">
										<label>Valor NF</label>
										<input id="tot-nf" type="text" class="form-control"  readonly="readonly" tabindex="-1"/>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-3">
										<label>Total</label>
									    <input id="total" type="text" class="form-control" name="orcamento.valor" value="<fmt:formatNumber value='${orcamento.valor}' pattern='#,##0.00'/>" />
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
										<input value="Salvar" type="button" class="btn btn-success" onClick="this.form.submit();"	/>
										<c:if test="${orcamento.id != null}">
											<input type="button" value="Imprimir" class="btn btn-info" onClick="window.location.href='<c:url value='/orcamentos/imprimir/${orcamento.id}'/>'" />
											<input type="button" value="Download" class="btn btn-info" onClick="window.location.href='<c:url value='/orcamentos/download/${orcamento.id}'/>'" />
											<input type="button" value="Aprovar" class="btn btn-info" onClick="window.location.href='<c:url value='/orcamentos/aprovar/${orcamento.id}'/>'" />
										</c:if>
										<input type="button" value="Voltar" class="btn btn-danger" onClick="window.location.href='<c:url value='/orcamentos/list'/>'" />

									</div>
								</div>

				<%@ include file="../_fragmentos/portletFim.jspf" %>
				
				<jsp:include page="../_fragmentos/portlet.jsp"><jsp:param name="iconClass" value="fa fa-tasks"/></jsp:include>
				
				<div class="row">
					<h4 class="heading">Imagens</h4>
					<div class="ui-lightbox-gallery">
						<c:forEach var="img" items="${orcamento.imgs}" varStatus="loop">
							<div id="img-${loop.index}" class="col-md-1"> 
								<a class="" target="_blank" href="<c:url value='/orcamentos/imagens/${orcamento.id}/${img}'/>" title="${img}">
									<img src="<c:url value='/orcamentos/imagens/${orcamento.id}/${img}'/>" width="125" alt="${img}">
								</a>
								<button class="btn btn-danger smaller-50 btn-overlay" onclick="removerImagem(${orcamento.id},'${img}',${loop.index}); return false;"><i class="fa fa-times"></i></button>
							</div>
							</c:forEach>
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
  	
  	
  	$("#tipo").on("change",function (){
  		
  		var tipo = $(this).val();
  		$.post("<c:url value='/config/diaria'/>", { tipo: tipo})
  		.done(function(valor){
  			$("#val-uni").val(valor);
  		});
  		
  	});
  	
   $("#nf").on("change",function ( event, loading){
  		
  		var temNF = $(this).val();
  		$.post("<c:url value='/config/temNF'/>", { temNF: temNF})
  		.done(function(percNF){
  			calculaDiarias();
  	  		calculaBV();
  	  		calculaAC();
  	  		calculaDC();
  	  	    var diarias = parseFloat($("#tot-dir").val());
  		    var bv = parseFloat($("#tot-bv").val());
  		    var ac = parseFloat($("#tot-ac").val());
  		    var dc = parseFloat($("#tot-dc").val());
  		  
  		  if(isNaN(diarias))
  			  diarias = 0;
  		  
  		  if(isNaN(bv))
  			  bv = 0;
  		  
  		  if(isNaN(ac))
  			  ac = 0;
  		  
  		  if(isNaN(dc))
  			  dc = 0;
  		  
  		  var total = diarias + bv + ac - dc;
  		  percNF = (percNF/100);
  		  $("#tot-nf").val(total * percNF);
  		  console.log(loading)
  	  	  calculaTotalGeral(loading)
  		});
  		
  	}); 
   
   $("#nf").on("blur",function (){
	   $(this).trigger("change");
   });
  	
  	$("#quant").on("blur",function (){
  		calculaDiarias();
  		calculaTotalGeral()
  	});
  	
  	$("#bv").on("blur",function (){
  		calculaDiarias();
  		calculaBV();
  		calculaTotalGeral()
  	});
  	
  	$("#ac").on("blur",function (){
  		calculaDiarias();
  		calculaBV();
  		calculaAC();
  		calculaTotalGeral()
  	});
  	
  	$("#dc").on("blur",function (){
  		calculaDiarias();
  		calculaBV();
  		calculaAC();
  		calculaDC();
  		calculaTotalGeral()
  	});
  	
  	/*
  	$("#nf").on("blur",function (){
  		calculaDiarias();
  		calculaBV();
  		calculaAC();
  		calculaDC();
  		calculaNF();
  		calculaTotalGeral()
  	});*/
  	$("#tipo").trigger("change");
  	$("#quant").trigger("blur");
  	$("#bv").trigger("blur");
  	$("#ac").trigger("blur");
  	$("#total").val("${orcamento.valor}");
  	$("#dc").trigger("blur");
  	$("#nf").trigger("change",[true ]);
  	$("#total").val("${orcamento.valor}");
  	console.log("On load carrega:" +"${orcamento.valor}" );
  	
 });
  
  function calculaTotalGeral(loading){
	  var diarias = parseFloat($("#tot-dir").val());
	  var bv = parseFloat($("#tot-bv").val());
	  var ac = parseFloat($("#tot-ac").val());
	  var dc = parseFloat($("#tot-dc").val());
	  var nf = parseFloat($("#tot-nf").val());
	  
	  if(isNaN(diarias))
		  diarias = 0;
	  
	  if(isNaN(bv))
		  bv = 0;
	  
	  if(isNaN(ac))
		  ac = 0;
	  
	  if(isNaN(dc))
		  dc = 0;
	  
	  if(isNaN(nf))
		  nf = 0;
	  
	  var total = (diarias + bv + ac - dc) + nf;
	  var totbd =  parseFloat("${orcamento.valor}");
	  
	  if(loading == true){
		  $("#total").val(formata(totbd,2));
	  }else{
		  $("#total").val(formata(total,2));
	  }
  }
  
  
  function calculaDiarias(){
	 var valor = $("#val-uni").val();
	 var quantidade = $("#quant").val();
	 valor = valor.replace(".","");
	 valor = valor.replace(",",".");
	 valor = parseFloat(valor);
	 
	 var total = valor * quantidade;
	 $("#tot-dir").val(total);
  }
  
  function calculaBV(){
	  
	 var bv = $("#bv").val();
	 bv = bv.replace(",",".")
	 bv = parseFloat(bv)
	 bv = (bv/100);
	 	 
	 total = parseFloat($("#tot-dir").val());
	 if(isNaN(total))
		 total = 0;
	 
	 if( bv > 0)
		 $("#tot-bv").val(total * bv);
	 
  }
  
  function calculaAC(){
	  
		 var ac = $("#ac").val();
		 ac = ac.replace(",",".")
		 ac = parseFloat(ac)
		 ac = (ac/100);
		 	 
		 diarias = parseFloat($("#tot-dir").val());
		 bv = parseFloat($("#tot-bv").val());
		 
		 if(isNaN(diarias))
			 diarias = 0;
		 
		 if(isNaN(bv))
			 bv = 0;
		 
		 if(isNaN(ac))
			 ac = 0;
		 
		 var total = diarias + bv;
		 
		 $("#tot-ac").val(total * ac);
		 
  }
  
  function calculaDC(){
		 var dc = $("#dc").val();
		 dc = dc.replace(",",".")
		 dc = parseFloat(dc)
		 dc = (dc/100);
		 	 
		 var diarias = parseFloat($("#tot-dir").val());
		 var bv = parseFloat($("#tot-bv").val());
		 var ac = parseFloat($("#tot-ac").val());
		 
		 if(isNaN(diarias))
			 diarias = 0;
		 
		 if(isNaN(bv))
			 bv = 0;
		 
		 if(isNaN(ac))
			 ac = 0;
		 
		 var total = diarias + bv + ac;
		 if( dc > 0)
			 $("#tot-dc").val(total * dc);
  }
  
  function formata(x,casasDecimais) {
		x = x.toFixed(casasDecimais).toString().replace(".",",");
	    return x.replace(/\B(?=(\d{casasDecimais})+(?!\d))/g, ".");
	}
  
  function removerImagem(id,fileName,index){
		if (confirm('Confirma exclusão?')){
		   $.get('removerImagem?id=' + id+'&fileName='+fileName, function(){
			   console.log(fileName);
			   $('#img-'+index).fadeOut('slow');
		   });
		}
	   }
  
  function getMoney( str )
  {
          return parseInt( str.replace(/[\D]+/g,'') );
  }
  
  
  
  
</script>
</content>
</body>
</html>
