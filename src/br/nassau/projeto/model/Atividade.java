package br.nassau.projeto.model;

public class Atividade {
	private Integer id;
	private String nome;
	private String responsavel;
	private String prioridade;
	private String descricao;
	private String status;
	private String dataInicio;
	private String dataFinal;
	private String projeto;

	public Atividade() {

	}
	
	public void setProj(String projeto){
		this.projeto = projeto;
	}
	
	public String getProj(){
		return projeto;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setResponsavel(String responsavel) {
		this.responsavel = responsavel;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public void setPrioridade(String prioridade) {
		this.prioridade = prioridade;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setDataInicio(String dataInicio) {
		this.dataInicio = dataInicio;
	}

	public void setDataFinal(String dataFinal) {
		this.dataFinal = dataFinal;
	}

	public Integer getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public String getResponsavel() {
		return responsavel;
	}

	public String getDescricao() {
		return descricao;
	}

	public String getPrioridade() {
		return prioridade;
	}

	public String getStatus() {
		return status;
	}

	public String getDataInicio() {
		return dataInicio;
	}

	public String getDataFinal() {
		return dataFinal;
	}
}
