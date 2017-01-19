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
              	<form role="form">
                  <div class="form-group">
                      <label>用户名</label>
                      <input type="text" class="form-control" placeholder="输入英文" v-model="Name" v-validate:Name="['required']">
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
                 </form>
              </div>
              <div class="box-footer">
                  <button type="submit" class="btn btn-info">保存</button>
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
        	Did:0
    	},
        methods:{
        	zTreeOnCheck:function (event, treeId, treeNode) {
			 var tid_name = treeNode.tId
			 var tid = tid_name.split("_");
			 this.Did = tid[1]
			 console.log(this.Did)
		  }
        },
        ready:function(){
       	 var nodes
     	 var setting = {
     	 	callback: {onClick: this.zTreeOnCheck}
     	 }
	     $.getJSON(
		    '/api/article/test',
		    function(data) {
		    	console.log(data.Data[0])
		        zTreeObj = $.fn.zTree.init($("#showde"), setting, data.Data[0]);
		    });

        },
    });
</script>
{{template "footer.tpl" .}}