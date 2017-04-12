{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        新增加班
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">加班管理</a></li>
        <li class="active">申请加班</li>
      </ol>
    </section>
    <section class="content" id="overtime_add">
      <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">申请加班</h3>
                    <div class="pull-right">
                    </div>
                </div>
              <div class="box-body">
                <validator name="validation1">
                <form class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-md-1 control-label">开始日期</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control" id="startime" placeholder="输入开始时间" v-model="StartTimeDay" v-validate:StartTimeDay="['required']">
                            </div>
                            <div class="col-md-3">
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-default active" id="startAm">
                                        <input type="radio" name="options">上午
                                    </label>
                                    <label class="btn btn-default">
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
                                    <label class="btn btn-default">
                                        <input type="radio" name="options">上午
                                    </label>
                                    <label class="btn btn-default active" id="EndPm">
                                        <input type="radio" name="options">下午
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-md-1 control-label">补偿方式</label>
                            <div class="col-md-11">
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-default active">
                                        <input type="radio" name="options" id="EqualizeType">调休
                                    </label>
                                    <label class="btn btn-default">
                                        <input type="radio" name="options">加班费
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-md-1 control-label">加班备注</label>
                            <div class="col-md-9">
                            <textarea class="form-control" rows="5" placeholder="加班备注描述不超过100字" v-model="Reason" v-validate:Reason="['required']"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-md-1 control-label">是否外勤</label>
                            <div class="col-md-11">
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-default active">
                                        <input type="radio" name="options" id="IsOutside">非外勤
                                    </label>
                                    <label class="btn btn-default ">
                                        <input type="radio" name="options">外勤
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-md-1 control-label">注意事项</label>
                            <div class="col-md-5">
                            <h4>
                            <code>
                            加班申请无特殊原因不可以延迟申请，如延迟申请的话，请在加班备注里面写清楚
                            </code>
                            </h4>
                        </div>
                </form>
                </validator>
              </div>
              <div class="box-footer">
                 <button type="submit" class="btn btn-info" :disabled="!$validation1.valid" v-on:click="save">保存</button>
              </div>
        </div>
      </div>
   </section>
</div>
<link href="/static/css/bootstrap-datepicker.min.css" rel="stylesheet">
<script src="/static/js/bootstrap-datepicker.min.js"></script>
<script src="/static/js/moment.min.js"></script>
<script>
    var vue = new Vue({
        el: '#overtime_add',
        data: {
            StartTime:"",
            EndTime:"",
            StartTimeDay:"",
            StartTimeHour:"",
            EndTimeDay:"",
            EndTimeHour:"",
            Longtime:"",
            Reason:"",
            EqualizeType:"",
            IsOutside:"",
        },
        delimiters: ['{[', ']}'],
        methods:{
            save:function(){
                var endtimeHour;
                if($("#startAm").prop("className") == "btn btn-default active"){
                    this.StartTimeHour = "00:00"
                }else{
                    this.StartTimeHour = "12:00"
                }
                if($("#EndPm").prop("className") == "btn btn-default active"){
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
                if(this.EndTime.indexOf("24:00") > 0 ){
                    this.EndTime = this.EndTime.replace("24:00","23:59")
                }
                if($("#EqualizeType").prop("className") == "btn btn-primary active"){
                    this.EqualizeType = "调休"
                }else{
                    this.EqualizeType = "加班费"
                }
                if($("#IsOutside").prop("className") == "btn btn-primary active"){
                    this.IsOutside = "非外勤"
                }else{
                    this.IsOutside = "外勤"
                }
                var params = {
                  StartTime: this.StartTime,
                  EndTime: this.EndTime,
                  Longtime : this.Longtime,
                  Reason: this.Reason,
                  EqualizeType:this.EqualizeType,
                  IsOutside:this.IsOutside,
                }
                this.$http.post('/api/overtime/add', params, []).then(function(response){
                if(response.data.IsSuccess == true){
                    alert("保存成功")
                    window.location.href="/overtime/my"
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
        }
    });
</script>
{{template "footer.tpl" .}}