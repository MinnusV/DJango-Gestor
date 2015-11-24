package br.nassau.projeto.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.nassau.projeto.model.Funcao;

public class DaoFuncaoImpl extends GenericDao implements DaoFuncao{
	public void save(Funcao funcao) throws SQLException {
		String sql = "INSERT INTO funcao (tipoFuncao) VALUES (?)";
		PreparedStatement st = null;
		try {
			openConn();
			st = conn.prepareStatement(sql);
			st.setString(1, funcao.getTipoFuncao());
			st.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (st != null)
				st.close();
			closeConn();
		}
	}

	public void update(Funcao funcao) throws SQLException {
		String sql = "UPDATE funcao SET tipoFuncao=? WHERE id=?";
		PreparedStatement st = null;
		try {
			openConn();
			st = conn.prepareStatement(sql);
			st.setString(1, funcao.getTipoFuncao());
			st.setInt(2, funcao.getId());
			st.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (st != null)
				st.close();
			closeConn();
		}
	}

	public void remove(Funcao funcao) throws SQLException {
		remove(funcao.getId());
	}

	public void remove(Integer id) throws SQLException {
		String sql = "DELETE from funcao WHERE id = ?";
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

	public Funcao get(int id) throws SQLException {
		String sql = "SELECT * FROM funcao WHERE id=?";
		PreparedStatement st = null;
		try {
			openConn();
			st = conn.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet resultSet = st.executeQuery();

			if (resultSet.next()) {
				int idRs = resultSet.getInt("id");
				String tipoFuncao = resultSet.getString("tipoFuncao");

				Funcao funcao = new Funcao();
				funcao.setId(idRs);
				funcao.setTipoFuncao(tipoFuncao);

				return funcao;
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

	public List<Funcao> list() throws SQLException {
		String sql = "SELECT * FROM funcao";
		PreparedStatement st = null;

		try {
			openConn();
			st = conn.prepareStatement(sql);
			ResultSet resultSet = st.executeQuery();
			List<Funcao> funcao = new ArrayList<Funcao>();

			while (resultSet.next()) {

				int id = resultSet.getInt("id");
				String tipoFuncao = resultSet.getString("tipoFuncao");

				Funcao f = new Funcao();
				f.setId(id);
				f.setTipoFuncao(tipoFuncao);
				funcao.add(f);
			}

			return funcao;
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
