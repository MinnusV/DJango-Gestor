package br.nassau.projeto.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.nassau.projeto.model.Atividade;

public class DaoAtividadeImpl extends GenericDao implements DaoAtividade {

	public void save(Atividade atividade) throws SQLException {
		String sql = "INSERT INTO atividade (nome, responsavel, prioridade, status, descricao, datainicio, datafinal, projeto) VALUES (?,?,?,?,?,?,?,?)";
		PreparedStatement st = null;
		try {
			openConn();
			st = conn.prepareStatement(sql);
			st.setString(1, atividade.getNome());
			st.setString(2, atividade.getResponsavel());
			st.setString(3, atividade.getPrioridade());
			st.setString(4, atividade.getStatus());
			st.setString(5, atividade.getDescricao());
			st.setString(6, atividade.getDataInicio());
			st.setString(7, atividade.getDataFinal());
			st.setString(8, atividade.getProj());
			st.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (st != null)
				st.close();
			closeConn();
		}
	}

	public void update(Atividade atividade) throws SQLException {
		String sql = "UPDATE atividade SET nome=?, responsavel=?, prioridade=?, status=?, descricao=?, datainicio=?, datafinal=?, projeto=? WHERE id=?";
		PreparedStatement st = null;
		try {
			openConn();
			st = conn.prepareStatement(sql);
			st.setString(1, atividade.getNome());
			st.setString(2, atividade.getResponsavel());
			st.setString(3, atividade.getPrioridade());
			st.setString(4, atividade.getStatus());
			st.setString(5, atividade.getDescricao());
			st.setString(6, atividade.getDataInicio());
			st.setString(7, atividade.getDataFinal());
			st.setString(8, atividade.getProj());
			st.setInt(9, atividade.getId());
			st.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (st != null)
				st.close();
			closeConn();
		}
	}

	public void remove(Atividade atividade) throws SQLException {
		remove(atividade.getId());
	}

	public void remove(Integer id) throws SQLException {
		String sql = "DELETE from atividade WHERE id = ?";
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

	public Atividade get(int id) throws SQLException {
		String sql = "SELECT * FROM atividade WHERE id=?";
		PreparedStatement st = null;
		try {
			openConn();
			st = conn.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet resultSet = st.executeQuery();

			if (resultSet.next()) {
				int idRs = resultSet.getInt("id");
				String nome = resultSet.getString("nome");
				String responsavel = resultSet.getString("responsavel");
				String prioridade = resultSet.getString("prioridade");
				String status = resultSet.getString("status");
				String descricao = resultSet.getString("descricao");
				String dataInicio = resultSet.getString("datainicio");
				String dataFinal = resultSet.getString("datafinal");
				String projeto = resultSet.getString("projeto");

				Atividade atividade = new Atividade();
				atividade.setId(idRs);
				atividade.setNome(nome);
				atividade.setResponsavel(responsavel);
				atividade.setPrioridade(prioridade);
				atividade.setStatus(status);
				atividade.setDescricao(descricao);
				atividade.setDataInicio(dataInicio);
				atividade.setDataFinal(dataFinal);
				atividade.setProj(projeto);

				return atividade;
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

	public List<Atividade> list() throws SQLException {
		String sql = "SELECT * FROM atividade";
		PreparedStatement st = null;

		try {
			openConn();
			st = conn.prepareStatement(sql);
			ResultSet resultSet = st.executeQuery();
			List<Atividade> atividade = new ArrayList<Atividade>();

			while (resultSet.next()) {

				int id = resultSet.getInt("id");
				String nome = resultSet.getString("nome");
				String responsavel = resultSet.getString("responsavel");
				String prioridade = resultSet.getString("prioridade");
				String status = resultSet.getString("status");
				String descricao = resultSet.getString("descricao");
				String dataInicio = resultSet.getString("datainicio");
				String dataFinal = resultSet.getString("datafinal");
				String projeto = resultSet.getString("projeto");

				Atividade a = new Atividade();
				a.setId(id);
				a.setNome(nome);
				a.setResponsavel(responsavel);
				a.setPrioridade(prioridade);
				a.setStatus(status);
				a.setDescricao(descricao);
				a.setDataInicio(dataInicio);
				a.setDataFinal(dataFinal);
				a.setProj(projeto);
				atividade.add(a);
			}

			return atividade;
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
