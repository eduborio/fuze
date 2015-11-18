<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>VRaptor Blank Project</title>
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
				
					<a class="btn btn-app btn-inverse" href="<c:url value='/notasFiscais/list'/>">
						<i class="fa fa-print block"></i> NFe
					</a>
					
					<a class="btn btn-app btn-inverse" href="<c:url value='/notasFiscais/impressaoEmLote'/>">
						<i class="fa fa-print block"></i> em Lote
					</a>
					
					<a class="btn btn-app btn-inverse" href="<c:url value='/notasFiscais/eventos'/>">
						<i class="fa fa-comments block"></i> Eventos
					</a>
				</div>	
			</div>
			

		</div>

	</div>
</body>
</html>