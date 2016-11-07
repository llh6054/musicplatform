<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Navbar Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath() %>/css/bootstrap.css" rel="stylesheet">

  <style type="text/css">
  	body {
	  padding-top: 20px;
	  padding-bottom: 20px;
	}
	
	.navbar {
	  margin-bottom: 20px;
	}
  	
  </style>


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">

      <!-- Static navbar -->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">音乐平台管理系统</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="<%=request.getContextPath() %>/music/admin_music_operate">歌曲管理</a></li>
              <li><a href="<%=request.getContextPath() %>/musicList/admin_musiclist_operate">歌单管理</a></li>
              <li><a href="<%=request.getContextPath() %>/singer/admin_singer_operate">歌手管理</a></li>
              <li><a href="<%=request.getContextPath() %>/user/admin_user_operate">用户管理</a></li>
            </ul>
 
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>欢迎登陆音乐系统后台！！！</h1>
        <p>在这里你可以上传歌曲、编辑歌单、管理用户，但是您的操作关系到用户的体验，请慎重</p>
        <p>
          <a class="btn btn-lg btn-primary" href="#" role="button">查看操作手册 &raquo;</a>
        </p>
      </div>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<%=request.getContextPath() %>/js/jquery-1.12.3.min.js"></script>
    <script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
  </body>
</html>
