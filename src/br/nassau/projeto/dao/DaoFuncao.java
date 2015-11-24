package br.nassau.projeto.dao;

import java.sql.SQLException;
import java.util.List;

import br.nassau.projeto.model.Funcao;

public interface DaoFuncao {
	public void save(Funcao funcao) throws SQLException;
	
	public void update(Funcao funcao) throws SQLException;
	
	public void remove(Funcao funcao) throws SQLException;
	
	public void remove(Integer id) throws SQLException;
	
	public Funcao get(int id) throws SQLException;
	
	public List<Funcao> list() throws SQLException;
}
