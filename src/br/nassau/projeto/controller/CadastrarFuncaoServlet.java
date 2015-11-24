package br.nassau.projeto.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.nassau.projeto.dao.DaoFuncao;
import br.nassau.projeto.dao.DaoFuncaoImpl;
import br.nassau.projeto.model.Funcao;

/**
 * Servlet implementation class CadastrarFuncaoServlet
 */
@WebServlet("/CadastrarFuncaoServlet")
public class CadastrarFuncaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	private DaoFuncao daoFuncao;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		daoFuncao = new DaoFuncaoImpl();
	}
	
    public CadastrarFuncaoServlet() {
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
		String tipoFuncao = request.getParameter("funcao");
		
		Funcao f = new Funcao();
		f.setTipoFuncao(tipoFuncao);
		
		try {
			daoFuncao.save(f);
			
			response.sendRedirect("cadastrarFuncao.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
