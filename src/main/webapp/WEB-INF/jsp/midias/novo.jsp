<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Midia</title>
</head>
<body>
	<div id="content">

		<div id="content-header">
			<h1>Midia</h1>
		</div>

		<div id="content-container">

			<%@ include file="../_fragmentos/mostraErros.jspf" %>
			<%@ include file="../_fragmentos/sucesso.jspf" %>

			<form method="POST" action="<c:url value='/midias/salvar'/>">
				<jsp:include page="../_fragmentos/portlet.jsp"><jsp:param name="iconClass" value="fa fa-tasks"/></jsp:include>

 							<input type="hidden" name="midia.id" value="${midia.id}" />
						<div class="row">
							<div class="col-md-3">
								<label>Descricao</label>
								<input type="text" name="midia.descricao" value="${midia.descricao}" class="form-control"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<input value="Salvar" type="submit" class="btn btn-success"	/>
								<button type="button" class="btn btn-danger" onClick="window.location.href='<c:url value='/midias/list'/>'">Voltar</button> 
							</div>
						</div>

				<%@ include file="../_fragmentos/portletFim.jspf" %>
			</form>

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
