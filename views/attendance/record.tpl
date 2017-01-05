{{template "header.tpl" .}}
<div class="content-wrapper" style="min-height: 900px;">
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
                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
              </div>
            </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tbody><tr>
                  <th>ID</th>
                  <th>User</th>
                  <th>Date</th>
                  <th>Status</th>
                  <th>Reason</th>
                </tr>
                <tr>
                  <td>183</td>
                  <td>John Doe</td>
                  <td>11-7-2014</td>
                  <td><span class="label label-success">Approved</span></td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>
                  <td>219</td>
                  <td>Alexander Pierce</td>
                  <td>11-7-2014</td>
                  <td><span class="label label-warning">Pending</span></td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>
                  <td>657</td>
                  <td>Bob Doe</td>
                  <td>11-7-2014</td>
                  <td><span class="label label-primary">Approved</span></td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                </tr>
                <tr>
                  <td>175</td>
                  <td>Mike Doe</td>
                  <td>11-7-2014</td>
                  <td><span class="label label-danger">Denied</span></td>
                  <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
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
        	
        },
        methods:{
        	
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