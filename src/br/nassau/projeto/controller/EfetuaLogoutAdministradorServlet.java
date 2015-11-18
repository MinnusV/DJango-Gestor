package br.nassau.projeto.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import br.nassau.projeto.dao.DaoUsuario;
//import br.nassau.projeto.dao.DaoUsuarioImpl;

/**
 * Servlet implementation class EfetuaLogonAdministradorServlet
 */
@WebServlet("/EfetuaLogoutAdministradorServlet")
public class EfetuaLogoutAdministradorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	@Override
	public void init(ServletConfig config) throws ServletException{
		super.init(config);
	}
	
    public EfetuaLogoutAdministradorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("usRs");

		response.sendRedirect("indexAdmin.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
