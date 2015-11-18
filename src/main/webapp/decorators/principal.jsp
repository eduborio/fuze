<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"  prefix="decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>principal</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,800italic,400,600,800" type="text/css">
    <link href="<c:url value='/resources/canvas-theme/css/font-awesome.min.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/canvas-theme/css/bootstrap.min.css'/>"    rel="stylesheet" />
    <link href="<c:url value='/resources/canvas-theme/js/libs/css/ui-lightness/jquery-ui-1.9.2.custom.min.css'/>"    rel="stylesheet" />
    <link href="<c:url value='/resources/canvas-theme/js/plugins/select2/select2.css'/>"    rel="stylesheet" />
    <link href="<c:url value='/resources/canvas-theme/css/App.css'/>"    rel="stylesheet" />
	<link href="<c:url value='/resources/canvas-theme/css/custom.css'/>"    rel="stylesheet" />
	<link href="<c:url value='/resources/canvas-theme/css/sem-menu-lateral.css'/>"    rel="stylesheet" />
	<link href="<c:url value='/resources/canvas-theme/css/howl.css'/>"    rel="stylesheet" />
    
    <decorator:head/>
</head>
<body>
	<div id="wrapper">
		
		<header id="header">

			<h1 id="site-logo">
				<a href="<c:url value='/' />"><img width="91x" height="46px" src="<c:url value='/resources/imagens/weblogia-logo-pequeno.png'/>" /></a>  
			</h1>	
	
			<a href="javascript:;" data-toggle="collapse" data-target=".top-bar-collapse" id="top-bar-toggle" class="navbar-toggle collapsed">
				<i class="fa fa-cog"></i>
			</a>
	
			<a href="javascript:;" data-toggle="collapse" data-target=".sidebar-collapse" id="sidebar-toggle" class="navbar-toggle collapsed">
				<i class="fa fa-reorder"></i>
			</a>

		</header> <!-- header -->
		
		<nav id="top-bar" class="collapse top-bar-collapse">

			<ul class="nav navbar-nav pull-left">
				<li class="">
					<a href="<c:url value='/'/>">
						<i class="fa fa-home"></i> 
						Home
					</a>
				</li>
				
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="javascript(0);">
				    	Cadastros <span class="caret"></span>
					</a>
			
					<ul class="dropdown-menu" role="menu">
				        <li><a href="<c:url value='/roles/list'/>"><i class="fa fa-tasks"></i>&nbsp; &nbsp;Perfis de Usuário</a></li>
				        <li><a href="<c:url value='/usuarios/list'/>"><i class="fa fa-user"></i>&nbsp; &nbsp;Usuários</a></li>
					</ul>
				</li>
			    
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="javascript(0);">
				    	Notas Fiscais <span class="caret"></span>
					</a>
			
					<ul class="dropdown-menu" role="menu">
				        <li><a href="<c:url value='/notasFiscais/list'/>"><i class="fa fa-print"></i>&nbsp; &nbsp;Autorizadas</a></li>
				        <li><a href="<c:url value='/notasFiscais/impressaoEmLote'/>"><i class="fa fa-print"></i>&nbsp; &nbsp;Impressão Em Lote</a></li>
				        <li class="divider"></li>
				        <li><a href="<c:url value='/notasFiscais/eventos'/>"><i class="fa fa-tasks"></i>&nbsp; &nbsp;Eventos</a></li>
				        <li class="divider"></li>
				        <li><a href="<c:url value='/notasFiscais/consultaStatusDoServico'/>"><i class="fa fa-cog"></i>&nbsp; &nbsp;Consulta Serviço</a></li>
				        <li><a href="<c:url value='/notasFiscais/inutilizacao'/>"><i class="fa fa-ban"></i>&nbsp; &nbsp;Inutiliza Numeração</a></li>
					</ul>
				</li>
			    
			    
			</ul>
	
			<ul class="nav navbar-nav pull-right">
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="javascript:;">
						<i class="fa fa-user"></i>
			        	${usuario.login}
			        	<span class="caret"></span>
			    	</a>
	
			    	<ul class="dropdown-menu" role="menu">
				        <li>
				        	<a href="<c:url value='/configuracoes/edit'/>">
				        		<i class="fa fa-user"></i> 
				        		&nbsp;&nbsp;Trocar Senha
				        	</a>
				        </li>
				        <li class="divider"></li>
				        <li>
				        	<a href="<c:url value='/login/sair'/>">
				        		<i class="fa fa-sign-out"></i> 
				        		&nbsp;&nbsp;Logout
				        	</a>
				        </li>
			    	</ul>
			    </li>
			</ul>
	
		</nav> <!-- /#top-bar -->
		
		<div id="sidebar-wrapper" class="collapse sidebar-collapse">
	
			 <div id="search">
				<form>
					<!-- <input class="form-control input-sm" type="text" name="search" placeholder="Search..." /> -->
	
					<!-- <button type="submit" id="search-btn" class="btn"><i class="fa fa-search"></i></button>  -->
				</form>		
			</div>  
		
			<nav id="sidebar">		
				
						
			</nav> <!-- #sidebar -->
	
		</div> <!-- /#sidebar-wrapper -->
		
		<decorator:body/>
	
	</div>
	
	<footer id="footer">
		<ul class="nav pull-right">
			<li>
				Copyright &copy; 2015, Weblogia Aplicações Web.
			</li>
		</ul>
    </footer>
	
	<script src="<c:url value='/resources/canvas-theme/js/libs/jquery-1.9.1.min.js'/>"></script>
	<script src="<c:url value='/resources/canvas-theme/js/libs/jquery-ui-1.9.2.custom.min.js'/>"></script>
	<script src="<c:url value='/resources/canvas-theme/js/libs/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/resources/canvas-theme/js/App.js'/>"></script>
	<script src="<c:url value='/resources/canvas-theme/js/jborio.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.meiomask.1.1.14.js'/>"></script>
	<decorator:getProperty property="page.local_script"></decorator:getProperty>
</body>
</html>