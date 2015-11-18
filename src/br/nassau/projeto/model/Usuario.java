package br.nassau.projeto.model;

public class Usuario {
	private Integer id;
	private String nome;
	private String email;
	private String senha;
	private String tipoUsuario;
	private String funcao;
	
	public Usuario(){
		
	}

	public Integer getId(){
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFuncao() {
		return funcao;
	}

	public void setFuncao(String funcao) {
		this.funcao = funcao;
	}
	
	public String getTipoUsuario() {
		return tipoUsuario;
	}
	
	public void setTipoUsuario(String tipoUsuario){
		this.tipoUsuario = tipoUsuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
}
