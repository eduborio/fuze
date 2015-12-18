<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Configuracoes</title>
</head>
<body>
	<div id="content">

		<div id="content-header">
			<h1>Configuracoes</h1>
		</div>

		<div id="content-container">

			<%@ include file="../_fragmentos/mostraErros.jspf" %>
			<%@ include file="../_fragmentos/sucesso.jspf" %>

			<form method="POST" action="<c:url value='/config/salvar'/>">
				<jsp:include page="../_fragmentos/portlet.jsp"><jsp:param name="iconClass" value="fa fa-tasks"/></jsp:include>

 							<input type="hidden" name="configuracoes.id" value="${configuracoes.id}" />
								<div class="row">
									<div class="col-md-3">
										<label>Diaria Cwb</label>
									    <input type="text" class="form-control" data-behaviour="valor" name="configuracoes.diariaCwb" id="configuracoes.diariaCwb" value="<fmt:formatNumber value='${configuracoes.diariaCwb}' pattern='#,##0.00'/>" />
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<label>Diaria SP</label>
									    <input type="text" class="form-control" data-behaviour="valor" name="configuracoes.diariaSp" id="configuracoes.diariaSp" value="<fmt:formatNumber value='${configuracoes.diariaSp}' pattern='#,##0.00'/>" />
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<label>Agência %</label>
									    <input type="text" class="form-control" data-behaviour="valor" name="configuracoes.bv" id="configuracoes.bv" value="<fmt:formatNumber value='${configuracoes.bv}' pattern='#,##0.00'/>" />
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<label>NF %</label>
									    <input type="text" class="form-control" data-behaviour="valor" name="configuracoes.nf" id="configuracoes.nf" value="<fmt:formatNumber value='${configuracoes.nf}' pattern='#,##0.00'/>" />
									</div>
								</div>
					<input value="Salvar" type="submit" class="btn btn-success"	/>

				<%@ include file="../_fragmentos/portletFim.jspf" %>
			</form>

		</div>
	</div>
 <content tag="local_script">
  <script src="<c:url value='/resources/canvas-theme/js/plugins/select2/select2.js'/>"></script>
  <script src="<c:url value='/resources/canvas-theme/js/plugins/select2/select2_locale_pt-BR.js'/>"></script>
  <script src="<c:url value='/resources/canvas-theme/js/borioselect2.js'/>"></script>
  <script src="<c:url value='/resources/canvas-theme/js/plugins/jquery.meiomask.1.1.14.js'/>"></script>
  <script type="text/javascript">
  $(document).ready(function() {
  	$('[data-behaviour~=valor]').setMask('decimal');
  	$('[data-behaviour~=integer]').setMask('integer');
 });
</script>
</content>
</body>
</html>
