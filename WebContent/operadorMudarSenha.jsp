<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Mudar Senha</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/full.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/formestilo.css" rel="stylesheet">
</head>
<body id="fundo2">

<!-- Chamadas JavaScript -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
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

<%session.getAttribute("usRs"); %>

<!-- Menu TOP Usuário -->
<ul class="nav navbar-nav navbar-right">
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Menu <b class="caret"></b></a>
<ul class="dropdown-menu">
<li>
<a href="operadorMudarSenha.jsp"><i class="fa fa-fw fa-lock"></i> Senha</a>
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
<div class="collapse navbar-collapse navbar-ex1-collapse">
<ul class="nav navbar-nav side-nav">
<li>
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
<h1 id="titulopag">Senha: <small id="corsmall">Preencha o formulário abaixo para mudar sua senha.</small></h1>
</div>

<!-- Código para mudança de senha -->
<form class="formularioestilo" action="AlteraSenhaOperadorServlet" method="post">
<h1>ALTERAR SENHA:</h1>
<input type="hidden" name="id" class="campoestilo" value="${usRs.getId()}" readonly>
<input type="password" name="senhaOld" class="campoestilo" placeholder="Digite aqui a sua senha antiga." required>
<input type="password" name="senha" class="campoestilo" placeholder="Digite aqui a sua senha nova." required>
<input type="submit" value="SALVAR" class="botaoestilo">
</form>
</body>
</html>