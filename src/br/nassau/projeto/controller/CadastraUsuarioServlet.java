package br.nassau.projeto.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.nassau.projeto.dao.DaoUsuario;
import br.nassau.projeto.dao.DaoUsuarioImpl;
import br.nassau.projeto.model.Usuario;

/**
 * Servlet implementation class CadastraUsuarioServlet
 */
@WebServlet("/CadastraUsuarioServlet")
public class CadastraUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	private DaoUsuario daoUsuario;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		daoUsuario = new DaoUsuarioImpl();
	}
	
    public CadastraUsuarioServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String nome = request.getParameter("nome");
		String senha = request.getParameter("senha");
		
		
		Usuario u = new Usuario();
		u.setEmail(email);
		u.setNome(nome);
		u.setSenha(senha);
		
		try {
			daoUsuario.save(u);
			
			response.sendRedirect("indexoperador.html");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
