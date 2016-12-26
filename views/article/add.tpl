{{template "header.tpl" .}}
<div class="content-wrapper" style="min-height: 900px;">
	<section class="content-header">
      <h1>
        文章添加
        <small>厚积而薄发</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="/article/add">知识积累</a></li>
        <li class="active">文章添加</li>
      </ol>
    </section>
   <section class="content" id="article_add">
   	<div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
	                <h3 class="box-title">添加</h3>
	                <div class="pull-right">
	                </div>
	        	</div>
	            <div class="box-body">
		            <form role="form">
		                <div class="form-group">
		                  <label>标题</label>
		                  <input type="text" class="form-control" placeholder="输入文章标题">
		                </div>
		                <div class="form-group">
		                  <label>标签</label>
		                  <input type="text" class="form-control" placeholder="输入文章标签">
		                </div>
		                <div class="form-group">
		                  <label>类别</label>
		                  <select class="form-control">
		                    <option>技术分享</option>
		                    <option>企业文化</option>
		                    <option>管理知识</option>
		                    <option>财务知识</option>
		                    <option>市场营销</option>
		                    <option>运营</option>
		                    <option>随笔</option>
		                  </select>
                		</div>
                		<div class="form-group">
		                  <label>简介</label>
		                  <textarea class="form-control" rows="4" placeholder="文章简介"></textarea>
		                </div>
		                <div class="form-group">
		                  <label>内容</label>
		                  <textarea class="form-control" rows="4" placeholder="文章简介" id="add_cotent" name="content"></textarea>
		                </div>
	              	</form>
	            </div>
	            <div class="box-footer">
	                <button type="submit" class="btn btn-info">保存</button>
              </div>
    		</div>
    	</div>
   </section>
</div>
  <script src="http://cdn.bootcss.com/ckeditor/4.5.10/ckeditor.js"></script>
<script>
	var vue = new Vue({
        el: '#article_add',
        data: {},
        delimiters: ['{[', ']}'],
        methods:{
        },
        mounted:function(){
        	var editor = CKEDITOR.replace("content");
	        	editor.on( 'change', function( event ) {
	        	console.log(this.getData())
        	})
        }
    });
</script>
{{template "footer.tpl" .}}