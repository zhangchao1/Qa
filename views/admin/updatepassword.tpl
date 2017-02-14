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
	                  <input type="password" class="form-control" placeholder="输入密码" v-model="password">
	              </div>
	              <div class="form-group">
	                  <label>再次输入密码</label>
	                  <input type="password" class="form-control" placeholder="再次输入密码" v-model="confirmPassword">
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
  var uid = {{.uid}}
	Vue.config.delimiters = ['{[', ']}']
	var vue = new Vue({
        el: '#admin_updatepassword',
        data: {
        	   password:"",
        	   confirmPassword:""
        },
        methods:{
        	 save:function() {
              if(this.password != this.confirmPassword){
                alert("前后输入密码不一致")
                return
              }
              var reg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,10}$/
              if(!reg.test(this.password)||!reg.test(this.confirmPassword)){
                alert("密码长度必须包含字母和数字，且长度必须大于5")
                return
              }
              var params = {
                Uid:uid,
                Password:this.password,
                ConfirmPassword:this.confirmPassword
              }
              this.$http.post('/api/admin/updatepassword', params, []).then(function(response){
                console.log(response)
                if(response.data.IsSuccess == true){
                    alert("保存成功")
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
              });
        	 }
        },
        ready:function(){
         	
        },
    });
</script>
{{template "footer.tpl" .}}