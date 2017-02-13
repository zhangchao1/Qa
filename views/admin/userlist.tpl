{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        用户列表
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">管理员</a></li>
        <li class="active">用户列表</li>
      </ol>
    </section>
    <section class="content" id="admin_userlist">
    <div class="box">
            <div class="box-header">
            <div class="input-group input-group-sm" style="width:400px;">
              <input type="text" name="table_search" class="form-control" placeholder="查询用户" id="searvalue">
              <div class="input-group-btn">
                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
              </div>
            </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tbody><tr>
                  <th>Uid</th>
                  <th>名字</th>
                  <th>操作</th>
                  <th>更新时间</th>
                </tr>
                <tr v-for="item in items">
                  <td>{[ item.Uid ]}</td>
                  <td>{[ item.UserName ]}</td>
                  <td>
                  <a class="btn btn-info" href="/admin/editaccount/{[ item.Uid ]}">编辑</a>
                  <a class="btn btn-danger" href="/admin/updatepassword/{[ item.Uid ]}">更改密码</a>
                  </td>
                  <td>{[ item.Updated ]}</td>
                </tr>
              </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>
   </section>
</div>
<script>
	Vue.config.delimiters = ['{[', ']}']
	var vue = new Vue({
        el: '#admin_userlist',
        data: {
        	   items:""
        },
        methods:{
        	 loadData:function(start){
            var start = start
            var max = 20
            this.$http.get('/api/admin/userlist?start='+ start +"&max="+max, [], []).then(function(response){
              if(response.data.IsSuccess == true){
                  this.items = response.data.data.Datas
                  console.log(this.items)
              }else{
                  alert(response.data.ErrMsg);
              }
              }, function(response){
              alert('提交失败')
            });
          },
        },
        ready:function(){
         	this.loadData(1)
        },
    });
</script>
{{template "footer.tpl" .}}