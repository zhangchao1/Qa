{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        加班记录
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">加班管理</a></li>
        <li class="active">加班记录</li>
      </ol>
    </section>
    <section class="content" id="overtime_record">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
            <div class="input-group input-group-sm" style="width: 300px;">
              <input type="text" name="table_search" class="form-control pull-right" placeholder="标题/标签/类型/用户uid">
              <div class="input-group-btn">
                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
              </div>
            </div>
            </div>
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tbody><tr>
                  <th>ID</th>
                  <th>用户</th>
                  <th>标题</th>
                  <th>点赞数</th>
                  <th>浏览数</th>
                  <th>评论数</th>
                  <th>更新时间</th>
                  <th>创建时间</th>
                  <th>操作</th>
                  <th>详情</th>
                </tr>
                <tr v-for="item in items">
                  <td>{[item.Id]}</td>
                  <td>{[item.Uid]}</td>
                  <td>{[item.Title]}</td>
                  <td>{[item.AdmireNum]}</td>
                  <td>{[item.ViewNum]}</td>
                  <td>{[item.CommentNum]}</td>
                  <td>{[item.Updated]}</td>
                  <td>{[item.Created]}</td>
                  <td><a class="btn btn-info" href="/article/edit/{[item.Id]}">编辑</a></td>
                  <td><a class="btn btn-primary" href="/article/detail/{[item.Id]}">详情</a></td>
                </tr>
              </tbody></table>
            </div>
            <div class="box-footer clearfix">
                    <vue-pagination :cur.sync="currentpage" :all.sync="total" v-on:btn-click="loadData()"></vue-pagination>
              </div>
          </div>
        </div>
      </div>
   </section>
</div>
<script src="/static/js/vue-page.js"></script>
<script>
  Vue.config.delimiters = ['{[', ']}']
  var vue = new Vue({
        el: '#overtime_record',
        data: {
          items:{},
          currentpage:1,
          total:0
        },
        components:{VuePagination},
        methods:{
          loadData:function(){
            var start = this.currentpage
            var max = 20
            this.$http.get('/api/article/myarticle?start='+ start +"&max="+max, [], []).then(function(response){
                  console.log(response)
              if(response.data.IsSuccess == true){
                  this.items = response.data.data.Datas
                  this.total = response.data.data.Total
                  console.log(this.items)
              }else{
                  alert(response.data.ErrMsg);
              }
              }, function(response){
              alert('提交失败')
            });
          },
        },
        ready :function(){
          
        }
    });
</script>
{{template "footer.tpl" .}}