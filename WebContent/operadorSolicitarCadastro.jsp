<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="br.nassau.projeto.model.Funcao" %> 
<%@ page import="br.nassau.projeto.dao.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%> 
<%@ page import="java.util.List"%> 
<%@ page import="java.sql.*" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cadastrar</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-modal.css" rel="stylesheet">
<link href="css/bootstrap-modal-bs3patch.css" rel="stylesheet">
<link href="css/bootstrap-responsive.css" rel="stylesheet">
<link href="css/prettify.css" rel="stylesheet">
<link href="css/full.css" rel="stylesheet">
</head>
<body id="fundo1">

<!-- Chamadas JavaScript -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/npm.js"></script>
<script src="js/bootstrap-modal.js"></script>
<script src="js/bootstrap-modalmanager.js"></script>

<!-- Função para redirecionar para o indexoperador.html -->
<script type="text/javascript">
function indexoperador(){
location.href="indexOperador.jsp"
}
</script>

<!-- Logo -->
<center><div id="logo" style="margin-top: 40px;"></div></center>

<!-- Mensagem de aviso -->
<div class="container">
<div class="jumbotron corbalao" style="margin-top: 40px;">
<h1 id="msgavisotitulo" class="glyphicon glyphicon-asterisk" aria-hidden="true">Observações importantes:</h1>
<p id="msgavisotexto">-> OBS¹ - O seu cadastro será aceito por um administrador global.</p>
<p id="msgavisotexto">-> OBS² - Efetue o cadastro corretamente para evitar problemas futuros.</p>
<!-- <p id="msgavisotexto">-> OBS³ - Você receberá um e-mail resposta quando o seu cadastro for aceito.</p> -->
<center>
<button class="btn btn-warning btn-lg" data-toggle="modal" href="#full-width" id="fontebotao">CADASTRAR</button> 
<button class="btn btn-primary btn-lg" onClick="indexoperador()" id="fontebotao">VOLTAR</button>
</center>
</div>

<!-- Código responsável por cadastrar novos usuários -->
<div id="full-width" class="modal container fade" tabindex="-1" style="display: none;" data-width="500" data-backdrop="static" data-keyboard="false">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
<h4 class="modal-title" id="fontepadrao">Formulário de cadastro:</h4>
</div>

<form style="margin: 10px" action="CadastraUsuarioServlet" method="post">
<div class="form-group">
<label id="fontepadrao">Nome:</label>
<input type="text" class="form-control" name="nome" placeholder="Digite o seu nome completo." required>
</div>

<div class="form-group">
<label id="fontepadrao">Função:</label>
<select type="text" class="form-control" name="funcao" required>
	<%
		DaoFuncao daoFuncao = new DaoFuncaoImpl();
		List<Funcao> listaFun = daoFuncao.list();
		for(Funcao fun  : listaFun){
	%>
		<option type="funcao" value=<%= fun.getId() %> ><%= fun.getTipoFuncao() %></option>
	<%} %>
</select>
</div>

<div class="form-group">
<label id="fontepadrao">E-mail:</label>
<input type="email" class="form-control" name="email" placeholder="Digite seu e-mail." required>
</div>

<div class="form-group">
<label id="fontepadrao">Senha:</label>
<input type="password" class="form-control" name="senha" placeholder="Digite a sua senha." required>
</div>

<div class="form-group">
<input type="hidden" class="form-control" name="tipoUsuario" value="Espera">
</div>

<!-- Botões de cancelar e salvar formulário -->
<div class="modal-footer">
<button type="reset" data-dismiss="modal" class="btn btn-danger" id="fontebotao" href="#static">CANCELAR</button>
<button type="submit" class="btn btn-primary" id="fontebotao" href="#static">SALVAR</button>
</div>

</form>

<!-- Código responsável pela mensagem de confirmação -->
<div id="static" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" style="display: none;">
<div class="modal-body">
<div class="alert alert-info" role="alert" id="fontepadrao" align="center">SEU CADASTRO FOI EFETUADO COM SUCESSO!</div>
</div>

<!-- Botão de ok -->
<div class="modal-footer">
<button type="submit" class="btn btn-success" id="fontebotao" onClick="indexoperador()">OK</button>
</div>
</div>
</div>
</div>

</body>
</html>