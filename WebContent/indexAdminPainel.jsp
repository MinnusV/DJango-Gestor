<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DJango Admin Painel</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
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
<li class="active">
<a href="indexAdminPainel.jsp"><i class="fa fa-fw fa-home"></i> Início</a>
</li>
<li>
<a href="adminPainelProjeto.jsp"><i class="fa fa-fw fa-folder"></i> Projeto</a>
</li>
<li>
<a href="adminpainelsolicitacao.html"><i class="fa fa-fw fa-toggle-up"></i> Solicitação</a>
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
<h1 class="page-header" id="fontepadrao">Painel: <small>Seja bem-vindo ao seu painel de configurações.</small></h1>
</div>
</div>

<!-- Mensagem de aviso -->
<div class="row">
<div class="col-lg-12">
<div class="alert alert-info alert-dismissable">
<i class="fa fa-info-circle"></i> Controle e configure todas as suas necessidades pelo <strong>DJango Admin Painel</strong>.
</div>
</div>
</div>

<!-- Blocos de estatística -->
<div class="row">
<div class="col-lg-3 col-md-6">
<div class="panel panel-primary">
<div class="panel-heading">
<div class="row">
<div class="col-xs-3">
<i class="fa fa-toggle-up fa-5x"></i>
</div>
<div class="col-xs-9 text-right">
<div class="huge">#</div>
<div>SOLICITAÇÕES</div>
</div>
</div>
</div>
</div>
</div>

<div class="col-lg-3 col-md-6">
<div class="panel panel-green">
<div class="panel-heading">
<div class="row">
<div class="col-xs-3">
<i class="fa fa-folder fa-5x"></i>
</div>
<div class="col-xs-9 text-right">
<div class="huge">#</div>
<div>PROJETOS</div>
</div>
</div>
</div>
</div>
</div>

<div class="col-lg-3 col-md-6">
<div class="panel panel-yellow">
<div class="panel-heading">
<div class="row">
<div class="col-xs-3">
<i class="fa fa-plus fa-5x"></i>
</div>
<div class="col-xs-9 text-right">
<div class="huge">#</div>
<div>ATIVIDADES</div>
</div>
</div>
</div>
</div>
</div>

<div class="col-lg-3 col-md-6">
<div class="panel panel-red">
<div class="panel-heading">
<div class="row">
<div class="col-xs-3">
<i class="fa fa-user fa-5x"></i>
</div>
<div class="col-xs-9 text-right">
<div class="huge">#</div>
<div>USUÁRIOS</div>
</div>
</div>
</div>
</div>
</div>
</div>

</div>
</div>
</div>
</body>
</html>