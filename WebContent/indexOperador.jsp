<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DJango Gestor</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/full.css" rel="stylesheet">
<link href="css/loginoperador.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
</head>
<body id="fundo1">

<!-- Chamadas JavaScript -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/npm.js"></script>

<!-- Login -->
<div class="login">
<div class="heading">
<div id="logo" style="margin-top: 40px;"></div>
<h2 id="nomelogin">LOGIN:</h2>

<form action="EfetuaLoginOperadorServlet" method="post">
<%
String url = "jdbc:mysql://localhost:3306/gestor";
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager.getConnection(url, "root", "root");

    Statement statement = connection.createStatement();
    
    String sql = "SELECT usuario.id AS ID FROM usuario" +
    " WHERE usuario.tipoUsuario = 'Operador'";
    
    ResultSet resultSet = statement.executeQuery(sql);
%>
<div class="input-group input-group-lg">
<%while(resultSet.next()){ %>
<input type="hidden" class="form-control" name="id" value="<%=resultSet.getInt(1) %>">
<%} %>
</div>
<div class="input-group input-group-lg">
<span class="input-group-addon"><i class="fa fa-asterisk"></i></span>
<input type="text" class="form-control" name="email" placeholder="E-mail" required>
</div>
<div class="input-group input-group-lg">
<span class="input-group-addon"><i class="fa fa-asterisk"></i></span>
<input type="password" class="form-control" name="senha" placeholder="Senha" required>
</div>
<button type="submit" class="float" id="fontebotao">ENTRAR</button>
</form>
<br>
<center><a class="btn btn-primary btn-xs" href="operadorsolicitarcadastro.html" id="fontebotao">SOLICITAR CADASTRO</a> <a class="btn btn-primary btn-xs" href="operadorrecuperarsenha.html" id="fontebotao">RECUPERAR SENHA</a> <a class="btn btn-danger btn-xs" href="indexAdmin.jsp" id="fontebotao">ADMINISTRAÇÃO</a></center>
</div>
</div>
</body>
</html>