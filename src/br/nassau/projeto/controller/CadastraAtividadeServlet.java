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
 * Servlet implementation class CadastraAtividadeServlet
 */
@WebServlet("/CadastraAtividadeServlet")
public class CadastraAtividadeServlet extends HttpServlet {
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
	
    public CadastraAtividadeServlet() {
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
		String responsavel = request.getParameter("responsavel");
		String[] radio = request.getParameterValues("radio");
		String status = request.getParameter("status");
		String descricao = request.getParameter("descricao");
		String dataInicio = request.getParameter("datainicio");
		String dataFinal = request.getParameter("datafinal");
		String projeto = request.getParameter("projeto");

		
		Atividade a = new Atividade();
		a.setNome(nome);
		a.setResponsavel(responsavel);
		a.setPrioridade(radio[0]);
		a.setStatus(status);
		a.setDescricao(descricao);
		a.setDataInicio(dataInicio);
		a.setDataFinal(dataFinal);
		a.setProj(projeto);
		
		try{
			daoAtividade.save(a);
			
			response.sendRedirect("operadorProjeto.jsp");
		}catch(SQLException e){
			e.printStackTrace();
		}

	}

}
