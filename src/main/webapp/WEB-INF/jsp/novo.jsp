<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Agencia</title>
</head>
<body>
	<div id="content-cadastro">
		<div id="content-header">
			<h1>Novo Agencia</h1>
		</div>
		<div id="content-container">
			<div class="row">
				<c:forEach var="error" items="${errors}">
					<div class="alert alert-danger">
						<a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
						<strong>Erro!</strong> ${error.message}
					</div>
				</c:forEach>
				<div class="col-md-2 col-sm-3">
				</div>
				<div class="col-md-10 col-sm-9">
					<div class="tab-content stacked-content">
						<div class="tab-pane fade in active" id="identif-tab">
							<form method="POST" action="<c:url value='/agencias/salvar'/>" class="form-horizontal">
 							<input type="hidden" name="agencia.id" value="${agencia.id}" />
								<div class="form-group">
									<label class="col-md-2">Nom</label>
									<div class="col-md-7">
										<input type="text" name="agencia.nome" value="${agencia.nome}" class="form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2">Contat</label>
									<div class="col-md-7">
										<input type="text" name="agencia.contato" value="${agencia.contato}" class="form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2">Telefon</label>
									<div class="col-md-7">
										<input type="text" name="agencia.telefone" value="${agencia.telefone}" class="form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2">Emai</label>
									<div class="col-md-7">
										<input type="text" name="agencia.email" value="${agencia.email}" class="form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2">Logradour</label>
									<div class="col-md-7">
										<input type="text" name="agencia.logradouro" value="${agencia.logradouro}" class="form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2">Numer</label>
									<div class="col-md-7">
										<input type="text" name="agencia.numero" value="${agencia.numero}" class="form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2">Bairr</label>
									<div class="col-md-7">
										<input type="text" name="agencia.bairro" value="${agencia.bairro}" class="form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2">Cidad</label>
									<div class="col-md-7">
										<input type="text" name="agencia.cidade" value="${agencia.cidade}" class="form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2">U</label>
									<div class="col-md-7">
										<input type="text" name="agencia.uf" value="${agencia.uf}" class="form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2">Ce</label>
									<div class="col-md-7">
										<input type="text" name="agencia.cep" value="${agencia.cep}" class="form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2">Cnp</label>
									<div class="col-md-7">
										<input type="text" name="agencia.cnpj" value="${agencia.cnpj}" class="form-control"/>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
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
