package br.nassau.projeto.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.nassau.projeto.model.Usuario;

public class DaoUsuarioImpl extends GenericDao implements DaoUsuario{

	public void save(Usuario usuario) throws SQLException{
		String sql = "INSERT INTO usuario (nome, email, senha, tipoUsuario, funcao) VALUES (?,?,?,?,?)";	
		PreparedStatement st = null;
		try {
			openConn();
			st = conn.prepareStatement(sql);
			st.setString(1, usuario.getNome());
			st.setString(2, usuario.getEmail());
			st.setString(3, usuario.getSenha());
			st.setString(4, usuario.getTipoUsuario());
			st.setString(5, usuario.getFuncao());
			st.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(st != null)
				st.close();
			closeConn();
		}	
	}
	
	public void update(Usuario usuario) throws SQLException{
		String sql = "UPDATE usuario SET nome=?, email=?, senha=?, tipoUsuario=?, funcao=? WHERE id=?";
		PreparedStatement st = null;
		try {
			openConn();
			st = conn.prepareStatement(sql);
			st.setString(1, usuario.getNome());
			st.setString(2, usuario.getEmail());
			st.setString(3, usuario.getSenha());
			st.setString(4, usuario.getTipoUsuario());
			st.setString(5, usuario.getFuncao());
			st.setInt(6, usuario.getId());
			st.execute();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			if(st != null)
				st.close();
			closeConn();
		}
	}
	
	public void validarUsuario(Usuario usuario) throws SQLException{
		String sql = "UPDATE usuario SET tipoUsuario=? WHERE id=?";
		PreparedStatement st = null;
		try {
			openConn();
			st = conn.prepareStatement(sql);
			st.setString(1, usuario.getTipoUsuario());
			st.setInt(2, usuario.getId());
			st.execute();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			if(st != null)
				st.close();
			closeConn();
		}
	}
	
	public void updateSenha(Usuario usuario, Integer id) throws SQLException{
		String sql = "UPDATE usuario SET senha=? WHERE id=?";
		PreparedStatement st = null;
		try {
			openConn();
			st = conn.prepareStatement(sql);
			st.setString(1, usuario.getSenha());
			st.setInt(2, id);
			st.execute();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			if(st != null)
				st.close();
			closeConn();
		}
	}
	
	public void remove(Usuario usuario) throws SQLException{
		remove(usuario.getId());
	}
	
	public void remove(Integer id) throws SQLException{
		String  sql = "DELETE from usuario WHERE id = ?";
		PreparedStatement st = null;
		try {
			openConn();
			st = conn.prepareStatement(sql);
			st.setInt(1, id);
			st.execute();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			if(st != null)
				st.close();
			closeConn();
		}
	}
	
	public Usuario get(int id) throws SQLException{
		String sql = "SELECT * FROM usuario WHERE id=?";
		PreparedStatement st = null;
		try {
			openConn();
			st = conn.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet resultSet = st.executeQuery();
			
			if( resultSet.next() ){
				int idRs = resultSet.getInt("id");
				String nome = resultSet.getString("nome");
				String email = resultSet.getString("email");
				String senha = resultSet.getString("senha");
				String tipoUsuario = resultSet.getString("tipoUsuario");
				String funcao = resultSet.getString("funcao");
				
				Usuario usuario = new Usuario();
				usuario.setId(idRs);
				usuario.setNome(nome);
				usuario.setEmail(email);
				usuario.setSenha(senha);
				usuario.setTipoUsuario(tipoUsuario);
				usuario.setFuncao(funcao);
				
				return usuario;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(st != null)
				st.close();
			closeConn();
		}
		return null;
	}
	
	public List<Usuario> list() throws SQLException{
		String sql = "SELECT * FROM usuario";
		PreparedStatement st = null;
		
		try {
			openConn();
			st = conn.prepareStatement(sql);
			ResultSet resultSet = st.executeQuery();
			List<Usuario> usuarios = new ArrayList<Usuario>();
			
			while( resultSet.next() ){
				
				int id = resultSet.getInt("id");
				String nome = resultSet.getString("nome");
				String email = resultSet.getString("email");
				String senha = resultSet.getString("senha");
				String tipoUsuario = resultSet.getString("tipoUsuario");
				String funcao = resultSet.getString("funcao");
				
				Usuario u = new Usuario();
				u.setId(id);
				u.setNome(nome);
				u.setEmail(email);
				u.setSenha(senha);
				u.setTipoUsuario(tipoUsuario);
				u.setFuncao(funcao);
				usuarios.add(u);
			}
			
			return usuarios;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(st != null)
				st.close();
			conn.close();
		}
		return list();
	}
	
	public boolean autenticaOperador(String email, String senha) throws SQLException{
		String sql = "SELECT email, senha, tipoUsuario FROM usuario WHERE email=?";
		PreparedStatement st = null;
		boolean aut = false;
		
		try{
			openConn();
			st = conn.prepareStatement(sql);
			st.setString(1, email);
			ResultSet resultSet = st.executeQuery();
			
			String tipoUsuario = "Operador";
			
			if( resultSet.next() ){
				if(email.equals(resultSet.getString("email")) && senha.equals(resultSet.getString("senha")) && (tipoUsuario.equals(resultSet.getString("tipoUsuario")))){
					aut = true;
				}
			}	
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			if(st != null)
				st.close();
			conn.close();
		}
		return aut;
	}
	
	public boolean autenticaAdministrador(String email, String senha) throws SQLException{
		String sql = "SELECT email, senha, tipoUsuario FROM usuario WHERE email=?";
		PreparedStatement st = null;
		boolean aut = false;
		
		try{
			openConn();
			st = conn.prepareStatement(sql);
			st.setString(1, email);
			ResultSet resultSet = st.executeQuery();
			
			String tipoUsuario = "Administrador";
			
			if( resultSet.next() ){
				if(email.equals(resultSet.getString("email")) && senha.equals(resultSet.getString("senha")) && (tipoUsuario.equals(resultSet.getString("tipoUsuario")))){
					aut = true;
				}
			}	
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			if(st != null)
				st.close();
			conn.close();
		}
		return aut;
	}
}
