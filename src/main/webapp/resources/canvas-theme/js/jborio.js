

//$.fn.jborioAutoComplete = function(){
	
//}

function jborioAutoComplete(target,cUrl,aSelectValue,aSelectInput,aMenu,inputFocus,widthMenu,len){
	
	   if(len == null)
		   len = 3;
	
        target.autocomplete({
        	
       		minLength : len,
			source : cUrl,
			open: function() { 
				if(widthMenu != undefined && widthMenu != null)
					target.autocomplete("widget").width(widthMenu); 
		    },
			delay: 400,
			select : function(event, ui) {
				var nCont = 0;
				
				for(nCont = 0;nCont < aSelectInput.length;nCont++)
					{
			     		campo = aSelectValue[nCont];
				    	nIndex = campo.indexOf(".");
					
				    	if(nIndex > 0 ){
				    		objeto = campo.slice(0,nIndex);
				    		field  = campo.slice(nIndex+1,campo.lenght);  
					        aSelectInput[nCont].val(ui.item[objeto][field]);
					        aSelectInput[nCont].html(ui.item[objeto][field]);
					        
				    	}else{
				    		aSelectInput[nCont].val(ui.item[campo]);
				    		aSelectInput[nCont].html(ui.item[campo]);
				    	}
				    }
				
				if(inputFocus != undefined && inputFocus != null)
					inputFocus.focus();
				
				return false;
			}
		}).data("autocomplete")._renderItem = function(ul, item) {
        	var nCont = 0;
        	var cHtml = "";
        	
        	cHtml = "<a>"; 
			for(nCont = 0;nCont < aMenu.length;nCont++)
			{
				campo = aMenu[nCont];
				nIndex = campo.indexOf(".");
				
				if(nIndex > 0 ){
					strObjeto = campo.slice(0,nIndex);
					strCampo  = campo.slice(nIndex+1,campo.lenght);
					// alert("indice: "+ nIndex + " Total: " + str+" objeto:
					// "+strObjeto +" campo: "+strCampo)
					cHtml += item[strObjeto] [strCampo]+ " - ";
				}
				else{
				   cHtml += item[campo]+ " - ";
				}
				  
		    }
        	
			cHtml = cHtml.substring(0, cHtml.length - 3);	
	        cHtml += "</a>";
        	
			return $("<li></li>").data("item.autocomplete", item).append(cHtml).appendTo(ul);
		     };
		     
}

function say(cHtml) {
	$("#console").append(cHtml + "</br>");

}

Date.prototype.toBr = function() {

    var padNumber = function(number) {

        number = number.toString();

        if (number.length === 1) {
            return "0" + number;
        }
        return number;
    };

    return  padNumber(this.getDate()) + "/"  +    padNumber(this.getMonth() + 1) + "/" + this.getFullYear();
};

Math.round = (function() {
	  var oldRound = Math.round;
	  return function(number, precision) {
	    precision = Math.abs(parseInt(precision)) || 0;
	    var coefficient = Math.pow(10, precision);
	    return oldRound(number*coefficient)/coefficient;
	  };
	})();

function CriarPaginacao(nRegistros,url,nPaginaAtual){
	
	

	    var maxPag = 0;
	
	    if(nPaginaAtual == null)
	    	nPaginaAtual = 0;
	    
	    var nAnterior = 0;
	    var nProxima  = 0;
	    
	    nPaginaAtual = parseFloat(nPaginaAtual);
	    
	    nAnterior = nPaginaAtual - 1;
	    nProxima  = nPaginaAtual + 1;
	    
	    var nPaginas = nRegistros / 20;
		nPaginas = Math.ceil(nPaginas);
	    
	    if(nAnterior < 0)
	    	nAnterior = 0;
	    	
	    maxPag = nPaginas;
	    if(maxPag > 5)
	    	maxPag = 5;
	    
	   	
	    cHtml = '<li class="active">'+ 
	    	   '<a href="/nfe' + url + '?pagina=0">' +
	    	   '<i class="fa fa-angle-double-left"></i>' +
				'</a></li>'	;	
	    
	    cHtml += '<li class="active">'+ 
 	    	    '<a href="/nfe' + url + '?pagina='+nAnterior+'">' +
 	    	    	'<i class="fa fa-angle-left"></i>' +
 	    	    	'</a></li>'	;
		
	    
	    if(nPaginas >= 5){
	    	
	    	if(nPaginaAtual >= (nPaginas-1)){
	    		
	    		nPaginaAtual = (nPaginas -1 );
	    		
	    		var nCont = parseFloat(nPaginaAtual - 4);
	    		
				var maxPag = parseFloat(nPaginaAtual+1);
				
				for(nCont;nCont < maxPag ;nCont++){
					
					if(nCont == nPaginaAtual){
						cHtml += '<li class="active"><a href="/nfe'+ url +'?pagina='+(nCont)+'" title="'+(nCont+1)+'">'+(nCont+1)+'</a></li>' ;
					}else{
						cHtml += '<li><a href="/nfe'+ url +'?pagina='+(nCont)+'" title="'+(nCont+1)+'">'+(nCont+1)+'</a></li>' ;
					}	
				}
	    	}else{
	    		
	    		var nCont = parseFloat(nPaginaAtual - 2);
	    		
				var maxPag = parseFloat(nPaginaAtual + 3);
				
				if(nCont < 0){
					nCont = 0;
					maxPag = 5;
				}
				
				for(nCont;nCont < maxPag ;nCont++){
					
					if(nCont == nPaginaAtual){
						cHtml += '<li class="active"><a href="/nfe'+ url +'?pagina='+(nCont)+'" title="'+(nCont+1)+'">'+(nCont+1)+'</a></li>' ;
					}else{
						cHtml += '<li><a href="/nfe'+ url +'?pagina='+(nCont)+'" title="'+(nCont+1)+'">'+(nCont+1)+'</a></li>' ;
					}	
				}
	    		
	    	}
			
        }else{
        	var nCont = parseFloat(nPaginaAtual);
        	maxPag = nPaginas;
    		
			for(nCont;nCont < maxPag ;nCont++){
				
				if(nCont == nPaginaAtual){
					cHtml += '<li class="active"><a href="/nfe'+ url +'?pagina='+(nCont)+'" title="'+(nCont+1)+'">'+(nCont+1)+'</a></li>' ;
				}else{
					cHtml += '<li><a href="/nfe'+ url +'?pagina='+(nCont)+'" title="'+(nCont+1)+'">'+(nCont+1)+'</a></li>' ;
				}	
			}
        }
	    
	    
		
		cHtml += '<li class="active"><a href="/nfe' + url + '?pagina='+(nProxima)+'" title="proxima"><i class="fa fa-angle-right"></i></a><li>'
		      + '<li class="active"><a href="/nfe' + url + '?pagina='+(nPaginas-1)+'" title="Final">'+
		      '<i class="fa fa-angle-double-right"></a></li>';
		
		
		$(".pagination").append(cHtml);
}

function replaceVirgula(campo)
{
	campo.value = campo.value.replace(/,/gi, ".");
}











