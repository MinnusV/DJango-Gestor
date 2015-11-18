package br.nassau.projeto.dao;

import java.sql.SQLException;
import java.util.List;

import br.nassau.projeto.model.Atividade;

public interface DaoAtividade {
	
	public void save(Atividade atividade) throws SQLException;
	
	public void update(Atividade atividade) throws SQLException;
	
	public void remove(Atividade atividade) throws SQLException;
	
	public void remove(Integer id) throws SQLException;
	
	public Atividade get(int id) throws SQLException;
	
	public List<Atividade> list() throws SQLException;
}
