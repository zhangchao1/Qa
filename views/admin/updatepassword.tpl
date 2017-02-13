{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        用户密码更改
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">管理员</a></li>
        <li class="active">用户密码更改</li>
      </ol>
    </section>
    <section class="content" id="admin_updatepassword">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">更改密码</h3>
                  <div class="pull-right">
                  </div>
            </div>
              <div class="box-body">
              	<validator name="validation1">
              	<form role="form">
	              <div class="form-group">
	                  <label>密码</label>
	                  <input type="password" class="form-control" placeholder="输入英文" v-model="password">
	              </div>
	              <div class="form-group">
	                  <label>再次输入密码</label>
	                  <input type="password" class="form-control" placeholder="输入英文" v-model="confirmPassword">
	              </div>
                 </form>
                 </validator>
              </div>
              <div class="box-footer">
                  <button type="submit" class="btn btn-info" v-on:click="save" :disabled="!$validation1.valid">保存</button>
              </div>
        </div>
      </div>

   </section>
</div>
<script>
	Vue.config.delimiters = ['{[', ']}']
	var vue = new Vue({
        el: '#admin_updatepassword',
        data: {
        	   items:"",
        	   password:"",
        	   confirmPassword:""
        },
        methods:{
        	 save:function() {
        	 }
        },
        ready:function(){
         	
        },
    });
</script>
{{template "footer.tpl" .}}