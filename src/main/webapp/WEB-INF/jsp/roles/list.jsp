<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Lista</title>
</head>
<body>

	<div id="content">
		<div id="content-header">
			<h1>Perfil de Usuário</h1>
		</div>

		<div id="content-container">

			<div class="row">
				<div class="col-xs-12 col-sm-12">	
					
					
					<div class="row">
						<div class="col-md-8">
							<a class="btn btn-app btn-inverse" href="<c:url value='/roles/novo'/>">
								<i class="fa fa-plus-circle bigger-150 block"></i> Novo
							</a>
						</div>	
					</div>
			
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet">
						<div class=" portlet-header">
							<h3><i class="fa fa-user"></i>  Perfil</h3>
						</div>
						<div class="portlet-content">						
							<table class="table table-striped">
		
								<thead>
									<tr>
										<th></th>
										<th class="hidden-xs" >id</th>
										<th >Nome</th>
										<th class="hidden-xs">Descrição</th>
										<th>Ações</th>
									</tr>
					
								</thead>
						
								<tbody>
									<c:forEach var="role" items="${roleList}">
										<tr id="role-${role.id}">
											<td> <input id="checkid-${role.id}" type="checkbox" class="check" /></td>
											<td> ${role.id}</td>
											<td><a class="ui-tooltip" data-toggle="tooltip" data-placement="top" title="Clique aqui para visualizar" href="<c:url value='/roles/${role.id}'/>">${role.nome}</a></td>
											<td class="hidden-xs">${role.descricao}</td>
											<td>
												<a href="" onclick="remove(${role.id}); return false;">
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
					
			CriarPaginacao(registros,"/roles/list",pagina);
			
		});
		
		   function remove(id){
			   $.get('remove?id=' + id, function(){
				   $('#role-'+id).fadeOut('slow');
			   });
		   }
		   
		   function edit(){
			   
			   var firstBox = $("input:checked").get(0);
		  		if( firstBox == undefined){
		  			alert("Nenhum role foi selecionado!!!");
		  		}else{
		  			$("#edit").prop("href","<c:url value='/roles/"+ firstBox.id.substring(8,firstBox.id.length) +"'/>");
		  		};
		  };
		</script>
	</content>	
</body>
</html>