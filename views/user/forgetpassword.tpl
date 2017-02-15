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
  <<body class="hold-transition lockscreen">
<!-- Automatic element centering -->
<div class="lockscreen-wrapper">
  <div class="lockscreen-logo">
    <a href="/"><b>QA</b>系统</a>
  </div>
  <!-- /.lockscreen-item -->
  <div class="help-block text-center">
    注意事项
  </div>
  <div class="text-center">
    <div class="box-body">
      <div class="panel box box-primary">
        <div class="box-header with-border">
          <h4 class="box-title">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
              如何处理找回密码的问题
            </a>
          </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in">
          <div class="box-body">
            联系公司的IT同事这个由同事帮你找回密码，并且你在有效期内修改密码</br>
            联系方式：XXXXXXXXX</br>
            邮箱：XXXXXXXXXX
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="lockscreen-footer text-center">
    Copyright ©2017 <b><a href="/" class="text-black">张超</a></b><br>
    All rights reserved
  </div>
</div>
</body>
</html>