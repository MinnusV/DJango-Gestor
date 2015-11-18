package br.nassau.projeto.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.nassau.projeto.dao.DaoProjeto;
import br.nassau.projeto.dao.DaoProjetoImpl;
import br.nassau.projeto.model.Projeto;

/**
 * Servlet implementation class CadastraProjetoServlet
 */
@WebServlet("/CadastraProjetoServlet")
public class CadastraProjetoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	private DaoProjeto daoProjeto;
	
	@Override
	public void init(ServletConfig config) throws ServletException{
		super.init(config);
		daoProjeto = new DaoProjetoImpl();
	}
	
    public CadastraProjetoServlet() {
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
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		String responsavel = request.getParameter("responsavel");
		
		Projeto p = new Projeto();
		p.setNome(nome);
		p.setDescricao(descricao);
		p.setResp(responsavel);
		
		try{
			daoProjeto.save(p);

			response.sendRedirect("operadorProjeto.jsp");
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	}

}
