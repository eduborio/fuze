package br.com.weblogia.fuze.domain.tipos;


public enum TipoTabelaPreco implements Tipo {
	  PARANA(1, "Paraná"),
	  COM_INSCRICAO(2, "Com Inscrição Estadual"),
	  SEM_INSCRICAO(3, "Sem Inscrição Estadual"),
	  SETE_PORCENTO(4, "Sete Porcento");
	  
	  private final Integer value;   
	  private final String description;
	  
	  TipoTabelaPreco(Integer value, String description)
	  {   
	     this.value = value;
	     this.description = description;
	  }   
	  
	  public static TipoTabelaPreco getType(Integer value)
	  {
	    for(TipoTabelaPreco type: TipoTabelaPreco.values())
	    {
	      if (value.equals(type.getValue()))
	      {
	        return type;
	      }
	    }
	    return null;
	  }

	  public TipoTabelaPreco[] getValues()
	  {
	    return TipoTabelaPreco.values();
	  }

	public String getDescription() {
		return this.description;
	}

	public Integer getValue() {
		return this.value;
	}

}
