{{template "header.tpl" .}}
<script src="/static/js/galleria-1.5.1.min.js"></script>
<style>
  #galleria{ margin:0 auto; width: 60%; height: 500px;background: #e3e3e3}
  .galleria-theme-classic {
    position: relative;
    overflow: hidden;
    background: #e1cece;
  }
</style>
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
          <h1 class="text-center"><small>{[ items.Title ]}</small></h1>
          <p class="text-green" style="text-align: center;">相册简介:{[ items.Description ]}</p>
          <p><span class="label label-success">相册标签</span>:{[ items.Tag ]}</p>
          <div id="galleria">
              <template v-for="image in images">
                <img v-bind:src="image">
              </template>
          </div>
          <button type="button" v-on:click="userAdmire" class="btn btn-default btn-md"><i id="article_admire" class="fa fa-heart"></i>赞<span class="text-red">({[ items.AdmireNum ]})</span></button>
               <button type="button" class="btn btn-default btn-md"><i class="fa fa-eye"></i> 已浏览({[ items.ViewNum ]})</button>
               <button type="button" class="btn btn-default btn-md"><i class="fa fa-commenting"></i>评论<span class="text-red">({[ items.CommentNum ]})</span></button>
            </div>
            <div class="box-footer box-comments">
                <h1><small>精彩评论</small></h1>
              <div class="box-comment" v-for="comment in commentsList">
                  <!-- User image -->
                  <img class="img-circle img-sm" v-bind:src=" comment.Avatar" alt="User Image">

                  <div class="comment-text">
                    <span class="username">
                      {[ comment.UserName ]}
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
              <button type="button" class="btn btn-info pull-right" v-on:click="comment">提交评论</button>
              <div class="box-footer clearfix">
                    <vue-pagination :cur.sync="currentpage" :all.sync="total" v-on:btn-click="commentList()"></vue-pagination>
              </div>
            </div>  
      </div>
      </div>
    </div>
   </section>
</div>
<script src="/static/js/vue-page.js"></script>
<script>
  var cid = {{.cid}}
  var targetuid= {{.uid }}
  Vue.config.delimiters = ['{[', ']}']
    var vue = new Vue({
        el: '#colorlife_detail',
        data: {
            items:{},
            images:{},
            commentsList:{},
            currentpage:1,
            total:0
        },
        components:{VuePagination},
        methods:{
            userAdmire :function(){
            this.$http.get('/api/colorlife/admire?id='+ cid, [], []).then(function(response){
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
                  Cid: cid,
                  Content: content,
                  TargetUid:targetuid
              }
              console.log(params)
              this.$http.post('/api/colorlife/addcomment', params, []).then(function(response){
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
            this.$http.get('/api/colorlife/commentlist?id='+ cid+"&start=" + start +"&max="+max, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    this.commentsList = response.data.data.Datas;
                    this.total = response.data.data.Total
                    console.log(this.commentsList)
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
            });
          }
        },
        ready:function(){
            Galleria.loadTheme('/static/js/galleria.classic.min.js');
            Galleria.run('#galleria');
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
          this.$http.get('/api/colorlife/admirestatus?id='+ cid, [], []).then(function(response){
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
          this.commentList(1);
        },
    });
</script>
{{template "footer.tpl" .}}