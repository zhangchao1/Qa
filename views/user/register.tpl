<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>QAMS 实用,简单的后台</title>
  <link href="/static/css/bootstrap.min.css" rel="stylesheet">
  <link href="/static/css/ionicons.min.css" rel="stylesheet">
  <link href="/static/css/AdminLTE.min.css" rel="stylesheet">
  <link href="/static/css/_all-skins.min.css" rel="stylesheet">
  <link href="/static/css/font-awesome.min.css" rel="stylesheet">
  <script src="/static/js/jquery.min.js"></script>
  <script src="/static/js/jquery-ui.min.js"></script>
  <script src="/static/js/bootstrap.min.js"></script>
  <script src="/static/js/app.min.js"></script>
  <script src="/static/js/demo.js"></script>
  {{if eq 1 .vueVersion}}
  <script src="/static/js/vue.js"></script>
  <script src="/static/js/vue-validator.js"></script>
  {{else if eq 2 .vueVersion}}
  <script src="/static/js/vue2.min.js"></script>
  {{end}}
  <script src="/static/js/vue-resource.min.js"></script>
  </head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="/"><b>QA</b>系统</a>
  </div>
  <div class="register-box-body">
    <p class="login-box-msg">注册新的QA用户</p>
    <form action="/api/user/register" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="用户名">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="email" class="form-control" placeholder="邮箱">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="密码">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="再次确认密码">
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox">
            <label>
              <input type="checkbox">我同意<a href="#">注册条款</a>
            </label>
          </div>
        </div>
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">注册</button>
        </div>
      </div>
    </form>
  </div>
</div>
</div>
</html>
