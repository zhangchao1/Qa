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
                 </form>
              </div>
              <div class="box-footer">
                  <button type="submit" class="btn btn-info">保存</button>
              </div>
            <div id="tree">
    	

		    </div>
        </div>
      </div>
   </section>
</div>
<link href="https://cdn.bootcss.com/bootstrap-treeview/1.2.0/bootstrap-treeview.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/bootstrap-treeview/1.2.0/bootstrap-treeview.min.js"></script>
<script>
	Vue.config.delimiters = ['{[', ']}']
	var tree;
    var vue = new Vue({
        el: '#admin_user_add',
        data: {

    	},
        methods:{

        },
        ready:function(){
          
        },
    });
</script>
{{template "footer.tpl" .}}