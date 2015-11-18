<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="br.nassau.projeto.model.*" %>
<%@ page import="br.nassau.projeto.dao.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%> 
<%@ page import="java.util.List"%>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Projeto</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-modal.css" rel="stylesheet">
<link href="css/bootstrap-modal-bs3patch.css" rel="stylesheet">
<link href="css/full.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/checkbox.css" rel="stylesheet">
</head>
<body id="fundo2">

<!-- Chamadas JavaScript -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/bootstrap-modal.js"></script>
<script src="js/bootstrap-modalmanager.js"></script>
<script src="js/npm.js"></script>

<!-- Código Menu TOP -->
<nav class="navbar navbar-default">
<div class="container-fluid">

<!-- Função Responsiva -->
<div class="navbar-header">
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand" >
<img height="20" width="23" src="imgs/logo2.png">
</a>
</div>
<% 
session.getAttribute("usRs");
%>
<!-- Menu TOP Usuário -->
<ul class="nav navbar-nav navbar-right">
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user"></i> ${usRs.getNome()} <b class="caret"></b></a>
<ul class="dropdown-menu">
<li>
<li>
<a href="operadormudarsenha.html"><i class="fa fa-fw fa-lock"></i> Senha</a>
</li>
<li class="divider"></li>
<li>
<a href="indexOperador.jsp"><i class="fa fa-fw fa-power-off"></i> Deslogar</a>
</li>
</li>
</ul>
</li>
</ul>

<!-- Menu Esquerdo -->
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<ul class="nav navbar-nav">
<li class="active">
<a href="operadorProjeto.jsp"><i class="fa fa-fw fa-folder"></i> PROJETO</a>
</li>
<li>
<a href="operadorRelatorio.jsp"><i class="fa fa-fw fa-bar-chart"></i> RELATÓRIO</a>
</li>
</ul>
</div>
</div>
</nav>

