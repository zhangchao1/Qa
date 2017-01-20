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
                      <label>用户名</label>
                      <input type="text" class="form-control" placeholder="输入英文" v-model="Name" v-validate:Name="['required']" onkeyup="value=value.replace(/[\W]/g,'') " 
      						onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" >
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
	                  <div class="checkbox">
	                    <label>
	                      <input type="checkbox" v-model="Managers">
	                      是否为后台管理员
	                    </label>
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
	Vue.config.delimiters = ['{[', ']}']
    var vue = new Vue({
        el: '#admin_user_add',
        data: {
        	Did:0,
        	Job:"",
        	Name:"",
        	Level:0,
        	Role:"",
        	Managers:0,
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
        		var params = {
	                Did: this.Did,
	                Job: this.Job,
	                Name: this.Name,
	                Level: this.Level,
	                Role:this.Role,
	                Managers:this.Managers
            	}
            	this.$http.post('/api/admin/creatuser', params, []).then(function(response){
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
	     $.getJSON(
		    '/api/admin/alldeparment',
		    function(data) {
		    	console.log(data.Data[0])
		        zTreeObj = $.fn.zTree.init($("#showde"), setting, data.Data[0]);
		    });
        },
    });
</script>
{{template "footer.tpl" .}}