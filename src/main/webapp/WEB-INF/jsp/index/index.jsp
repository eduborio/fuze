<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Fuze</title>
<link href="<c:url value='/resources/canvas-theme/css/botoes.css'/>"  rel="stylesheet" />
<link href="<c:url value='/resources/canvas-theme/css/custom.css'/>"    rel="stylesheet" />
</head>
<body>
	<div id="content">
		<div id="content-header">
			<h1>Fuze Orçamentos</h1>
		</div>

		<div id="content-container">

			<div class="row">
				<div class="col-xs-12 col-sm-12">	
				
					<div class="row">
						<label>Principais Atalhos</label>
					</div>
					
					<hr>
				
					<a class="btn btn-app btn-inverse" href="<c:url value='/agencias/list'/>">
						<i class="fa fa-print block"></i> Agencias
					</a>
					
					<a class="btn btn-app btn-inverse" href="<c:url value='/clientes/list'/>">
						<i class="fa fa-print block"></i> Clientes
					</a>
					
					<a class="btn btn-app btn-inverse" href="<c:url value='/orcamentos/list'/>">
						<i class="fa fa-comments block"></i> Orçamentos
					</a>
				</div>	
			</div>
			

		</div>

	</div>
</body>
</html>