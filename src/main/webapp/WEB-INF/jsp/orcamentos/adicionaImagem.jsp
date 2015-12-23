<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Imagem</title>
<link href="<c:url value='/resources/canvas-theme/css/dropzone.css'/>"    rel="stylesheet" />
</head>
<body>
	 <div id="content">
		 <div id="content-header">
			 <h1>Adiciona Imagem</h1>
		 </div>

		 <div id="content-container">
			<%@ include file="../_fragmentos/mostraErros.jspf" %>
			<%@ include file="../_fragmentos/sucesso.jspf" %>

			<div class="row">
				<div id="my-dropzone">
					<form enctype="multipart/form-data" method="post" action="<c:url value='/orcamentos/${orcamento.id}/importar'/>" class="dropzone">
						  <div class="fallback">
							<input name="file" type="file" accept="image/x-png, image/gif, image/jpeg"/>
						  </div>	
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
					<input type="button" value="Voltar" class="btn btn-danger" onClick="window.location.href='<c:url value='/orcamentos/${orcamento.id}'/>'" />
				</div>
			
			</div>	
		</div>
	</div>
	<content tag="local_script">
		<script src="<c:url value='/resources/canvas-theme/js/libs/dropzone.min.js'/>"></script>
		<script type="text/javascript">
			jQuery(function($){
			
			try {
			  $(".dropzone").dropzone({
			    paramName: "file", // The name that will be used to transfer the file
			    maxFilesize: 0.9, // MB
			  
				addRemoveLinks : false,
				dictDefaultMessage :
				'<div class="dzone-text">\
				<span class="bigger-120 bolder"><i class="fa fa-caret-right red"></i> Arraste aqui</span>\
				<span class="bigger-120 grey">(ou clique)</span> <br /> \
				<i class="fa fa-cloud-upload blue" style="font-size: 500%;"></i>\
				</div>'
				
			,
				dictResponseError: 'Erro ao subir arquivo!',
				
				//change the previewTemplate to use Bootstrap progress bars
				previewTemplate: "<div class=\"dz-preview dz-file-preview\">\n  <div class=\"dz-details\">\n    <div class=\"dz-filename\"><span data-dz-name></span></div>\n    <div class=\"dz-size\" data-dz-size></div>\n    <img data-dz-thumbnail />\n  </div>\n  <div class=\"progress progress-small progress-striped active\"><div class=\"progress-bar progress-bar-success\" data-dz-uploadprogress></div></div>\n  <div class=\"dz-success-mark\"><span></span></div>\n  <div class=\"dz-error-mark\"><span></span></div>\n  <div class=\"dz-error-message\"><span data-dz-errormessage></span></div>\n</div>",
				init: function() {
		            this.on("success", function(file,resp) { console.log.file });
		          }
			  });
			} catch(e) {
			  alert('Esta aplicação não suporta Navegadores antigos!');
			}
		});
			
		</script>
	</content>	
</body>
</html>
