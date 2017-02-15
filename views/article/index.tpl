{{template "header.tpl" .}}
<div class="content-wrapper" style="min-height: 900px;">
	<section class="content-header">
	  <h1>
	   精彩文章
	    <small></small>
	  </h1>
	  <ol class="breadcrumb">
	    <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
	    <li><a href="/article/add">知识积累</a></li>
	    <li class="active">精彩文章</li>
	  </ol>
	</section>
  <section class="content" id="home">
  <div class="box box-info">
        <div class="box-header with-border">
          <h3 class="box-title">技术文章排行榜</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div class="table-responsive">
            <table class="table no-margin">
              <thead>
              <tr>
                <th>文章标题</th>
                <th>作者</th>
                <th>点赞数</th>
                <th>评论数</th>
                <th>阅读数</th>
              </tr>
              </thead>
              <tbody>
             
              </tbody>
            </table>
          </div>
        </div>
  </section>
</div>
{{template "footer.tpl" .}}