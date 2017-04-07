{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        请假
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">请假管理</a></li>
        <li class="active">请假</li>
      </ol>
    </section>
    <section class="content" id="leave_add">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
            <div class="pull-right">
                <a class="btn btn-success" href="/leave/add"><i class="fa fa-plus"></i> 新增</a>
            </div>
            </div>
            <div class="box-body">
                <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_1" data-toggle="tab">待审核</a></li>
              <li><a href="#tab_2" data-toggle="tab">待我审核</a></li>
              <li><a href="#tab_3" data-toggle="tab">已通过</a></li>
              <li><a href="#tab_4" data-toggle="tab">已拒绝</a></li>
              <li><a href="#tab_5" data-toggle="tab">已取消</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_1">
              </div>
              <div class="tab-pane" id="tab_2">
               
              </div>
              <div class="tab-pane" id="tab_3">
                
              </div>
              <div class="tab-pane" id="tab_4">
                
              </div>
               <div class="tab-pane" id="tab_5">
                
              </div>
            </div>
          </div>
            </div>
          </div>
        </div>
      </div>
   </section>
</div>
{{template "footer.tpl" .}}