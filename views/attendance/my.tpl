{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        考勤
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">考勤管理</a></li>
        <li class="active">我要考勤</li>
      </ol>
    </section>
    <section class="content" id="attendance_add">
    <div class="row">
    <div class="col-md-6">
        <div class="info-box center">
            <span class="info-box-icon bg-green"><i class="ion ion-ios-people-outline"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">当前时间</span>
              <span class="info-box-number" id="nowtime"></span>
            </div>
        </div>
        <div id="attendance_click" style="margin-left:auto;margin-right:auto;width:200px">
        <button type="button" class="btn btn-default" style="width: 200px;height: 200px;
                -moz-border-radius: 50%;
                background:MediumTurquoise; 
                color:#fff;
                font-size: 26px;
                -webkit-border-radius: 50%;
                border-radius: 50%;">打卡<br><span id="addtime"></span>
        </button>
        </div>
    </div>
    <div class="col-md-6">
        <div class="box box-widget widget-user-2">
                <!-- Add the bg color to the header using any of the bg-* classes -->
                <div class="widget-user-header">
                  <div class="widget-user-image">
                    <img class="img-circle" src="http://img2.plures.net/0de1/ee17/efd5/7f6c/7b3d/1960/27a2/6a3c.jpg" alt="User Avatar">
                  </div>
                  <!-- /.widget-user-image -->
                  <h3 class="widget-user-username">张超</h3>
                  <h5 class="widget-user-desc">当月考勤汇总</h5>
                </div>
                <div class="box-footer no-padding">
                  <ul class="nav nav-stacked">
                    <li><a href="#">出勤天数 <span class="pull-right badge bg-blue">3天</span></a></li>
                    <li><a href="#">正常 <span class="pull-right badge bg-green">1天</span></a></li>
                    <li><a href="#">迟到<span class="pull-right badge bg-red">1天</span></a></li>
                    <li><a href="#">早退<span class="pull-right badge bg-red">1天</span></a></li>
                    <li><a href="#">总计上班时长<span class="pull-right badge bg-blue">22个小时</span></a></li>
                  </ul>
                </div>
              </div>
    </div>
    </div>
    <div id="calendar" style="height: 500px">
    </div>
   </section>
</div>
<link href="/static/css/bootstrap-year-calendar.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/moment.js/2.17.1/moment.min.js"></script>
<script src="/static/js/bootstrap-year-calendar.min.js"></script>
<script>
    Vue.config.delimiters = ['{[', ']}']
    var vue = new Vue({
        el: '#attendance_add',
        data: {
            
        },
        methods:{
   
        },
        ready:function(){
            setInterval(function() {
            var now = moment().format('YYYY-MM-DD HH:mm:ss');
            var addtime = moment().format('HH:mm:ss');
            $('#nowtime').text(now);
            $('#addtime').text(addtime);
            }, 1000);
            $("#calendar").calendar()
        },
    });
</script>
{{template "footer.tpl" .}}