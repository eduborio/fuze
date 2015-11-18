<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Novo</title>
</head>
<body>

	<div id="content-cadastro">
		<div id="content-header">
			<h1>Perfil de Usuário</h1>
		</div>
		<div id="content-container">
	
		       <c:forEach var="error" items="${errors}">
			 		<div class="alert alert-danger">
						<a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
						<strong>Erro!</strong> ${error.message}
			 		</div>
				</c:forEach>
				<div class="row">
					<div class="col-md-2 col-sm-3">
					</div>
					
					<div class="col-md-8 col-sm-9">
					
						<div class="portlet">
							<div class="portlet-header">
								<h3>
									<i class="fa fa-table"></i>
									Perfil de Usuário
								</h3>
							</div>
							<div class="portlet-content">
								<form action="<c:url value='/roles/salvar'/>" method="post">
									
									<input id="role-id" type="hidden" name="role.id" value="${role.id}"></input>
									<div class="form-group">
										<div class="row">	
											<div class="col-md-3">
												<label for="razao">Nome</label> 
												<input type="text" class="form-control" name="role.nome" value="${role.nome}"></input>
											</div>
										</div>
									</div>
									
									<div class="form-group">	
										<div class="row">	
											<div class="col-md-12">
												<label>Descrição</label> 
												<input type="text"	class="form-control" name="role.descricao" value="${role.descricao}"></input>
											</div>		
										</div>	
									</div>
									<br>
									<hr>
									<div class="form-group">
						          		<div class="col-md-4">
						          			<button type="submit" class="btn btn-success">Salvar</button>
						          			&nbsp;
						          			<button type="reset" class="btn btn-danger">Cancelar</button>
						          		</div>
						          	</div> 
								</form>
							</div>	
						</div>		
					</div>
				</div>
			</div>
		</div>
</body>
</html>