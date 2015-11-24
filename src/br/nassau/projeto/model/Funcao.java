package br.nassau.projeto.model;

public class Funcao {
	private Integer id;
	private String tipoFuncao;
	
	public void setId(Integer id){
		this.id = id;
	}
	
	public void setTipoFuncao(String tipoFuncao){
		this.tipoFuncao = tipoFuncao;
	}
	
	public Integer getId(){
		return id;
	}
	
	public String getTipoFuncao(){
		return tipoFuncao;
	}
}
