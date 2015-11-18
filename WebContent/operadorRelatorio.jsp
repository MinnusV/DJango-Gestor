<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Relatório</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-modal.css" rel="stylesheet">
<link href="css/bootstrap-modal-bs3patch.css" rel="stylesheet">
<link href="css/bootstrap-responsive.css" rel="stylesheet">
<link href="css/prettify.css" rel="stylesheet">
<link href="css/full.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
</head>
<body id="fundo2">

<!-- Chamadas JavaScript -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/npm.js"></script>
<script src="js/bootstrap-modal.js"></script>
<script src="js/bootstrap-modalmanager.js"></script>

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

<!-- Menu TOP Usuário -->
<ul class="nav navbar-nav navbar-right">
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Menu <b class="caret"></b></a>
<ul class="dropdown-menu">
<li>
<li>
<a href="operadormudarsenha.html"><i class="fa fa-fw fa-lock"></i> Senha</a>
</li>
<li class="divider"></li>
<li>
<a href="indexoperador.html"><i class="fa fa-fw fa-power-off"></i> Deslogar</a>
</li>
</li>
</ul>
</li>
</ul>

<!-- Menu Esquerdo -->
<div class="collapse navbar-collapse navbar-ex1-collapse">
<ul class="nav navbar-nav side-nav">
<li>
<a href="operadorProjeto.jsp"><i class="fa fa-fw fa-folder"></i> PROJETO</a>
</li>
<li class="active">
<a href="operadorRelatorio.jsp"><i class="fa fa-fw fa-bar-chart"></i> RELATÓRIO</a>
</li>
</ul>
</div>
</div>
</nav>

<!-- Texto e botão do título da página -->
<div class="page-header">
<h1 id="titulopag">Relatório: <small id="corsmall">Confira aqui o relatório da(s) sua(s) atividade(s).</small></h1>
</div>

		<% 
		String url = "jdbc:mysql://localhost:3306/gestor";
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(url, "root", "root");

            Statement statement = connection.createStatement();

            String sql = "SELECT projeto.nome AS PROJETO, usuario.nome AS RESPONSAVEL, funcao.tipoFuncao AS FUNCAO," + 
            		"atividade.nome AS ATIVIDADE, atividade.prioridade AS PRIORIDADE," +
            		" atividade.datainicio AS 'DATA INICIAL' , atividade.datafinal AS 'DATA FINAL'," + 
            		" atividade.status AS 'STATUS%' FROM atividade" +
            		" INNER JOIN usuario" +
            		" ON atividade.responsavel = usuario.id INNER JOIN projeto" +
            		" ON atividade.projeto = projeto.id INNER JOIN funcao" +
            		" ON usuario.funcao = funcao.id";
            
            ResultSet resultSet = statement.executeQuery(sql);
        %>

<!-- Tabela relatório -->
<div class="table-responsive">
<table class="table table-bordered table-hover table-striped" style="width: 1200px; margin: auto;">
<thead>
<tr class="titulotabela">
<th>PROJETO:</th>
<th>RESPONSÁVEL:</th>
<th>FUNÇÃO:</th>
<th>ATIVIDADE:</th>
<th>PRIORIDADE:</th>
<th>DATA INÍCIO:</th>
<th>DATA FINAL:</th>
<th>STATUS:</th>
</tr>
</thead>
<tbody>
<%while(resultSet.next()){ %>
<tr class="fundotabela">
<td><%= resultSet.getString(1) %></td>
<td><%= resultSet.getString(2) %></td>
<td><%= resultSet.getString(3) %></td>
<td><%= resultSet.getString(4) %></td>
<td><%= resultSet.getString(5) %></td>
<td><%= resultSet.getString(6) %></td>
<td><%= resultSet.getString(7) %></td>
<td><%= resultSet.getString(8) + "%" %></td>
</tr>
<%} %>
</tbody>
</table>
</div>
</body>
</html>