package br.com.weblogia.fuze.controllers;

import static br.com.caelum.vraptor.view.Results.json;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.transaction.Transactional;

import org.apache.commons.io.IOUtils;
import org.apache.commons.mail.EmailException;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.download.Download;
import br.com.caelum.vraptor.observer.download.FileDownload;
import br.com.caelum.vraptor.observer.download.InputStreamDownload;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.weblogia.fuze.domain.Configuracoes;
import br.com.weblogia.fuze.domain.Orcamento;
import br.com.weblogia.fuze.domain.TipoDiaria;
import br.com.weblogia.fuze.domain.builder.OrcamentoBuilder;
import br.com.weblogia.fuze.domain.relatorios.GeradorDeRelatorios;
import br.com.weblogia.fuze.domain.relatorios.OrcamentoImpressao;
import br.com.weblogia.fuze.domain.services.emails.Email;
import br.com.weblogia.fuze.domain.services.emails.EmailOrcamento;
import br.com.weblogia.fuze.domain.services.emails.EnviadorDeEmail;
import br.com.weblogia.fuze.repositorios.AgenciaRepositorio;
import br.com.weblogia.fuze.repositorios.ClienteRepositorio;
import br.com.weblogia.fuze.repositorios.ConfiguracoesRepositorio;
import br.com.weblogia.fuze.repositorios.ContatoRepositorio;
import br.com.weblogia.fuze.repositorios.OrcamentoRepositorio;
import br.com.weblogia.fuze.repositorios.PracaRepositorio;
import br.com.weblogia.fuze.repositorios.SocioRepositorio;

@Controller
public class OrcamentosController {
	
	private @Inject  AgenciaRepositorio agencias;
	private @Inject  PracaRepositorio pracas;
	private @Inject  ContatoRepositorio contatos;
	private @Inject  SocioRepositorio socios;
	private @Inject  ClienteRepositorio clientes;
	private @Inject  OrcamentoRepositorio orcs;
	private @Inject  Result result;
	private @Inject  Validator validator;
	private @Inject  ConfiguracoesRepositorio cfgRepo;
	private @Inject  ServletContext context;
	
	public void list(int pagina){
		result.include("registros",orcs.buscaTotalDeRegistrosDaLista());
		result.include("pagina",pagina);
		result.include("orcamentoList",orcs.buscaTodos(pagina));
	}
	
	public void novo(){
		result.include("tipoList",TipoDiaria.values());
		Orcamento orcamento = new Orcamento();
		orcamento.setDataOrcamento(new Date());
		
		result.include("orcamento",orcamento);
	}
	
	@Path("/orcamentos/novo.json.jsp")
	public void novoJsonBugDropZone(Long id){
		result.nothing();
	}
	
	@Path("/orcamentos/{id}")
	public void edit(Long id){
		Orcamento o = orcs.buscaPorId(id);
		result.include("tipoList",TipoDiaria.values());
		result.include("orcamento",o);
		result.of(this).novo();
	}
	
	
	@Path("/orcamentos/duplicar/{id}")
	@Transactional
	public void duplicar(Long id){
		Orcamento o = orcs.buscaPorId(id);
		Orcamento orc = new OrcamentoBuilder(o).build();
		salvaOrcamento(orc);
		result.include("sucesso","Orcamento Duplicado!!");
		result.redirectTo("/orcamentos/list");
	}
	
	@Path("/orcamentos/aprovar/{id}")
	@Transactional
	public void aprovar(Long id){
		Orcamento o = orcs.buscaPorId(id);
		o.setStatus("Aprovado");
		o.setIcone("fa-check");
		o.setCor("green");
		salvaOrcamento(o);
		result.include("sucesso","Orcamento Aprovado!!");
		result.redirectTo("/orcamentos/list");
	}
	
	@Transactional
	public void remover(Long id){
		Orcamento o = orcs.buscaPorId(id);
		orcs.remover(o);
		result.nothing();
	}
	
	@Post
	@Transactional
	public void salvar(Orcamento orcamento){
		
		salvaOrcamento(orcamento);
		
		result.redirectTo("list");
	}

