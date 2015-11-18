package br.nassau.projeto.dao;

import java.sql.SQLException;
import java.util.List;

import br.nassau.projeto.model.Projeto;

public interface DaoProjeto {
	
	public void save(Projeto projeto) throws SQLException;
	
	public void update(Projeto projeto) throws SQLException;
	
	public void remove(Projeto projeto) throws SQLException;
	
	public void remove(Integer id) throws SQLException;
	
	public Projeto get(int id) throws SQLException;
	
	public List<Projeto> list() throws SQLException;

}
