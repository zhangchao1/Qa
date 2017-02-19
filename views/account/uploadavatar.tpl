{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        个人设置
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">用户</a></li>
        <li class="active">头像设置</li>
      </ol>
    </section>
    <section class="content" id="attendance_add">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-primary">
              <div class="box-header with-border">
                <h3 class="box-title">上传头像</h3>
              </div>
            <div class="box-body">
                <div class="row" style="height:350px">
                  <div class="col-md-12">
                    <div class="actions">
                      <div class="row">
                        <div class="col-md-2">
                          <input type="file" id="upload" value="选择图片文件"/>
                        </div>
                        <div class="col-md-10">
                          <div class="crop"> 
                            <div id="upload-demo"></div> 
                                
                            </div> 
                          </div>
                        </div>                     
                  </div>
                   <div class="row">
                    <div class="col-md-2">
                      <button class="btn btn-block btn-primary" id="uploadimage"> 上传</button> 
                    </div>
                    <div class="col-md-2">
                      <button class="btn btn-block btn-primary" id="coopieresult" data-toggle="modal" data-target="#myModal">预览截图</button> 
                    </div>
                   </div>
                  </div>
                </div>
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">预览头像</h4>
            </div>
            <div class="modal-body">
              <div id="result" align="center">
              </div> 
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消预览</button>
                <button type="button" class="btn btn-primary">预览</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
            </div>
          </div>
        </div>
      </div>
   </section>
</div>
<link href="/static/css/croppie.min.css" rel="stylesheet">
<script src="/static/js/croppie.min.js"></script>
<script>
  var $uploadCrop; 
 
        function readFile(input) { 
             if (input.files && input.files[0]) { 
                var reader = new FileReader(); 
                 
                reader.onload = function (e) { 
                    $uploadCrop.croppie('bind', { 
                        url: e.target.result 
                    }); 
                } 
                 
                reader.readAsDataURL(input.files[0]); 
            } 
            else { 
                alert("Sorry - you're browser doesn't support the FileReader API"); 
            } 
        } 
 
        $uploadCrop = $('#upload-demo').croppie({ 
            viewport: { 
                width: 200, 
                height: 200, 
                type: 'circle' 
            }, 
            boundary: { 
                width: 300, 
                height: 300 
            } 
        }); 
 
        $('#upload').on('change', function () {  
            $(".crop").show(); 
            readFile(this);  
        }); 
        $('#coopieresult').on('click', function (ev) { 
            $uploadCrop.croppie('result', 'canvas').then(function (resp) { 
                popupResult({ 
                    src: resp 
                }); 
            }); 
        });
        $('#uploadimage').on('click', function (ev) { 
            $uploadCrop.croppie('result', 'canvas').then(function (resp) { 
                if($('#upload').val()==""){
                  alert("请选择文件")
                  return
                }
                host = window.location.host;
                var url= "http://"+host+"/api/user/saveavatar"
                $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify({"Avatar":resp}),
                dataType:"json",
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                  if(result.IsSuccess){
                    window.location.href="/account/center"
                  }else{
                    alert(result.ErrMsg)
                  }
                }
                });
            }); 
        });
    function popupResult(result) { 
        console.log(result)
        var html; 
        if (result.html) { 
            html = result.html; 
        } 
        if (result.src) { 
            html = '<img style="width:200px;height:200px" src="' + result.src + '" />'; 
        }
        console.log(result.src)
        $("#result").html(html); 
    } 
</script>
{{template "footer.tpl" .}}