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

/**
 * Servlet implementation class EfetuaLoginServlet
 */
@WebServlet("/EfetuaLoginOperadorServlet")
public class EfetuaLoginOperadorServlet extends HttpServlet {
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
	
    public EfetuaLoginOperadorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		
		
		boolean aut = false;
		
		try {
			aut = daoUsuario.autenticaOperador(email, senha);
			
			if(aut){
				response.sendRedirect("operadorProjeto.jsp");
			}else{
				response.sendRedirect("indexOperador.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
