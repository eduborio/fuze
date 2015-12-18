<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Cliente</title>
</head>
<body>
	<div id="content">

		<div id="content-header">
			<h1>Cliente</h1>
		</div>

		<div id="content-container">

			<%@ include file="../_fragmentos/mostraErros.jspf" %>
			<%@ include file="../_fragmentos/sucesso.jspf" %>

			<form method="POST" action="<c:url value='/clientes/salvar'/>">
				<jsp:include page="../_fragmentos/portlet.jsp"><jsp:param name="iconClass" value="fa fa-tasks"/></jsp:include>

 							<input type="hidden" name="cliente.id" value="${cliente.id}" />
						<div class="row">
							<div class="col-md-8">
								<label>Nome</label>
								<input type="text" name="cliente.nome" value="${cliente.nome}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<label>Contato</label>
								<input type="text" name="cliente.contato" value="${cliente.contato}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<label>Telefone</label>
								<input type="text" name="cliente.telefone" value="${cliente.telefone}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-8">
								<label>Email</label>
								<input type="text" name="cliente.email" value="${cliente.email}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label>Logradouro</label>
								<input type="text" name="cliente.logradouro" value="${cliente.logradouro}" class="form-control"/>
							</div>
							<div class="col-md-2">
								<label>Numero</label>
								<input type="text" name="cliente.numero" value="${cliente.numero}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<label>Bairro</label>
								<input type="text" name="cliente.bairro" value="${cliente.bairro}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label>Cidade</label>
								<input type="text" name="cliente.cidade" value="${cliente.cidade}" class="form-control"/>
							</div>
							<div class="col-md-2">
								<label>UF</label>
								<input type="text" name="cliente.uf" value="${cliente.uf}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<label>Cep</label>
								<input type="text" name="cliente.cep" value="${cliente.cep}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<label>Cnpj</label>
								<input type="text" name="cliente.cnpj" value="${cliente.cnpj}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<input value="Salvar" type="submit" class="btn btn-success"	/>
								<button type="button" class="btn btn-danger" onClick="window.location.href='<c:url value='/clientes/list'/>'">Voltar</button> 
							</div>
						</div>
					

				<%@ include file="../_fragmentos/portletFim.jspf" %>
			</form>

		</div>
	</div>
 <content tag="local_script">
  <script src="<c:url value='/resources/canvas-theme/js/plugins/select2/select2.js'/>"></script>
  <script src="<c:url value='/resources/canvas-theme/js/plugins/select2/select2_locale_pt-BR.js'/>"></script>
  <script src="<c:url value='/resources/canvas-theme/js/borioselect2.js'/>"></script>
  <script src="<c:url value='/resources/canvas-theme/js/libs/jquery-ui.min.js'/>"></script>
  <script type="text/javascript">
  $(document).ready(function() {
  	$('[data-behaviour~=datepicker]').datepicker({dateFormat: "dd/mm/yy"});
  	$('[data-behaviour~=datepicker]').setMask({mask: '39/19/9999', autoTab: false});
  	$('[data-behaviour~=valor]').setMask('decimal');
  	$('[data-behaviour~=integer]').setMask('integer');
 });
</script>
</content>
</body>
</html>
