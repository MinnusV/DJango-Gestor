package br.nassau.projeto.dao;

import java.sql.SQLException;
import java.util.List;

import br.nassau.projeto.model.Usuario;

public interface DaoUsuario {

	public void save(Usuario usuario) throws SQLException;
	
	public void update(Usuario usuario) throws SQLException;
	
	public void validarUsuario(Usuario usuario) throws SQLException;
	
	public void updateSenha(Usuario usuario, Integer id) throws SQLException;
	
	public void remove(Usuario usuario) throws SQLException;
	
	public void remove(Integer id) throws SQLException;
	
	public Usuario get(int id) throws SQLException;
	
	public List<Usuario> list() throws SQLException;

	boolean autenticaOperador(String email, String senha) throws SQLException;

	boolean autenticaAdministrador(String email, String senha) throws SQLException;
	
}
