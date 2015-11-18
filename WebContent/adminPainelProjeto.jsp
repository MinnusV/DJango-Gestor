<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="br.nassau.projeto.model.*" %>
<%@ page import="br.nassau.projeto.dao.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%> 
<%@page import="java.util.List"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Projeto</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-modal.css" rel="stylesheet">
<link href="css/bootstrap-modal-bs3patch.css" rel="stylesheet">
<link href="css/bootstrap-responsive.css" rel="stylesheet">
<link href="css/prettify.css" rel="stylesheet">
<link href="css/full.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/paineladmin.css" rel="stylesheet">
<link href="css/morris.css" rel="stylesheet">
</head>
<body>

<!-- Chamadas JavaScript -->
<script src="js/jquery.js"></script>
<script src="js/jquery.flot.js"></script>
<script src="js/jquery.flot.pie"></script>
<script src="js/jquery.flot.resize.js"></script>
<script src="js/jquery.flot.tooltip.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/bootstrap-modal.js"></script>
<script src="js/bootstrap-modalmanager.js"></script>
<script src="js/npm.js"></script>
<script src="js/phael.min.js"></script>
<script src="js/morris.js"></script>
<script src="js/morris-data.js"></script>
<script src="js/flot-data.js"></script>

<!-- Início do código -->
<div id="wrapper">

<!-- Menu TOP -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">

<!-- Função Responsiva -->
<div class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand" href="indexAdminPainel.jsp" style="font-family: Lucida Console;">DJANGO ADMIN PAINEL</a>
</div>

<%session.getAttribute("usRs"); %>

<!-- Menu TOP Usuário -->
<ul class="nav navbar-right top-nav">
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${usRs.getNome()} <b class="caret"></b></a>
<ul class="dropdown-menu">
<li>
<li>
<a href="adminpainelmudarsenha.html"><i class="fa fa-fw fa-lock"></i> Senha</a>
</li>
<li class="divider"></li>
<li>
<a href="EfetuaLogoutAdministradorServlet"><i class="fa fa-fw fa-power-off"></i> Deslogar</a>
</li>
</li>
</ul>
</li>
</ul>

<!-- Menu Esquedo -->
<div class="collapse navbar-collapse navbar-ex1-collapse">
<ul class="nav navbar-nav side-nav">
<li>
<a href="indexAdminPainel.jsp"><i class="fa fa-fw fa-home"></i> Início</a>
</li>
<li class="active">
<a href="adminPainelProjeto.jsp"><i class="fa fa-fw fa-folder"></i> Projeto</a>
</li>
<li>
<a href="adminPainelSolicitacao.jsp"><i class="fa fa-fw fa-toggle-up"></i> Solicitação</a>
</li>
<li>
<a href="adminPainelUsuario.jsp"><i class="fa fa-fw fa-reorder"></i> Usuário</a>
</li>
</ul>
</div>
</nav>

<div id="page-wrapper">
<div class="container-fluid">

<!-- Cabeçalho -->
<div class="row">
<div class="col-lg-12">
<h1 class="page-header" id="fontepadrao">Projeto: <small>Confira aqui o(s) projeto(s) cadastrado(s) no sistema.</small></h1>
</div>
</div>

<!-- Lista de projetos -->
	<%
		DaoProjeto daoProjeto = new DaoProjetoImpl();
		List<Projeto> listaProj = daoProjeto.list();
		for(Projeto p : listaProj){
	%>
<div class="panel-group" id="accordion">
<div class="panel panel-primary">
<div class="panel-heading">
<h3 class="panel-title" id="fontepadrao">
<a data-toggle="collapse" data-target="#<%=p.getId() %>" href="#<%=p.getId() %>" class="collapsed"><%=p.getNome() %></a>
</h3>
</div>
<div id="<%=p.getId() %>" class="panel-collapse collapse">
<div class="panel-body">
<button class="btn btn-warning btn-xs" data-toggle="modal" href="#full-width2" id="fontebotao" data-dismiss="modal">DETALHES</button> 
<a class="btn btn-danger btn-xs" href="RemoveProjetoServlet?id=<%=p.getId() %>" id="fontebotao">EXCLUIR PROJETO</a>
<p></p>

<!-- Lista de atividades -->
<div class="panel panel-default">
			<%
			String url = "jdbc:mysql://localhost:3306/gestor";
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url, "root", "root");	
			
				Statement statement = connection.createStatement();
				
				String sql = "SELECT atividade.id AS ID, atividade.nome AS NOME, projeto.nome AS PROJETO FROM atividade" +
				" INNER JOIN projeto" +
				" ON atividade.projeto = projeto.id" +
				" WHERE projeto.id = 1";
				
				ResultSet resultSet = statement.executeQuery(sql);
			%>
			<div class="panel-heading">
			<h3 class="panel-title" id="fontepadrao" style="display:inline;">Atividade(s):</h3>
			</div>
			<div class="panel-body">
			<%
				while(resultSet.next()){
			%>
			<button class="btn btn-warning btn-xs" data-toggle="modal" href="#full-width4" id="fontebotao" data-dismiss="modal">DETALHES</button> 
			<a class="btn btn-danger btn-xs" href="RemoveAtividadeServlet?id=<%=resultSet.getInt(1) %>" id="fontebotao">X</a> 
			<b><%=resultSet.getString(2) %></b><br>
			<%
				}
			%>
			</div>
</div>
</div>
</div>
</div>
</div>
<%
		}
%>

<!-- Código responsável por exibir detalhes do projeto -->
<div id="full-width2" class="modal container fade" tabindex="-1" style="display: none;" data-width="500" data-backdrop="static" data-keyboard="false">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
<h4 class="modal-title" id="fontepadrao">Detalhes do projeto:</h4>
</div>

<form style="margin: 10px">
<div class="form-group">
<label id="fontepadrao">Nome:</label>
<input type="text" class="form-control" disabled>
</div>

<div class="form-group">
<label id="fontepadrao">Responsável(is):</label>
<input type="text" class="form-control" disabled>
</div>

<div class="form-group">
<label id="fontepadrao">Descrição:</label>
<textarea class="form-control" rows="2" disabled></textarea>
</div>
</form>

<!-- Botão de ok do modal detalhes do projeto -->
<div class="modal-footer">
<button type="button" data-dismiss="modal" class="btn btn-success" id="fontebotao">OK</button>
</div>
</div>

<!-- Código responsável por exibir os detalhes de cada atividade -->
<div id="full-width4" class="modal container fade" tabindex="-1" style="display: none;" data-width="500" data-backdrop="static" data-keyboard="false">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
<h4 class="modal-title" id="fontepadrao">Detalhes da atividade:</h4>
</div>

<form style="margin: 10px">
<div class="form-group">
<label id="fontepadrao">Nome:</label>
<input type="text" class="form-control" disabled>
</div>

<div class="form-group">
<label id="fontepadrao">Responsável(is):</label>
<input type="text" class="form-control" disabled>
</div>

<div class="form-group">
<label id="fontepadrao">Prioridade:</label>
<input type="text" class="form-control" disabled>
</div>

<div class="form-group">
<label id="fontepadrao">Tempo:</label>
<input type="text" class="form-control" disabled>
</div>

<div class="form-group">
<label id="fontepadrao">Descrição:</label>
<textarea class="form-control" rows="3" disabled></textarea>
</div>
</form>

<!-- Botão de ok do modal detalhes de atividade -->
<div class="modal-footer">
<button type="button" data-dismiss="modal" class="btn btn-success" id="fontebotao">OK</button>
</div>
</div>

</div>
</div>
</div>

</body>
</html>