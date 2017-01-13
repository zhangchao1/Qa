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
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="/" target=""><b>QA</b>系统</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">开始你的QA之旅</p>

    <form action="/api/user/login" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="输入自己的用户名">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="输入自己的密码">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8 ">
          <div class="checkbox">
            <label class="">
              <input type="checkbox">记住密码
            </label>
          </div>
        </div>
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
        </div>
      </div>
    </form>
    <div class="row">
      <div class="col-xs-6">
        <a href="/user/forgetpassword">忘记密码</a>
      </div>
      <div class="col-xs-6">
        <a href="/user/register" class="text-center">注册用户</a>
      </div>
  </div>
</div>
</html>