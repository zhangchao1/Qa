{{template "header.tpl" .}}
<div class="content-wrapper" style="min-height: 900px;">
	<section class="content-header">
      <h1>
        文章详情
        <small>厚积而薄发</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="/article/add">知识积累</a></li>
        <li class="active">文章详情</li>
      </ol>
    </section>
   <section class="content" id="active_detail">
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
	             <button type="button" class="btn btn-default btn-md"><i class="fa fa-heart-o"></i>赞</button>
	             <button type="button" class="btn btn-default btn-md"><i class="fa fa-eye"></i> 已浏览</button>
	             <button type="button" class="btn btn-default btn-md"><i class="fa fa-commenting"></i> 评论</button>
	          </div>
	    </div>
    </div>
   </section>
</div>
{{template "footer.tpl" .}}