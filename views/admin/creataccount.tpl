{{template "header.tpl" .}}

<div class="content-wrapper">
	<section class="content-header">
      <h1>
        创建用户
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">管理员操作</a></li>
        <li class="active">用户创建</li>
      </ol>
    </section>
    <section class="content" id="admin_user_add">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">创建用户</h3>
                  <div class="pull-right">
                  </div>
            </div>
              <div class="box-body">
              	<validator name="validation1">
              	<form role="form">
	              <div class="form-group">
	                  <label>用户名(拼音)</label>
	                  <input type="text" class="form-control" placeholder="输入英文" v-on:change="checkname" v-model="Name" v-validate:Name="['required']" onkeyup="value=value.replace(/[\W]/g,'') " 
	  						onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" >
                <div class="form-group">
                    <label>用户名(中文)</label>
                    <input type="text" class="form-control" placeholder="输入汉字" v-model="UserName" v-validate:UserName="['required']">
	              </div>
	               	<div class="form-group">
	                  <label>性别</label>
	                  <div class="radio">
	                    <label>
	                      <input type="radio" name="optionsRadios" id="optionsRadios1" value="1" checked="checked" v-model="Sex" v-validate:Sex="['required']">
	                     男
	                    </label>
	                  </div>
	                  <div class="radio">
	                    <label>
	                      <input type="radio" name="optionsRadios" id="optionsRadios2" value="2" v-model="Sex" v-validate:Sex="['required']">
	                      女
	                    </label>
	                  </div>
	                <div class="form-group">
                      <label>年龄</label>
                      <input type="number" class="form-control" placeholder="年龄" v-model="Age" v-validate:Age="['required']">
                    </div>
                    <div class="form-group">
	                    <div class="row">
		                    <div class="col-md-6">
		                    	<label>选择部门</label>
		                    </div>
		                    <div class="col-md-6">
			                    <div id="showde" class="ztree">
			    	

					    		</div>
		    				</div>
		    			</div>
		    		</div>
		    		<div class="form-group">
                      <label>职位</label>
                      <input type="text" class="form-control" placeholder="输入职位" v-model="Job" v-validate:Job="['required']">
                    </div>
                    <div class="form-group">
	                <label>职级</label>
	                <select class="form-control select2" v-model="Level" v-validate:Level="['required']">
	                  <option selected="selected" value="1">初级</option>
	                  <option value="2">中级</option>
	                  <option value="3">高级</option>
	                  <option value="4">资深</option>
                    <option value="5">管理层</option>
	                </select>
              		</div>
              		<div class="form-group">
	                <label>团队管理</label>
	                <select class="form-control select2" v-model="Role" v-validate:Role="['required']">
	                  <option selected="selected" value="1">组员</option>
	                  <option value="2">组长</option>
	                  <option value="3">部门副经理</option>
	                  <option value="4">部门经理</option>
	                  <option value="5">部门副总监</option>
	                  <option value="6">部门总监</option>
                    <option value="7">CEO</option>
	                </select>
              		</div>
              		<div class="form-group">
              		  <label>后台权限</label>
	                  <div class="checkbox">
	                    <label>
	                      <input type="checkbox" v-model="Manager">
	                      是否为后台管理员
	                      </label>
	                  </div>
	                </div>
                  <div class="form-group">
                    <label>负责人</label>
                    <select class="form-control select2" id="choose">
                      <option v-for="option in options" v-bind:value="option.uid">{[option.username ]}
                      </option>
                    </select>
                </div>
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
<link href="/static/css/select2.min.css" rel="stylesheet">
<script src="/static/js/select2.full.min.js"></script>
<script src="/static/zTree/js/jquery.ztree.core.js"></script>
<link href="/static/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">
<script>
	Vue.config.delimiters = ['{[', ']}']
    var vue = new Vue({
        el: '#admin_user_add',
        data: {
        	Did:0,
        	Job:"",
        	Name:"",
          UserName:"",
        	Level:0,
        	Role:0,
        	Manager:false,
        	Sex:"",
        	Age:"",
          options:[],
    	},
        methods:{
        	zTreeOnCheck:function (event, treeId, treeNode) {
    			 var tid_name = treeNode.tId
    			 var tid = tid_name.split("_");
    			 this.Did = tid[1]
		      },
  		    save:function(){
  		  		if(this.Did == 0){
  		  			alert("选择员工的部门")
  		  			return
  		  		}
              var manger_type
              var sex
              if (this.Manager == true){
                manger_type = 2
              }else{
                manger_type = 1
              }
              var head = $("#choose").val()
          		var params = {
  	                Did: Number(this.Did),
  	                Job: this.Job,
  	                Name: this.Name,
                    UserName:this.UserName,
  	                Level: Number(this.Level),
  	                Role:Number(this.Role),
  	                Manager:manger_type,
  	                Sex:Number(this.Sex),
  	                Age:Number(this.Age),
                    Head:Number(head)
              	}
              	this.$http.post('/api/admin/creatuser', params, []).then(function(response){
              		console.log(response)
                  if(response.data.IsSuccess == true){
                      alert("保存成功")
                      window.location.href="/admin/userlist"
                  }else{
                      alert(response.data.ErrMsg);
                  }
              	}, function(response){
                  alert('提交失败')
              	});
              },
          checkname:function(){
            var Name = this.Name;
            this.$http.get('/api/admin/checkname?name='+ Name , [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    
                }else{
                    alert(response.data.ErrMsg);
                    return;
                }
              }, function(response){
                alert('提交失败')
            });
          },
          checkUsername:function(){

          },
        },
        ready:function(){
          $("#choose").select2();
       	 var nodes
     	 var setting = {
     	 	callback: {onClick: this.zTreeOnCheck}
     	 }
	     $.getJSON(
		    '/api/admin/alldeparment',
		    function(data) {
		        zTreeObj = $.fn.zTree.init($("#showde"), setting, data.Data[0]);
		    });
        this.$http.get('/api/admin/alluser' , [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    this.options = response.data.Data
                }else{
                    alert(response.data.ErrMsg);
                    return;
                }
              }, function(response){
                alert('提交失败')
            });
        },
    });
</script>
{{template "footer.tpl" .}}