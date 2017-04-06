{{template "header.tpl" .}}
<div class="content-wrapper" style="min-height: 900px;">
	<section class="content-header">
      <h1>
        个人请假
        <small>新增请假</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="/article/add">请假管理</a></li>
        <li class="active">新增请假</li>
      </ol>
    </section>
   <section class="content" id="leave_add">
   	<div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">我要请假</h3>
                    <div class="pull-right">
                    </div>
                </div>
	            <div class="box-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="callout callout-success">
                                <b>请假证明:</b>
                                <p>
                                病假  1）二甲以上医院开出的病假证明（盖章）；2）病历原件（病史描述）及复印件。
                                婚假 结婚证复印件（验原件）
                                丧假  公安机关相关死亡证明文件及亲属关系证明及复印件
                                产假 准生证、医院（二甲以上）预产期证明、生育证明、独生子女证等复印件（验原件）
                                陪产假 准生证、医院（二甲以上）预产期证明、生育证明、独生子女证等复印件（验原件）
                                产检假 产检病假单
                                </p>
                            </div>
                    </div>
                    <div class="col-md-6">
                            <div class="callout callout-success">
                                <b>事前请假要求天数说明</b>
                                <p>
                                请假天数在1天以内（含1天）的需提前1个工作日本人提出申请
                                请假天数在2-3天（含3天）的需提前5个工作日本人提出申请
                                请假天数在3-5天（含5天）的需提前10个工作日本人提出申请
                                请假天数在5天以上的需提前20个工作日本人提出申请
                                请假天数在3天以上的需要添加请假交接人
                                连续时间内的请假，请先取消已有请假，一次申请
                                病假、婚假、产假、产检假、丧假等特殊假期，请上传说明附件后再提交
                                </p>
                            </div>
                    </div>
                    <validator name="validation1">
	            	<form class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-md-1 control-label">开始日期</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control" id="startime" placeholder="输入开始时间" v-model="StartTimeDay" v-validate:StartTimeDay="['required']">
                            </div>
                            <div class="col-md-3">
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary active" id="startAm">
                                        <input type="radio" name="options">上午
                                    </label>
                                    <label class="btn btn-primary" id="startPm">
                                        <input type="radio" name="options">下午
                                    </label>
                                </div>
                            </div>
                            <label for="inputEmail3" class="col-md-1 control-label">结束日期</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control" id="endtime" placeholder="输入结束日期" v-model="EndTimeDay" v-validate:EndTimeDay="['required']">
                            </div>
                            <div class="col-md-3">
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary" id="EndAm">
                                        <input type="radio" name="options" >上午
                                    </label>
                                    <label class="btn btn-primary active" id="EndPm">
                                        <input type="radio" name="options">下午
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-md-1 control-label">请假类型</label>
                            <div class="col-md-9">
                                <select class="form-control select2" v-model="Type" v-validate:Type="['required']">
                                  <option selected="selected" value="调休">调休</option>
                                  <option value="事假">事假</option>
                                  <option value="年假">年假</option>
                                  <option value="病假">病假</option>
                                  <option value="婚假">婚假</option>
                                  <option value="丧假">丧假</option>
                                  <option value="产假">产假</option>
                                  <option value="产检假">产检假</option>
                                  <option value="陪产假">陪产假</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-md-1 control-label">请假原因</label>
                            <div class="col-md-9">
                            <textarea class="form-control" rows="5" placeholder="原因描述不超过100字" v-model="Reason" v-validate:Reason="['required']"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-md-1 control-label">添加附件</label>
                            <div class="col-md-9" style="overflow-y: auto;overflow-x:hidden;">
                                <input id="upload" class="form-group" type="file" multiple
                                data-min-file-count="1" name="upload_logo" >
                            </div>
                        </div>
                    </form>
                    </validator>
	            </div>
	            <div class="box-footer">
                  <button type="submit" class="btn btn-info":disabled="!$validation1.valid" v-on:click="save">保存</button>
              </div>
    		</div>
    	</div>
   </section>
</div>
<link href="/static/css/bootstrap-datepicker.min.css" rel="stylesheet">
<script src="/static/js/bootstrap-datepicker.min.js"></script>
<script src="/static/js/moment.min.js"></script>
<link href="/static/bootstrap-fileinput/css/fileinput.min.css" rel="stylesheet">
<script src="/static/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="/static/bootstrap-fileinput/js/locales/zh.js"></script>
<script>
	var vue = new Vue({
        el: '#leave_add',
        data: {
        	StartTime:"",
            EndTime:"",
            StartTimeDay:"",
            StartTimeHour:"",
            EndTimeDay:"",
            EndTimeHour:"",
            Longtime:"",
            AttachMent:"",
            Reason:"",
            Type:"",
            Images:[]
        },
        delimiters: ['{[', ']}'],
        methods:{
        	save:function(){
                if($("#startAm").prop("className") == "btn btn-primary active"){
                    this.StartTimeHour = "00:00"
                }else{
                    this.StartTimeHour = "12:00"
                }
                if($("#EndPm").prop("className") == "btn btn-primary active"){
                    this.EndTimeHour = "24:00"
                }else{
                    this.EndTimeHour = "12:00"
                }
                this.StartTime = this.StartTimeDay + " " + this.StartTimeHour;
                this.EndTime = this.EndTimeDay + " " + this.EndTimeHour
                console.log(this.StartTime,this.EndTime)
                if(moment(this.StartTime,"YYYY-MM-DD HH:mm").format('X') > moment(this.EndTime,"YYYY-MM-DD HH:mm").format('X')){
                    alert("开始时间不能大于结束时间！")
                    return
                }else{
                    var durationTime 
                    durationTime = moment(this.EndTime,"YYYY-MM-DD HH:mm").format('X') - moment(this.StartTime,"YYYY-MM-DD HH:mm").format('X')
                     var days = durationTime/86400;
                     this.Longtime = days.toString()
                }
                if(this.Type != "调休" && this.Type != "年假"){
                   if(this.Images.length == 0) {
                        alert("请上传相关证明！")
                        return
                   }
                }
                if(this.Images.length > 0){
                    this.AttachMent = JSON.stringify(this.Images.length)
                }
                var params = {
                  StartTime: this.StartTime,
                  EndTime: this.EndTime,
                  Longtime : this.Longtime,
                  Reason: this.Reason,
                  Type:this.Type,
                  AttachMent:this.AttachMent
                }
                 this.$http.post('/api/leave/add', params, []).then(function(response){
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
        	$('#startime').datepicker({
            format: "yyyy-mm-dd",
            autoclose: true,
          });
            $('#endtime').datepicker({
            format: "yyyy-mm-dd",
            autoclose: true,
          });
        var vthis = this;
        $("#upload").fileinput({
              uploadUrl : "/api/leave/upload",//上传图片的url
              allowedFileExtensions : ['jpg'],
              overwriteInitial : false,
              maxFileSize : 4098,//上传文件最大的尺寸
              maxFilesNum : 8,//上传最大的文件数量
              initialCaption: "请上传相关证明(图片数为8张)",//文本框初始话value
              slugCallback : function(filename) {
          return filename.replace('(', '_').replace(']', '_');
        }
        }),
        $(".file-drop-zone").css('height','300px');
        $(".file-drop-zone").css("overflow-y","auto")
        $(".file-drop-zone").css("overflow-x","hidden")
        $('#upload').on('fileuploaded', function(event, data, previewId, index) {
        var form = data.form, files = data.files, extra = data.extra,
        response = data.response, reader = data.reader;
        vthis.Images.push(response.Data)
        })
        }
    });
</script>
{{template "footer.tpl" .}}