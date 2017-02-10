{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        编辑用户
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">管理员操作</a></li>
        <li class="active">用户编辑</li>
      </ol>
    </section>
    <section class="content" id="admin_user_edit">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">编辑</h3>
                  <div class="pull-right">
                  </div>
            </div>
              <div class="box-body">
              	<validator name="validation1">
              	<form role="form">
	              <div class="form-group">
	                  <label>用户名</label>
	                  <input type="text" class="form-control" placeholder="输入英文" v-model="Name" disabled="">
	              </div>
                <div class="form-group">
                    <label>用户名</label>
                    <input type="text" class="form-control" placeholder="输入英文" v-model="UserName" disabled="">
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
	                  <option selected="selected" value="组员">组员</option>
	                  <option value="组长">组长</option>
	                  <option value="部门副经理">部门副经理</option>
	                  <option value="部门经理">部门经理</option>
	                  <option value="部门副总监">部门副总监</option>
	                  <option value="部门总监">部门总监</option>
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
<script src="/static/zTree/js/jquery.ztree.core.js"></script>
<link href="/static/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">
<script>
var uid = {{.uid}}
	Vue.config.delimiters = ['{[', ']}']
    var vue = new Vue({
        el: '#admin_user_edit',
        data: {
        	Did:0,
        	Job:"",
        	Level:0,
        	Role:"",
          Name:"",
          UserName:"",
        	Manager:false,
        	Sex:"",
        	Age:""
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
            if (this.sex == 0){
              sex = 1
            }else{
              sex = 2
            }
    		var params = {
                Did: Number(this.Did),
                Job: this.Job,
                Level: Number(this.Level),
                Role:this.Role,
                Manager:manger_type,
                Sex:sex,
                Age:Number(this.Age),
                Uid:uid
        	}
        	this.$http.post('/api/admin/edituser', params, []).then(function(response){
        		console.log(response)
            if(response.data.IsSuccess == true){
                alert("保存成功")
                window.location.href="/article/my"
            }else{
                alert(response.data.ErrMsg);
            }
        	}, function(response){
            alert('提交失败')
        	});
            }
        },
        ready:function(){
       	 var nodes
       	 var setting = {
       	 	callback: {onClick: this.zTreeOnCheck}
       	 }
         this.$http.get('/api/admin/getuser?uid='+ uid, [], []).then(function(response){
                console.log(response)
                if(response.data.IsSuccess == true){
                    this.Job = response.data.Data.Job
                    this.Name = response.data.Data.Name
                    this.Age = response.data.Data.Age
                    this.Role = response.data.Data.Role
                    this.Level = response.data.Data.Level
                    this.Did = response.data.Data.Did
                    console.log(this.Did)
                    this.Sex = (response.data.Data.Sex ==2)? "2": "1"
                    this.Manager = (response.data.Data.Manager ==2)? true: false
                    this.UserName = response.data.Data.UserName
                    var vthis=this;
                    $.getJSON(
                      '/api/admin/alldeparment',
                      function(data) {
                          console.log(data)
                          zTreeObj = $.fn.zTree.init($("#showde"), setting, data.Data[0]);
                          console.log(vthis.Did)
                          var node = zTreeObj.getNodeByTId(vthis.Did.toString());
                          console.log(node)
                          zTreeObj.selectNode(node);
                      });
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
            });
        },
    });
</script>
{{template "footer.tpl" .}}