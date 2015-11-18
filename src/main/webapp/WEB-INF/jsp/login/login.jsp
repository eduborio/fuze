<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"  prefix="decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,800italic,400,600,800" type="text/css">
	<link href="<c:url value='/resources/canvas-theme/css/font-awesome.min.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/canvas-theme/css/bootstrap.min.css'/>"    rel="stylesheet" />
    <link href="<c:url value='/resources/canvas-theme/js/libs/css/ui-lightness/jquery-ui-1.9.2.custom.min.css'/>"    rel="stylesheet" />
    <link href="<c:url value='/resources/canvas-theme/css/App.css'/>"    rel="stylesheet" />
	<link href="<c:url value='/resources/canvas-theme/css/Login.css'/>"    rel="stylesheet" />

</head>
<body>

<div id="login-container">

	<div>
		<a href=";">
			<img width="350px" height="185px" src="<c:url value='/resources/imagens/weblogia-logo.png'/>" alt="Logo" />
		</a>
	</div>

	<div id="login">

		<h3>Bem vindo ao Fuze Orçamentos</h3>

		<h5>Entre com usuario e senha para acessar.</h5>

		<form method="POST" id="login-form" action="<c:url value='/login/logar'/>" class="form">
		
			<div class="form-group">
				<label for="login-username">login</label>
				<input type="text" class="form-control" id="login-username" name="login" placeholder="Nome De Usuario">
			</div>

			<div class="form-group">
				<label for="login-password">Senha</label>
				<input type="password" class="form-control" id="login-password" name="senha" placeholder="Senha">
			</div>

			<div class="form-group">

				<button type="submit" id="login-btn" class="btn btn-inverse btn-block">Entrar &nbsp; <i class="fa fa-play-circle"></i></button>

			</div>
		</form>



	</div> <!-- /#login -->

	<!-- <a href="javascript:;" id="signup-btn" class="btn btn-lg btn-block">
		Criar Conta
	</a> -->


</div> <!-- /#login-container -->

</body>
</html>