{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        编辑相册
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">滨彩生活</a></li>
        <li class="active">编辑</li>
      </ol>
    </section>
    <section class="content" id="colorlife_edit">
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
                      <label>标题</label>
                      <input type="text" class="form-control" placeholder="输入相册标题" v-model="Title" v-validate:Title="['required']">
                    </div>
                  <div class="form-group">
                      <label>标签</label>
                      <input type="text" class="form-control" placeholder="输入文相册标签" v-model="Tag" v-validate:Tag="['required']">
                  </div>
                  <div class="form-group">
                      <label>简介</label>
                      <textarea class="form-control" rows="4" placeholder="相册简介" v-model="Description" v-validate:Description="['required']"></textarea>
                  </div>
                  <div class="form-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" v-model="IsPublic">
                      是否公开
                    </label>
                  </div>
                </div>
                  <div class="form-group">
                    <label>相册</label>
                    <input id="upload" class="form-group" type="file" multiple
                      data-min-file-count="1" name="upload_logo">
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
  var cid = {{.cid}}
  Vue.config.delimiters = ['{[', ']}']
    var vue = new Vue({
        el: '#colorlife_edit',
        data: {
            Title:"",
            Tag:"",
            Description:"",
            ablums:[],
            Ablums:"",
            IsPublic:0,
            Uid:1,
        },
        methods:{
            save:function(){
                if(this.ablums.length ==0){
                  alert("请上传图片")
                  return
                }
                this.Ablums = JSON.stringify(this.ablums)
                if(this.IsPublic == 0){
                  this.IsPublic =1
                }else{
                  this.IsPublic =2
                }
                var params = {
                  Title: this.Title,
                  Tag: this.Tag,
                  IsPublic : this.IsPublic,
                  Ablums: this.Ablums,
                  Id:cid,
                  Description:this.Description,
                }
                this.$http.post('/api/colorlife/edit', params, []).then(function(response){
                console.log(response)
                if(response.data.IsSuccess == true){
                    alert("保存成功")
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
              });
            }
        },
        ready:function(){
            this.$http.get('/api/colorlife/getcolorlife?id='+ cid, [], []).then(function(response){
              console.log(response)
              if(response.data.IsSuccess == true){
                  this.Title = response.data.data.Title
                  this.Content = response.data.data.Content
                  this.Tag = response.data.data.Tag
                  this.IsPublic = response.data.data.IsPublic
                  this.Description = response.data.data.Description
              }else{
                  alert(response.data.ErrMsg);
              }
            }, function(response){
              alert('提交失败')
          });
            var vthis = this;
          $("#upload").fileinput({
                  uploadUrl : "/api/colorlife/upload",//上传图片的url
                  allowedFileExtensions : ['jpg'],
                  overwriteInitial : false,
                  maxFileSize : 1000,//上传文件最大的尺寸
                  maxFilesNum : 10,//上传最大的文件数量
                  initialCaption: "请上传相册图片",//文本框初始话value
                  slugCallback : function(filename) {
              return filename.replace('(', '_').replace(']', '_');
            }
          }),
          $('#upload').on('fileuploaded', function(event, data, previewId, index) {
            var form = data.form, files = data.files, extra = data.extra,
            response = data.response, reader = data.reader;
            vthis.ablums.push(response.Data)
          })
        },
    });
</script>
{{template "footer.tpl" .}}