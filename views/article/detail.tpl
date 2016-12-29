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
				        <img class="img-circle" src="http://img2.plures.net/0de1/ee17/efd5/7f6c/7b3d/1960/27a2/6a3c.jpg" alt="User Image">
				        <span class="username"><a href="#">最亮的那颗星</a></span>
				        <span class="description">写于2012年</span>
				      </div>
				    </div>
	            </div>
	            <div class="box-body">

	            <h1 class="text-center"><small>{[ items.Title ]}</small></h1>
	            <p class="text-green" style="text-align: center;">简介:{[ items.Description ]}</p>
	             <div id="article_contents" style="text-align:left;">
	             </div>
	             <button type="button" class="btn btn-default btn-md"><i class="fa fa-heart-o"></i>赞({[ items.AdmireNum ]})</button>
	             <button type="button" class="btn btn-default btn-md"><i class="fa fa-eye"></i> 已浏览({[ items.ViewNum ]})</button>
	             <button type="button" class="btn btn-default btn-md"><i class="fa fa-commenting"></i>评论({[ items.CommentNum ]})</button>
	          </div>
	          <div class="box-footer box-comments">
	          	  <h1><small>精彩评论</small></h1>
		          <div class="box-comment">
	                <!-- User image -->
	                <img class="img-circle img-sm" src="http://img2.plures.net/0de1/ee17/efd5/7f6c/7b3d/1960/27a2/6a3c.jpg" alt="User Image">

	                <div class="comment-text">
	                      <span class="username">
	                        Maria Gonzales
	                        <span class="text-muted pull-right">8:03 PM Today</span>
	                      </span><!-- /.username -->
	                  It is a long established fact that a reader will be distracted
	                  by the readable content of a page when looking at its layout.
	                </div>
	              </div>
        	</div>
        	<div class="box-footer">
              <form action="#" method="post">
                <img class="img-responsive img-circle img-sm" src="http://img2.plures.net/0de1/ee17/efd5/7f6c/7b3d/1960/27a2/6a3c.jpg" alt="Alt Text">
                <!-- .img-push is used to add margin to elements next to floating images -->
                <div class="img-push">
                  <textarea class="form-control" rows="4" placeholder="文章评论"></textarea>
                </div>
              </form>
              <button type="submit" class="btn btn-info pull-right">提交评论</button>
            </div>	
    </div>
   </section>
</div>
<script>
	var aid = {{.aid}}
	Vue.config.delimiters = ['{[', ']}']
	var vue = new Vue({
        el: '#article_detail',
        data:function(){
        	return {
        		items:{}
        	}
        },
        methods:{
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
        }
    });
</script>
{{template "footer.tpl" .}}