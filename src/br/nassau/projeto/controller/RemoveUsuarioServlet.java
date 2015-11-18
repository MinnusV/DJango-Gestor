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
 * Servlet implementation class RemoveUsuarioServlet
 */
@WebServlet("/RemoveUsuarioServlet")
public class RemoveUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	private DaoUsuario daoUsuario;
	
	@Override
	public void init(ServletConfig config) throws ServletException{
		super.init(config);
		daoUsuario = new DaoUsuarioImpl();
	}
	
    public RemoveUsuarioServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idUsuarioStr = request.getParameter("id");
		Integer idUsuario = Integer.valueOf(idUsuarioStr);
		
		Usuario u = new Usuario();
		u.setId(idUsuario);
		try{
			daoUsuario.remove(u);
			
			response.sendRedirect("adminPainelUsuario.jsp");
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
