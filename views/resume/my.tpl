{{template "header.tpl" .}}
<div class="content-wrapper" style="min-height: 900px;">
	<section class="content-header">
      <h1>
        我创建的简历
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a href="/article/add">简历管理</a></li>
        <li class="active">我创建的简历</li>
      </ol>
    </section>
   <section class="content" id="article_my">
   	<div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
            <div class="pull-right">
                <a class="btn btn-success" href="/resume/add"><i class="fa fa-plus"></i> 新增</a>
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
                  <td><a class="btn btn-info" href="/resume/edit/{[item.Id]}">编辑</a></td>
                  <td><a class="btn btn-primary" href="/resume/detail/{[item.Id]}">详情</a></td>
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
        el: '#article_my',
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
        	this.loadData(1)
        }
    });
</script>
{{template "footer.tpl" .}}