	private void salvaOrcamento(Orcamento orcamento) {
		Configuracoes cfg = cfgRepo.buscaPorId(1l);
		
		if(orcamento.getAgencia().getId()==null)
			orcamento.setAgencia(null);
		
		if(orcamento.getPraca().getId()==null)
			orcamento.setPraca(null);
		
		if(orcamento.getContato().getId()==null)
			orcamento.setContato(null);
		
		if(orcamento.getSocio().getId()==null)
			orcamento.setSocio(null);
		
		if(orcamento.getCliente().getId()==null)
			orcamento.setCliente(null);
		
		validator.addIf(orcamento.getTipo()==null,new SimpleMessage("orcamento","Campo Tipo de diária obrigatório!!"));
		validator.addIf(orcamento.getDescricao()==null,new SimpleMessage("orcamento","Campo pedido obrigatório!!"));
		
		
		if(orcamento.getId()==null){
			orcamento.setStatus("Rascunho");
			orcamento.setIcone("fa-edit");
			orcamento.setCor("grey");
			
			if(orcamento.getTipo().equals(TipoDiaria.CWB))
				orcamento.setValorDiaria(cfg.getDiariaCwb());
			
			if(orcamento.getTipo().equals(TipoDiaria.SP))
				orcamento.setValorDiaria(cfg.getDiariaSp());
			
			if(orcamento.getTemNF())
				orcamento.setNf(cfg.getNf());
			
			orcs.salva(orcamento);
		}else{
			if(orcamento.getTipo().equals(TipoDiaria.CWB))
				orcamento.setValorDiaria(cfg.getDiariaCwb());
			
			if(orcamento.getTipo().equals(TipoDiaria.SP))
				orcamento.setValorDiaria(cfg.getDiariaSp());
			
			if(orcamento.getTemNF())
				orcamento.setNf(cfg.getNf());
			
			Orcamento managed = orcs.buscaPorId(orcamento.getId());
			orcamento.setStatus(managed.getStatus());
			orcamento.setIcone(managed.getIcone());
			orcamento.setCor(managed.getCor());
			
			orcs.atualiza(orcamento);
		}
	}
	
	@Get
 	 @Path("/orcamentos/imprimir/{id}")
	 public InputStreamDownload imprime(Long id) throws JRException {
			
			Orcamento o = orcs.buscaPorId(id);
			
			Map<String, Object> parametrosDoPurchaseOrder = preparaImpressao(o);
			
			InputStreamDownload in =null;
			
		    	GeradorDeRelatorios gerador = new GeradorDeRelatorios(parametrosDoPurchaseOrder.get("SUBREPORT_DIR")+"orcamento", parametrosDoPurchaseOrder,(JRBeanCollectionDataSource) parametrosDoPurchaseOrder.get("jrDataSource") );
				in = gerador.geraPdfParaVisualizacao(o.getId().toString()+"-"+o.getAgencia().getNome()+"-"+o.getCliente().getNome());
					
			return in;

		}
	
	 @Get
	 @Path("/orcamentos/download/{id}")
	 public InputStreamDownload download(Long id) throws JRException {
			
			Orcamento o = orcs.buscaPorId(id);
			
			Map<String, Object> parametrosDoPurchaseOrder = preparaImpressao(o);
			
			InputStreamDownload in =null;
			
		    	GeradorDeRelatorios gerador = new GeradorDeRelatorios(parametrosDoPurchaseOrder.get("SUBREPORT_DIR")+"orcamento", parametrosDoPurchaseOrder,(JRBeanCollectionDataSource) parametrosDoPurchaseOrder.get("jrDataSource") );
				in = gerador.geraPdfParaDownloadE(o.getId().toString()+"-"+o.getAgencia().getNome()+"-"+o.getCliente().getNome());
					
			return in;

		}
	 
	  @Path("/orcamentos/selecionaEmail/{id}")
		public void selecionaEmail(Long id){
			Orcamento o = orcs.buscaPorId(id);
			result.include("orcamento",o);
	 }
	 
	 @Post
	 public void enviaEmail(Long id,String emails, String assunto, String corpo) throws JRException, EmailException{
		 Orcamento orc = orcs.buscaPorId(id);
		 Map<String, Object> parametrosDoPurchaseOrder = preparaImpressao(orc);
		 GeradorDeRelatorios gerador = new GeradorDeRelatorios(parametrosDoPurchaseOrder.get("SUBREPORT_DIR")+"orcamento", parametrosDoPurchaseOrder,(JRBeanCollectionDataSource) parametrosDoPurchaseOrder.get("jrDataSource") );
		 byte[] pdf = gerador.gerarByteArrayDePdf();
		 
		 Email emailOrcamento = new EmailOrcamento().build(emails,orc, pdf);
		 new EnviadorDeEmail(emailOrcamento).enviaSemThread();
		 result.include("sucesso","Email enviado com sucesso!");
		 result.redirectTo("/orcamentos/list");
	 }
	
	@Get
	@Path("/orcamentos/listarClientes.json")
	public void listarClientesJson(String term) {
		result.use(json()).withoutRoot()
				.from(this.clientes.buscaClientePorNome(term))
				.recursive()
				.serialize();
	}
	
	@Get
	@Path("/orcamentos/listarAgencias.json")
	public void listarAgenciasJson(String term) {
		result.use(json()).withoutRoot()
				.from(this.agencias.buscaAgenciaPorNome(term))
				.recursive()
				.serialize();
	}
	
