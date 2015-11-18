package br.nassau.projeto.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.nassau.projeto.dao.DaoAtividade;
import br.nassau.projeto.dao.DaoAtividadeImpl;
import br.nassau.projeto.model.Atividade;

/**
 * Servlet implementation class RemoveAtividadeServlet
 */
@WebServlet("/RemoveAtividadeServlet")
public class RemoveAtividadeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	private DaoAtividade daoAtividade;
	
	@Override
	public void init(ServletConfig config) throws ServletException{
		super.init(config);
		daoAtividade = new DaoAtividadeImpl();
	}
	
    public RemoveAtividadeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idAtividadeStr = request.getParameter("id");
		Integer idAtividade = Integer.valueOf(idAtividadeStr);
		
		Atividade a = new Atividade();
		a.setId(idAtividade);
		try{
			daoAtividade.remove(a);
			
			response.sendRedirect("operadorProjeto.jsp");
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
