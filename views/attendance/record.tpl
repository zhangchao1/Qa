{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        考勤记录
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">考勤管理</a></li>
        <li class="active">考勤记录</li>
      </ol>
    </section>
    <section class="content" id="attendance_record">
    <div class="box">
            <div class="box-header">
            <div class="input-group input-group-sm" style="width:400px;">
              <input type="text" name="table_search" class="form-control" placeholder="查询考勤" id="daterange">
              <div class="input-group-btn">
                <button type="submit" class="btn btn-default" v-on:click="searchAttendance"><i class="fa fa-search"></i></button>
              </div>
            </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tbody><tr>
                  <th>ID</th>
                  <th>Uid</th>
                  <th>考勤时间</th>
                  <th>考勤IP</th>
                  <th>考勤状态</th>
                </tr>
                <tr v-for="item in items">
                  <td>{[ item.Id ]}</td>
                  <td>{[ item.Uid ]}</td>
                  <td>{[ item.Dy ]}</td>
                  <td>{[ item.Ip ]}</td>
                  <td><span class="label {[ item.Status ]}">{[ item.Types]}</span></td>
                </tr>
              </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>
   </section>
</div>
<link href="/static/css/daterangepicker-bs3.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/bootstrap-daterangepicker/2.1.24/moment.min.js"></script>
<script src="/static/js/daterangepicker.js"></script>
<script>
	Vue.config.delimiters = ['{[', ']}']
	var vue = new Vue({
        el: '#attendance_record',
        data: {
        	   items:""
        },
        methods:{
        	 searchAttendance:function(){
             this.loadData(1)
           },
           loadData:function(pages){
             var searchtime = $("#daterange").val()
             if (searchtime == ""){
                alert("请输入查询时间")
                return
             }
             var search_time = searchtime.split(" ");
             this.$http.get('/api/attendance/search?startTime='+ search_time[0] +"&endTime=" +search_time[2] + "&startIndex=" + pages , [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    this.items = response.data.Data
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
            });
           }
        },
        ready:function(){
         	$("#daterange").daterangepicker({
      				opens: 'right',
      				format: 'YYYY-MM-DD',
      				ranges: {
      					'本月': [moment().startOf('month'), moment().endOf('month')],
      					'上月': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
      				},
      				locale: {
      					applyLabel: '确定',
      					cancelLabel: '取消',
      					fromLabel: '从',
      					toLabel: '至',
      				}
      			});
        },
    });
</script>
{{template "footer.tpl" .}}