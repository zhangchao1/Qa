{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        创建相册
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">滨彩生活</a></li>
        <li class="active">我要创建</li>
      </ol>
    </section>
    <section class="content" id="colorlife_add">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">添加相册</h3>
                  <div class="pull-right">
                  </div>
            </div>
              <div class="box-body">
                <validator name="validation1">
                <form role="form">
                    <div class="form-group">
                      <label>上传图片</label>
                      <input type="file" class="form-control" placeholder="上传图片" v-model="tag" id="file-0a" v-validate:tag="['required']" multipledata-min-file-count="1" name="upload_logo"> 
                    </div>
                    <div class="form-group">
                      <label>心情</label>
                      <input type="text" class="form-control" placeholder="输入相册标签" v-model="feeling" v-validate:feeling="['required']">
                    </div>
                  </form>
                </validator>
              </div>
              <div class="box-footer">
                  <button type="submit" class="btn btn-info" v-on:click="save" :disabled="!$validation1.valid">保存</button>
              </div>
        </div>
      </div>
   </section>
</div>
<link href="/static/bootstrap-fileinput/css/fileinput.min.css" rel="stylesheet">
<script src="/static/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="/static/bootstrap-fileinput/js/locales/zh.js"></script>
<script>
  $("#file-0a").fileinput({
            uploadUrl : "/upload_img",//上传图片的url
            allowedFileExtensions : [ 'jpg', 'png', 'gif' ],
            overwriteInitial : false,
            maxFileSize : 1000,//上传文件最大的尺寸
            maxFilesNum : 10,//上传最大的文件数量
            initialCaption: "请上传相册图片",//文本框初始话value
            //allowedFileTypes: ['image', 'video', 'flash'],
            slugCallback : function(filename) {
                return filename.replace('(', '_').replace(']', '_');
            }
        });
  $('#file-0a').on('fileuploaded', function(event, data, previewId, index) {
   var form = data.form, files = data.files, extra = data.extra,
    response = data.response, reader = data.reader;
    console.log(response);//打印出返回的json
    console.log(response.paths);//打印出路径
      });


</script>
{{template "footer.tpl" .}}