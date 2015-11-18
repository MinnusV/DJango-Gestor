package br.nassau.projeto.model;

public class Projeto {
	private Integer id;
	private String nome;
	private String responsavel;
	private String descricao;
	
	public Projeto(){
		
	}
	
	public void setId(Integer id){
		this.id=id;
	}
	
	public void setNome(String nome){
		this.nome=nome;
	}
	
	public void setResp(String responsavel){
		this.responsavel=responsavel;
	}
	
	public void setDescricao(String descricao){
		this.descricao=descricao;
	}
	
	public Integer getId(){
		return id;
	}
	
	public String getNome(){
		return nome;
	}
	
	public String getResp(){
		return responsavel;
	}
	
	public String getDescricao(){
		return descricao;
	}
}
