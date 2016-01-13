<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>

<title>Email</title>
</head>
<body>
	<div id="content">
		<div id="content-header">
			<h1>Enviar Orçamento Por Email</h1>
		</div>
		
		<div id="content-container">
			<div class="row">
				<div class="col-md-8">
					<div class="alert alert-info fade in">
						<p>
							<h3>Id: ${orcamento.id} Agencia: ${orcamento.agencia.nome} Cliente: ${orcamento.cliente.nome}</h3>
						</p>
					     <form action="<c:url value='/orcamentos/enviaEmail'/>" method="POST">
					    	<p>
					    		<label>Email</label>
								<input type="text" class="form-control" name="emails" value="${email}"/>
								<input type="hidden" name="id" value="${orcamento.id}"/>
								<br>
								<input type="submit" value="Enviar Email" class="btn btn-success"/>
						        <a href="<c:url value='/orcamentos/list'/>" role="button" class="btn btn-danger">Voltar</a>
					        </p>
					     </form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>