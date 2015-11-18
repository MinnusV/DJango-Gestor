package br.nassau.projeto.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.nassau.projeto.model.Projeto;

public class DaoProjetoImpl extends GenericDao implements DaoProjeto {

	public void save(Projeto projeto) throws SQLException {
		String sql = "INSERT INTO projeto (nome, descricao, responsavel) VALUES (?,?,?)";
		PreparedStatement st = null;
		try {
			openConn();
			st = conn.prepareStatement(sql);
			st.setString(1, projeto.getNome());
			st.setString(2, projeto.getDescricao());
			st.setString(3, projeto.getResp());
			st.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (st != null)
				st.close();
			closeConn();
		}
	}

	public void update(Projeto projeto) throws SQLException {
		String sql = "UPDATE projeto SET nome=?, descricao=?, responsavel-? WHERE id=?";
		PreparedStatement st = null;
		try {
			openConn();
			st = conn.prepareStatement(sql);
			st.setString(1, projeto.getNome());
			st.setString(2, projeto.getDescricao());
			st.setString(3, projeto.getResp());
			st.setInt(4, projeto.getId());
			st.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (st != null)
				st.close();
			closeConn();
		}
	}

	public void remove(Projeto projeto) throws SQLException {
		remove(projeto.getId());
	}

	public void remove(Integer id) throws SQLException {
		String sql = "DELETE from projeto WHERE id = ?";
		PreparedStatement st = null;
		try {
			openConn();
			st = conn.prepareStatement(sql);
			st.setInt(1, id);
			st.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (st != null)
				st.close();
			closeConn();
		}
	}

	public Projeto get(int id) throws SQLException {
		String sql = "SELECT * FROM projeto WHERE id=?";
		PreparedStatement st = null;
		try {
			openConn();
			st = conn.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet resultSet = st.executeQuery();

			if (resultSet.next()) {
				int idRs = resultSet.getInt("id");
				String nome = resultSet.getString("nome");
				String descricao = resultSet.getString("descricao");
				String responsavel = resultSet.getString("responsavel");

				Projeto projeto = new Projeto();
				projeto.setId(idRs);
				projeto.setNome(nome);
				projeto.setDescricao(descricao);
				projeto.setResp(responsavel);


				return projeto;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (st != null)
				st.close();
			closeConn();
		}
		return null;
	}

	public List<Projeto> list() throws SQLException {
		String sql = "SELECT * FROM projeto";
		PreparedStatement st = null;

		try {
			openConn();
			st = conn.prepareStatement(sql);
			ResultSet resultSet = st.executeQuery();
			List<Projeto> projeto = new ArrayList<Projeto>();

			while (resultSet.next()) {

				int id = resultSet.getInt("id");
				String nome = resultSet.getString("nome");
				String descricao = resultSet.getString("descricao");
				String responsavel = resultSet.getString("responsavel");

				Projeto p = new Projeto();
				p.setId(id);
				p.setNome(nome);
				p.setDescricao(descricao);
				p.setResp(responsavel);
				projeto.add(p);
			}

			return projeto;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (st != null)
				st.close();
			conn.close();
		}
		return list();
	}
}
