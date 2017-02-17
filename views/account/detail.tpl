{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        编辑个人资料
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">用户</a></li>
        <li class="active">编辑个人资料</li>
      </ol>
    </section>
    <section class="content" id="attendance_add">
      <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">个人资料</h3>
                  <div class="pull-right">
                  </div>
            </div>
              <div class="box-body">
                <form role="form">
                <div class="form-group">
                    <label><i class=" fa fa-birthday-cake">(出生日期)</i></label>
                    <input type="text" class="form-control" placeholder="输入日期" v-model="Name"> 
                </div>
                 <div class="form-group">
                    <label><i class="fa fa-mobile-phone">(联系方式)</i></label>
                    <input type="text" class="form-control" placeholder="输入手机号" v-model="Name"> 
                </div>
                <div class="form-group">
                    <label><i class="fa fa fa-book margin-r-5">(教育方式描述)</i></label>
                    <textarea class="form-control" rows="3" placeholder="教育描述"></textarea>
                </div>
                <div class="form-group">
                    <label><i class="fa fa-map-marker margin-r-5">(所在地)</i></label>
                    <input type="text" class="form-control" placeholder="输入地址简介" v-model="Name"> 
                </div>
                <div class="form-group">
                    <label><i class="fa fa-pencil margin-r-5">(技能)</i>
                      <a href="javascript:" v-on:click="add">
                        <span class="glyphicon glyphicon-plus"></span>
                      </a>
                      <a href="javascript:" v-on:click="remove">
                      <span class="glyphicon glyphicon-minus"></span>
                      </a>
                    </label>
                    <table class="table">
                    <thead>
                      <tr>
                        <th>颜色标记</th>
                        <th>技能简介</th>
                      </tr>
                    </thead>
                    <tbody>
                    <tr v-for="item in items">
                      <td height=50px>
                      <div class="form-group">
                      <select class="form-control select2 valid untouched dirty modified">
                        <option selected="selected" value="info">一般</option>
                        <option value="primary">初级</option>
                        <option value="warning">高级</option>
                        <option value="success">资深</option>
                      </select>
                      </div>
                      </td>
                      <td height=50px>
                        <input type="text" class="form-control" placeholder="输入技能简介" v-model="Name"> 
                      </td>
                    </tr>
                    </tbody>
                  </table>
                </div>
                <div class="form-group">
                    <label><i class="fa fa-file-text-o margin-r-5">(座右铭)</i></label>
                    <textarea class="form-control" rows="3" placeholder="输入座右铭"></textarea>
                </div>
                <div class="form-group">
                    <label><i class="fa fa-institution">(个人爱好总结)</i></label>
                    <textarea class="form-control" rows="3" placeholder="输入个人喜好"></textarea>
                </div>
                 </form>
                 </validator>
              </div>
              <div class="box-footer">
                  <button type="submit" class="btn btn-info" v-on:click="save">保存</button>
              </div>
        </div>
      </div>
   </section>
</div>
<link href="/static/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.css" rel="stylesheet">
<script src="/static/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<script>
  $(".my-colorpicker1").colorpicker();
</script>
{{template "footer.tpl" .}}