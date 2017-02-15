{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        我的相册
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">滨彩生活</a></li>
        <li class="active">个人相册</li>
      </ol>
    </section>
    <section class="content" id="colorlife_my">
      <div class="box">
            <div class="box-header">
            <div class="pull-right">
                <a class="btn btn-success" href="/colorlife/add"><i class="fa fa-plus"></i> 新增</a>
            </div>
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
                
              </tbody></table>
            </div>
          </div>
   </section>
</div>
{{template "footer.tpl" .}}