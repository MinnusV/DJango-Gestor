<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@page import="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login Admin</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/full.css" rel="stylesheet">
<link href="css/loginadmin.css" rel="stylesheet">
<link href="css/loginoperador.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
</head>
<body id="fundo1">

<!-- Chamadas JavaScript -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/npm.js"></script>

<!-- Logo -->
<center><div id="logo" style="margin-top: 40px;"></div></center>

<!-- Código responsável pelo login -->
<center><h2 id="nomelogin" style="margin-top: 20px;"><i class="fa fa-certificate"></i> PAINEL DE ADMINISTRAÇÃO <i class="fa fa-certificate"></i></h2></center>
<center><h2 id="descrilogin"><i class="fa fa-get-pocket"></i> LOGIN EXCLUSIVO PARA ADMINSTRADOR <i class="fa fa-get-pocket"></i></h2></center>
<section class="main">

<form class="form-1" style="margin-top: 25px;" action="EfetuaLoginAdministradorServlet" method="post">
<%
String url = "jdbc:mysql://localhost:3306/gestor";
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager.getConnection(url, "root", "root");

    Statement statement = connection.createStatement();
    
    String sql = "SELECT usuario.id AS ID FROM usuario" +
    " WHERE usuario.tipoUsuario = 'Administrador'";
    
    ResultSet resultSet = statement.executeQuery(sql);
%>
<%while(resultSet.next()){ %>
<input type="hidden" name="id" value="<%=resultSet.getInt(1) %>">
<%} %>
<p class="field">
<input type="text" name="email" placeholder="E-mail" required>
<i class="fa fa-asterisk"></i>
</p>
<p class="field">
<input type="password" name="senha" placeholder="Senha" required>
<i class="fa fa-asterisk"></i>
</p>
<p class="submit">
<button type="submit" name="submit"><i class="fa fa-sign-in"></i></button>
</p>
</form>

</section>
<center><a class="btn btn-primary btn-xs" href="indexOperador.jsp" id="fontebotao">VOLTAR</a></center>
</body>
</html>