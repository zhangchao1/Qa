{{template "header.tpl" .}}
<div class="content-wrapper" id="colorlife_detail">
	<section class="content-header">
      <h1>
        相册详情
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">滨彩生活</a></li>
        <li class="active">{[ items.Title ]}</li>
      </ol>
    </section>
    <section class="content">
     <div class="row">
      <div class="col-md-12">
        <div class="box-body">
        <p class="text-green" style="text-align: center;">相册简介:{[ items.Description ]}</p>
        <p><span class="label label-success">标签</span>:{[ items.Tag ]}</p>
         <button type="button" class="btn btn-default btn-md"><i id="article_admire"></i>赞<span class="text-red">({[ items.AdmireNum ]})</span></button>
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
            <img class="img-responsive img-circle img-sm" src="http://img2.plures.net/0de1/ee17/efd5/7f6c/7b3d/1960/27a2/6a3c.jpg" alt="Alt Text">
            <div class="img-push">
              <textarea class="form-control" rows="4" placeholder="文章评论" id="comment_content"></textarea>
            </div>
          <button type="button" class="btn btn-info pull-right">提交评论</button>
        </div>  
    </div>
   </section>
</div>
<script>
  var cid = {{.cid}}
  Vue.config.delimiters = ['{[', ']}']
    var vue = new Vue({
        el: '#colorlife_detail',
        data: {
            items:{},
            images:{}
        },
        methods:{
            
        },
        ready:function(){
            this.$http.get('/api/colorlife/getcolorlife?id='+ cid, [], []).then(function(response){
              console.log(response)
              if(response.data.IsSuccess == true){
                  this.items = response.data.data;
                  var allimages = eval(response.data.data.Ablums)
                  this.images = $.extend({}, allimages);
                  console.log(this.images)
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