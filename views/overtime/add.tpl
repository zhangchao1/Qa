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
                <form class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-md-1 control-label">开始日期</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control" id="startime" placeholder="输入开始时间">
                            </div>
                            <div class="col-md-3">
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-default active">
                                        <input type="radio" name="options" id="startAm">上午
                                    </label>
                                    <label class="btn btn-default">
                                        <input type="radio" name="options" id="startPm">下午
                                    </label>
                                </div>
                            </div>
                            <label for="inputEmail3" class="col-md-1 control-label">结束日期</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control" id="endtime" placeholder="输入结束日期">
                            </div>
                            <div class="col-md-3">
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-default">
                                        <input type="radio" name="options" id="EndAm">上午
                                    </label>
                                    <label class="btn btn-default active">
                                        <input type="radio" name="options" id="EndPm">下午
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-md-1 control-label">补偿方式</label>
                            <div class="col-md-11">
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-default">
                                        <input type="radio" name="options" id="EndAm">调休
                                    </label>
                                    <label class="btn btn-default active">
                                        <input type="radio" name="options" id="EndPm">加班费
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-md-1 control-label">加班备注</label>
                            <div class="col-md-9">
                            <textarea class="form-control" rows="5" placeholder="加班备注描述不超过100字"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-md-1 control-label">是否外勤</label>
                            <div class="col-md-11">
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-default">
                                        <input type="radio" name="options" id="EndAm">非外勤
                                    </label>
                                    <label class="btn btn-default active">
                                        <input type="radio" name="options" id="EndPm">外勤
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
              </div>
              <div class="box-footer">
                 
              </div>
        </div>
      </div>
   </section>
</div>
{{template "footer.tpl" .}}