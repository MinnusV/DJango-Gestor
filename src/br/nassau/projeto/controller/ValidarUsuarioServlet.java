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
 * Servlet implementation class ValidarUsuarioServlet
 */
@WebServlet("/ValidarUsuarioServlet")
public class ValidarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	private DaoUsuario daoUsuario;
	
	public void init(ServletConfig config) throws ServletException{
		super.init(config);
		daoUsuario = new DaoUsuarioImpl();
	}
	
    public ValidarUsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id = Integer.valueOf(request.getParameter("id"));
		String tipoUsuario = "Operador";
		
		Usuario us = new Usuario();
		us.setTipoUsuario(tipoUsuario);
		us.setId(id);
		try {
			daoUsuario.validarUsuario(us);
			
			response.sendRedirect("adminPainelSolicitacao.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
