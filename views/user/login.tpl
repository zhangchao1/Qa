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
  <script src="/static/js/vue.js"></script>
  <script src="/static/js/vue-validator.js"></script>
  <script src="/static/js/vue-resource.min.js"></script>
  </head>
<body class="hold-transition login-page">
<div class="login-box" id="user_login">
  <div class="login-logo">
    <a href="/" target=""><b>QA</b>系统</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">开始你的QA之旅</p>
    <form action="" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="输入自己的用户名" v-model="Name">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="输入自己的密码" v-model="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-6">
          <div class="checkbox">
            <label class="">
              <input type="checkbox">记住密码
            </label>
          </div>
        </div>
        <div class="col-xs-6">
          <button type="button" class="btn btn-primary btn-block btn-flat" id="login_status" v-on:click="login">登录</button>
        </div>
      </div>
    </form>
    <div class="row">
      <div class="col-xs-6">
        <a href="/user/forgetpassword">忘记密码</a>
      </div>
  </div>
</div>
<script>
  Vue.config.delimiters = ['{[', ']}']
    var vue = new Vue({
        el: '#user_login',
        data: {
          Name:"",
          Password:""
        },
        methods:{
          login:function(){
              if(this.Name=="" || this.Password==""){
                $("#login_status").text("用户名或者密码为空")
                return
              }
              this.$http.post('/api/user/login?name='+this.Name+"&password="+this.Password, [], []).then(function(response){
                if(!response.data.IsSuccess){
                    alert(response.data.ErrMsg);
                }else{
                  window.location.href="/"
                }
              }, function(response){
                alert('提交失败')
              });
            },
        },
        ready:function(){
         
        },
    });
</script>
</html>