<!-- Texto e botão do título da página -->
<div class="page-header">
<h1 id="titulopag">Projeto: <small id="corsmall">Confira aqui todos os projetos cadastrados e suas atividades. <button class="btn btn-success btn-xs" data-toggle="modal" href="#full-width" id="fontebotao" data-dismiss="modal">CADASTRAR NOVO PROJETO</button></small></h1>
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
				DaoAtividade daoAtividade = new DaoAtividadeImpl();
				List<Atividade> listaAtv = daoAtividade.list();
			%>
			<div class="panel-heading">
			<h3 class="panel-title" id="fontepadrao" style="display:inline;">Atividade(s):</h3> <button class="btn btn-success btn-xs" data-toggle="modal" href="#full-width3" id="fontebotao" data-dismiss="modal">CRIAR ATIVIDADE</button>
			</div>
			<div class="panel-body">
			<%
				for(Atividade a : listaAtv){
			%>
			<button class="btn btn-warning btn-xs" data-toggle="modal" href="#full-width4" id="fontebotao" data-dismiss="modal">DETALHES</button> 
			<a class="btn btn-danger btn-xs" href="RemoveAtividadeServlet?id=<%=a.getId() %>" id="fontebotao">X</a> 
			<b><%=a.getNome() %></b><br>
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

<!-- Código responsável por cadastrar novos projetos -->
<div id="full-width" class="modal container fade" tabindex="-1" style="display: none;" data-width="500" data-backdrop="static" data-keyboard="false">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
<h4 class="modal-title" id="fontepadrao">Novo Projeto:</h4>
</div>

<form style="margin: 10px" action="CadastraProjetoServlet" method="post">
<div class="form-group">
<label id="fontepadrao">Nome:</label>
<input type="text" class="form-control" name="nome" placeholder="Digite o nome do projeto." required>
</div>

<div class="form-group">
<label id="fontepadrao">Responsável:</label>
<select type="text" class="form-control" name="responsavel" required>
	<%
		DaoUsuario daoUsuario = new DaoUsuarioImpl();
		List<Usuario> listaCadUs = daoUsuario.list();
		for(Usuario us  : listaCadUs){
	%>
		<option type="usuario" value=<%= us.getId() %> ><%= us.getNome() %></option>
	<%} %>
</select>
</div>

<div class="form-group">
<label id="fontepadrao">Descrição:</label>
<textarea class="form-control" rows="3" name="descricao" placeholder="Digite a descrição completa do seu projeto." required></textarea>
</div>

<!-- Botões de cancelar e salvar cadastro de projeto -->
<div class="modal-footer">
<button type="button" data-dismiss="modal" class="btn btn-danger" id="fontebotao">CANCELAR</button>
<button type="submit" class="btn btn-primary" id="fontebotao">SALVAR</button>
</div>

</form>
</div>

<!-- Código responsável por exibir detalhes do projeto -->
<div id="full-width2" class="modal container fade" tabindex="-1" style="display: none;" data-width="500" data-backdrop="static" data-keyboard="false">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
<h4 class="modal-title" id="fontepadrao">Detalhes do projeto:</h4>
</div>

<form style="margin: 10px">
<div class="form-group">
<label id="fontepadrao">Nome:</label>
<input type="text" class="form-control" readonly>
</div>

<div class="form-group">
<label id="fontepadrao">Responsável:</label>
<input type="text" class="form-control" readonly>
</div>

<div class="form-group">
<label id="fontepadrao">Descrição:</label>
<textarea class="form-control" rows="2" readonly></textarea>
</div>
</form>

<!-- Botão de ok do modal detalhes do projeto -->
<div class="modal-footer">
<button type="button" data-dismiss="modal" class="btn btn-success" id="fontebotao">OK</button>
</div>
</div>

<!-- Código responsável por cadastrar novas atividades -->
<div id="full-width3" class="modal container fade" tabindex="-1" style="display: none;" data-width="500" data-backdrop="static" data-keyboard="false">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
<h4 class="modal-title" id="fontepadrao">Nova atividade:</h4>
</div>

<form style="margin: 10px" action="CadastraAtividadeServlet" method="post">
<div class="form-group">
<label id="fontepadrao">Nome:</label>
<input type="text" class="form-control" name="nome" placeholder="Digite o nome da atividade." required>
</div>

<div class="form-group">
<label id="fontepadrao">Responsável:</label>
<select type="text" class="form-control" name="responsavel" required>
	<%
		DaoUsuario daoUsuario2 = new DaoUsuarioImpl();
		List<Usuario> listaCadAtv = daoUsuario2.list();
		for(Usuario us  : listaCadAtv){
	%>
		<option type="usuario" value=<%= us.getId() %> ><%= us.getNome() %></option>
	<%} %>
</select>
</div>

<div class="form-group">
<label id="fontepadrao">Projeto:</label>
<select type="text" class="form-control" name="projeto" required>
	<%
		DaoProjeto daoProjetoCad = new DaoProjetoImpl();
		List<Projeto> listaCadProj = daoProjetoCad.list();
		for(Projeto pr  : listaCadProj){
	%>
		<option type="usuario" value=<%= pr.getId() %> ><%= pr.getNome() %></option>
	<%} %>
</select>
</div>

<div class="form-group">
<label id="fontepadrao">Prioridade:</label><br>
<label class="radio-inline">
<input type="radio" name="radio" id="radio4" class="css-checkbox" value="baixa" required>
<label for="radio4" class="css-label radGroup2">BAIXA</label>
<input type="radio" name="radio" id="radio5" class="css-checkbox" value="media" required>
<label for="radio5" class="css-label radGroup2">MÉDIA</label>
<input type="radio" name="radio" id="radio6" class="css-checkbox" value="alta" required>
<label for="radio6" class="css-label radGroup2">ALTA</label>
</div>

<div class="form-group">
<input type="hidden" class="form-control" name="status" value="0">
</div>

<div class="form-group">
<label id="fontepadrao">Data Inicio:</label>
<input type="text" class="form-control" name="datainicio" placeholder="Digite a data inicial da atividade." required>
</div>

<div class="form-group">
<label id="fontepadrao">Data Final:</label>
<input type="text" class="form-control" name="datafinal" placeholder="Digite a data final da atividade." required>
</div>

<div class="form-group">
<label id="fontepadrao">Descrição:</label>
<textarea class="form-control" rows="3" name="descricao" placeholder="Digite a descrição completa da sua atividade." required></textarea>
</div>

<!-- Botões de cancelar e salvar cadastro de atividades -->
<div class="modal-footer">
<button type="button" data-dismiss="modal" class="btn btn-danger" id="fontebotao">CANCELAR</button>
<button type="submit" class="btn btn-primary" id="fontebotao">SALVAR</button>
</div>

</form>
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
<input type="text" class="form-control" readonly>
</div>

<div class="form-group">
<label id="fontepadrao">Responsável:</label>
<input type="text" class="form-control" readonly>
</div>

<div class="form-group">
<label id="fontepadrao">Prioridade:</label>
<input type="text" class="form-control" readonly>
</div>

<div class="form-group">
<label id="fontepadrao">Tempo:</label>
<input type="text" class="form-control" readonly>
</div>

<div class="form-group">
<label id="fontepadrao">Descrição:</label>
<textarea class="form-control" rows="3" readonly></textarea>
</div>
</form>

<!-- Botão de ok do modal detalhes de atividade -->
<div class="modal-footer">
<button type="button" data-dismiss="modal" class="btn btn-success" id="fontebotao">OK</button>
</div>
</div>
</body>
</html>