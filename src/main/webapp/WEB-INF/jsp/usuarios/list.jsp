<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Lista</title>
</head>
<body>
	<div id="content">
		<div id="content-header">
			<h1>Usuários</h1>
		</div>

		<div id="content-container">

			<div class="row">
				<div class="col-xs-12 col-sm-12">	
					
					
					<div class="row">
						<div class="col-md-8">
							<a class="btn btn-app btn-inverse" href="<c:url value='/usuarios/novo'/>">
								<i class="fa fa-plus-circle bigger-150 block"></i> Novo
							</a>
						</div>	
					</div>
			
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet">
						<div class=" portlet-header">
							<h3><i class="fa fa-user"></i>  Usuários</h3>
						</div>
						<div class="portlet-content">						
							<table class="table table-striped">
		
								<thead>
									<tr>
										<th></th>
										<th class="hidden-xs" >id</th>
										<th >Login</th>
										<th class="hidden-xs">Nome Completo</th>
										<th class="hidden-xs">Perfil</th>
										<th>Ações</th>
									</tr>
					
								</thead>
						
								<tbody>
									<c:forEach var="usuario" items="${usuarioList}">
										<tr id="usuario-${usuario.id}">
											<td> <input id="checkid-${usuario.id}" type="checkbox" class="check" /></td>
											<td> ${usuario.id}</td>
											<td><a class="ui-tooltip" data-toggle="tooltip" data-placement="top" title="Clique aqui para visualizar" href="<c:url value='/usuarios/${usuario.id}'/>">${usuario.login}</a></td>
											<td class="hidden-xs">${usuario.nome}</td>
											<td class="hidden-xs">${usuario.role.nome}</td>
											<td>
												<a href="" onclick="remove(${usuario.id}); return false;">
													<i class="fa fa-trash-o bigger-130 red"></i>
												</a> 
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>	
					</div>
				</div> <!-- /col-md -->
				
				</div>
				</div>
				<div class="row">
					<div class="col-md-2">
						Total de ${registros} registros.
					</div>	
					<div class="col-md-offset-1 col-md-3 align-right">
						<ul class="pagination">
											
						</ul>
					</div>
				</div>
			</div>		
		</div>
	</div>
	
	<content tag="local_script">
		<script type="text/javascript">
		
		$(function(){
			
			var registros = "${registros}";
			var pagina = "${pagina}";
					
			CriarPaginacao(registros,"/usuarios/list",pagina);
			
		});
		
		   function remove(id){
			   $.get('remove?id=' + id, function(){
				   $('#usuario-'+id).fadeOut('slow');
			   });
		   }
		   
		   function edit(){
			   
			   var firstBox = $("input:checked").get(0);
		  		if( firstBox == undefined){
		  			alert("Nenhum usuario foi selecionado!!!");
		  		}else{
		  			$("#edit").prop("href","<c:url value='/usuarios/"+ firstBox.id.substring(8,firstBox.id.length) +"'/>");
		  		};
		  };
		</script>
	</content>	
</body>
</html>