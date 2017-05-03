{{template "header.tpl" .}}
<div class="content-wrapper" style="min-height: 900px;">
	<section class="content-header">
      <h1>
        文章详情
        <small>厚积而薄发</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a href="/article/add">知识积累</a></li>
        <li class="active">文章详情</li>
      </ol>
    </section>
   <section class="content" id="article_detail">
   	<div class="row">
	    <div class="col-md-12">
	          <div class="box box-widget">
	               <div class="box-header with-border">
				      <div class="user-block">
				        <img class="img-circle" src="{{.useravatar}}" alt="User Image">
				        <span class="username"><a href="#">{{.username}}</a></span>
				        <span class="description">写于{[ items.Created ]}</span>
				      </div>
				    </div>
	            </div>
	            <div class="box-body">

	            <h1 class="text-center"><small>{[ items.Title ]}</small></h1>
	            <p class="text-green" style="text-align: center;">简介:{[ items.Description ]}</p>
              <p><span class="label label-success">标签</span>:{[ items.Tag ]}</p>
	             <div id="article_contents" style="text-align:left;">
	             </div>
	             <button type="button" v-on:click="userAdmire" class="btn btn-default btn-md"><i id="article_admire"></i>赞<span class="text-red">({[ items.AdmireNum ]})</span></button>
	             <button type="button" class="btn btn-default btn-md"><i class="fa fa-eye"></i> 已浏览({[ items.ViewNum ]})</button>
	             <button type="button" class="btn btn-default btn-md"><i class="fa fa-commenting"></i>评论<span class="text-red">({[ items.CommentNum ]})</span></button>
	          </div>
	          <div class="box-footer box-comments">
	          	  <h1><small>精彩评论</small></h1>
		          <div class="box-comment" v-for="comment in commentsList">
	                <!-- User image -->
	                <img class="img-circle img-sm" src="http://img2.plures.net/0de1/ee17/efd5/7f6c/7b3d/1960/27a2/6a3c.jpg" alt="User Image">

	                <div class="comment-text">
                    <span class="username">
                      Maria Gonzales
                      <span class="text-muted pull-right">{[ comment.Created ]}</span>
                    </span>
                    <div>
	                  {[ comment.Content ]}
                    </div>
	                </div>
	              </div>
        	</div>
        	<div class="box-footer">
              <form action="#" method="post">
                <img class="img-responsive img-circle img-sm" src="{{.useravatar}}" alt="Alt Text">
                <div class="img-push">
                  <textarea class="form-control" rows="4" placeholder="文章评论" id="comment_content"></textarea>
                </div>
              <button type="button" v-on:click="comment" class="btn btn-info pull-right">提交评论</button>
              <div class="box-footer clearfix">
                    <vue-pagination :cur.sync="currentpage" :all.sync="total" v-on:btn-click="commentList()"></vue-pagination>
              </div>
            </div>	
    </div>
   </section>
</div>
<script src="/static/js/vue-page.js"></script>
<script>
	var aid = {{.aid}}
  var targetuid= {{.uid }}
	Vue.config.delimiters = ['{[', ']}']
	var vue = new Vue({
        el: '#article_detail',
        data:{
        		items:{},
            commentsList:{},
            currentpage:1,
            total:0
        },
        components:{VuePagination},
        methods:{
          userAdmire :function(){
            this.$http.get('/api/article/admire?id='+ aid, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    this.items.AdmireNum = response.data.Count
                     $("#article_admire").removeClass()
                     $("#article_admire").addClass("fa fa-heart")
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
            });
          },
          comment :function(){
               var content = $("#comment_content").val()
              if(content == ""){
                alert("请提交参数")
                return
              }
              var params = {
                  Cid: aid,
                  Content: content,
                  TargetUid:targetuid
              }
              console.log(params)
              this.$http.post('/api/article/addcomment', params, []).then(function(response){
                console.log(response)
                if(response.data.IsSuccess == true){
                    this.items.CommentNum= response.data.Count
                    this.currentpage = 1
                    this.commentList();
                    $("#comment_content").val("")
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
              });
          },
          commentList :function(){
            var start = this.currentpage
            var max = 5;
            this.$http.get('/api/article/commentlist?id='+ aid+"&start=" + start +"&max="+max, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    this.commentsList = response.data.data.Datas;
                    this.total = response.data.data.Total
                    console.log(this.commentsList,this.total)
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
            });
          }
        },
        ready:function(){
        	this.$http.get('/api/article/getArticle?id='+ aid, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    this.items = response.data.data
                    $("#article_contents").html(response.data.data.Content)
                }else{
                    alert(response.data.ErrMsg);
                }
            	}, function(response){
                alert('提交失败')
            });
          this.$http.get('/api/article/admirestatus?id='+ aid, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    if(response.data.Status == true){
                      $("#article_admire").addClass("fa fa-heart")
                    }else{
                      $("#article_admire").addClass("fa fa-heart-o")
                    }
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
            });
          this.commentList();
        }
    });
</script>
{{template "footer.tpl" .}}