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
<title>Admin Usuário</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-modal.css" rel="stylesheet">
<link href="css/bootstrap-modal-bs3patch.css" rel="stylesheet">
<link href="css/full.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/paineladmin.css" rel="stylesheet">
<link href="css/morris.css" rel="stylesheet">
<link href="css/prettify.css" rel="stylesheet">
<link href="css/bootstrap-responsive.css" rel="stylesheet">
</head>
<body>

<!-- Chamadas JavaScript -->
<script src="js/jquery.js"></script>
<script src="js/jquery.flot.js"></script>
<script src="js/jquery.flot.pie"></script>
<script src="js/jquery.flot.resize.js"></script>
<script src="js/jquery.flot.tooltip.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/npm.js"></script>
<script src="js/phael.min.js"></script>
<script src="js/morris.js"></script>
<script src="js/morris-data.js"></script>
<script src="js/flot-data.js"></script>
<script src="js/bootstrap-modal.js"></script>
<script src="js/bootstrap-modalmanager.js"></script>

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
<li>
<a href="adminPainelProjeto.jsp"><i class="fa fa-fw fa-folder"></i> Projeto</a>
</li>
<li>
<a href="adminPainelSolicitacao.jsp"><i class="fa fa-fw fa-toggle-up"></i> Solicitação</a>
</li>
<li class="active">
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
<h1 class="page-header" id="fontepadrao">Usuário: <small>Confira aqui o(s) usuário(s) cadastrado(s) no sistema.</small></h1>
</div>
</div>

	<%
		String url = "jdbc:mysql://localhost:3306/gestor";
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(url, "root", "root");	
		
			Statement statement = connection.createStatement();
		
			String sql = "SELECT usuario.nome AS NOME, usuario.email AS EMAIL, funcao.tipoFuncao AS FUNCAO," +
						" usuario.tipoUsuario AS TIPO, usuario.id AS ID FROM usuario" +
						" INNER JOIN funcao" +
						" ON usuario.funcao = funcao.id" +
						" WHERE usuario.tipoUsuario <> 'null'";
			
			ResultSet resultSet = statement.executeQuery(sql);
	%>

<!-- Tabela com lista de usuários -->
<div class="table-responsive">
<table class="table table-bordered table-hover table-striped" style="width: 900px; margin: auto;">
<thead>
<tr class="titulotabela">
<th>NOME:</th>
<th>E-MAIL:</th>
<th>FUNÇÃO:</th>
<th>TIPO:</th>
<th>OPER:</th>
</tr>
</thead>
<tbody>
<%while(resultSet.next()){ %>
<tr class="fundotabela">
<td><%= resultSet.getString(1) %></td>
<td><%= resultSet.getString(2) %></td>
<td><%= resultSet.getString(3) %></td>
<td><%= resultSet.getString(4) %></td>
<td style="text-align: center;">
<a class="btn btn-danger btn-xs" href="RemoveUsuarioServlet?id=<%=resultSet.getString(5) %>" id="fontebotao">X</a>
</td>
</tr>
<%} %>
</tbody>
</table>
</div>
</div>
</div>
</div>

</body>
</html>