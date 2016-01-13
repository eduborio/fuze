package br.com.weblogia.fuze.domain.relatorios;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.sql.Connection;
import java.util.Map;

import br.com.caelum.vraptor.observer.download.InputStreamDownload;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;

public class GeradorDeRelatorios {
	
	private  String nomedoArquivoJasper;
	private  Map<String, Object> params;
	private  Connection conn;
	private  JRDataSource datasource;

	public GeradorDeRelatorios(String nomeArquivo,Map<String,Object> params,Connection conn) {
		this.nomedoArquivoJasper = nomeArquivo;
		this.params = params;
		this.conn = conn;
		
	}
	
	public GeradorDeRelatorios(String nomeArquivo,Map<String,Object> params,JRDataSource datasource) {
		this.nomedoArquivoJasper = nomeArquivo;
		this.params = params;
		this.datasource = datasource;
		
	}
	
	public GeradorDeRelatorios() {
		
	}
	
	public byte[] gerarByteArrayDePdf() throws JRException {
	    JasperPrint print = preencheRelatorio();
	    return JasperExportManager.exportReportToPdf(print);
	}
	
	
	public InputStreamDownload geraPdfParaVisualizacao(String nomeDoArquivoParaDownload) throws JRException {
		JasperPrint print = preencheRelatorio();
	    byte[] pdf = JasperExportManager.exportReportToPdf(print);
	    
	    ByteArrayInputStream docInput = new ByteArrayInputStream(pdf);

		String contentType = "application/pdf";
		boolean fazDownload = false;
		
		return new InputStreamDownload(docInput, contentType, nomeDoArquivoParaDownload+".pdf", fazDownload, pdf.length);
	}
	
	public InputStreamDownload geraPdfParaDownloadE(String nomeDoArquivoParaDownload) throws JRException {
		JasperPrint print = preencheRelatorio();
	    byte[] pdf = JasperExportManager.exportReportToPdf(print);
	    
	    ByteArrayInputStream docInput = new ByteArrayInputStream(pdf);

		String contentType = "application/pdf";
		boolean fazDownload = true;
		
		return new InputStreamDownload(docInput, contentType, nomeDoArquivoParaDownload+".pdf", fazDownload, pdf.length);
	}
	
	public InputStreamDownload geraXlsParaDownload(String nomeDoArquivoParaDownload) throws JRException {
		JasperPrint print = preencheRelatorio();
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	    
	    JRXlsExporter exporter=new JRXlsExporter();
	    
        exporter.setParameter(JRXlsExporterParameter.JASPER_PRINT, print);  
        exporter.setParameter(JRXlsExporterParameter.OUTPUT_STREAM,outputStream);  
        exporter.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE,Boolean.TRUE);  
        exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,Boolean.TRUE);  
        exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_COLUMNS,Boolean.TRUE);  
        exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET,Boolean.FALSE);  
        exporter.setParameter(JRXlsExporterParameter.MAXIMUM_ROWS_PER_SHEET,0);  
        exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND,Boolean.TRUE);  
        
                /*net.sf.jasperreports.export.exclude.origin.band.1=pageHeader
        net.sf.jasperreports.export.exclude.origin.band.2=pageFooter

       # this gets rid of the repeating column headers and footers in excel exports
       net.sf.jasperreports.export.xls.exclude.origin.band.1=columnHeader
       net.sf.jasperreports.export.xls.exclude.origin.band.2=pageFooter
		*/

        exporter.exportReport();
        
        byte[] xls = outputStream.toByteArray();
	    ByteArrayInputStream docInput = new ByteArrayInputStream(xls);

		String contentType = "application/vnd.ms-excel";
		boolean fazDownload = true;
		
		return new InputStreamDownload(docInput, contentType, nomeDoArquivoParaDownload, fazDownload, xls.length);
	}
	
	public InputStreamDownload geraXlsFormatadoComTAB(String nomeDoArquivoParaDownload,String arquivo) throws JRException {
		
	    byte[] xls = arquivo.getBytes(); 
	    
	    ByteArrayInputStream docInput = new ByteArrayInputStream(xls);

		String contentType = "plain/text";
		boolean fazDownload = true;
		
		return new InputStreamDownload(docInput, contentType, nomeDoArquivoParaDownload, fazDownload, xls.length);
	}

	private JasperPrint preencheRelatorio() throws JRException {
		
		if(this.datasource!= null)
			 return JasperFillManager.fillReport(nomedoArquivoJasper+".jasper", params, datasource);
		
		return JasperFillManager.fillReport(nomedoArquivoJasper+".jasper", params, conn);
	}

}