	@Get
	@Path("/orcamentos/listarPracas.json")
	public void listarPracasJson(String term) {
		result.use(json()).withoutRoot()
				.from(this.pracas.buscaPracaPorDescricao(term))
				.recursive()
				.serialize();
	}
	
	@Get
	@Path("/orcamentos/listarContatos.json")
	public void listarContatosJson(String term) {
		result.use(json()).withoutRoot()
				.from(this.contatos.buscaContatoPorNome(term))
				.recursive()
				.serialize();
	}
	
	@Get
	@Path("/orcamentos/listarSocios.json")
	public void listarSociosJson(String term) {
		result.use(json()).withoutRoot()
				.from(this.socios.buscaSocioPorNome(term))
				.recursive()
				.serialize();
	}
	
	private Map<String, Object> preparaImpressao(Orcamento orcamento){
		
		OrcamentoImpressao op = new OrcamentoImpressao(orcamento);
		
		List<OrcamentoImpressao> opList =  new ArrayList<OrcamentoImpressao>();
		//List<ItemPOImpressao> itemList =  pi.getItensDaPurchaseOrder();
		
		opList.add(op);
		JRDataSource ds = new JRBeanCollectionDataSource(opList);
		//JRDataSource subds = new JRBeanCollectionDataSource(itemList);
		
		String caminho = context.getRealPath("/") + "WEB-INF/reports/";
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("SUBREPORT_DIR",caminho);
		//params.put("SUBDS",subds);
		params.put("jrDataSource",ds);
		params.putAll(preparaImagensDoOracamento(orcamento));
		
		return params;
		
	}
	
	private Map<String,Object> preparaImagensDoOracamento(Orcamento orcamento) {
		Map<String, Object> params = new HashMap<String, Object>();
		Integer cont = 0;
		for(String nomeAqruivo : orcamento.getImgs()){
			cont++;
			params.put("IMAGEM"+cont.toString(), nomeAqruivo);
		}
		
		params.put("CAMINHO_IMAGENS", "/opt/tomcat/temp/imgs/orcamento/"+orcamento.getId()+"/");
		
		return params;
	}

	@Post
	@Transactional
	public void adicionaImagem(Orcamento orcamento){
		salvaOrcamento(orcamento);
		result.include("orcamento",orcamento);
	}
		
	@Post
	@Path("/orcamentos/{orcamento.id}/importar")
	public void importar(Orcamento orcamento,UploadedFile file) throws IOException{
		salva(file,orcamento);
		result.redirectTo("/orcamentos/"+orcamento.getId());
	}
	
	@Get
	@Path("/orcamentos/galeria/{orcamento.id}")
	public void galeria(Orcamento orcamento){
		
		List<String> imagensList = new ArrayList<String>();
		
		File folder = new File("/opt/tomcat/temp/imgs/orcamento/" + orcamento.getId());
		
		if(folder.exists()){
			for(File file : folder.listFiles()){
				imagensList.add(file.getName());
			}
		}
		
		result.include("imagensList",imagensList);
		result.include("orcamento",orcamento);
	}
	
	@Get
	@Path("/orcamentos/imagens/{orcamento.id}/{nomeArquivo}")
	public Download imagem(Orcamento orcamento,String nomeArquivo) throws FileNotFoundException {
		
		File file = new File("/opt/tomcat/temp/imgs/orcamento/" + orcamento.getId(),nomeArquivo);
	    String contentType = "image/x-png, image/gif, image/jpeg";
	    String filename = file.getName();
	    
	    File fileDownload = file;
	    
	    return new FileDownload(fileDownload, contentType, filename);
	   }
	
	
	private void salva(UploadedFile imagem, Orcamento orcamento) {
		
		File folder = new File("/opt/tomcat/temp/imgs/orcamento/"+orcamento.getId());
		
		if(!folder.exists())
			folder.mkdirs();
		
		File destino = new File(folder,imagem.getFileName());
		    try {
	      IOUtils.copy(imagem.getFile(), new FileOutputStream(destino));
	      
	    } catch (IOException e) {
	      throw new RuntimeException("Erro ao copiar imagem", e);
	    }
    } 
	
	@Get
	@Path("/orcamentos/pesquisar")
	public void pesquisar(String agencia,Long numero,Date dataInicial,Date dataFinal) {
		
		List<Orcamento> orcList = new ArrayList<Orcamento>();
		
		if(numero == null)
		{
		   result.include("orcamentoList",orcs.buscaPor(agencia,dataInicial,dataFinal) );
		}else {
			orcList.add(orcs.buscaPorId(numero));
			result.include("orcamentoList",orcList);
		}
		result.of(this).list(1);
	}
	
}