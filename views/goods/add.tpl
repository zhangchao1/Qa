{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        申请物品
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">物品管理</a></li>
        <li class="active">我要申请</li>
      </ol>
    </section>
    <section class="content" id="goods_add">
      <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">申请物品</h3>
                  <div class="pull-right">
                  </div>
            </div>
              <div class="box-body">
              <validator name="validation1">
                <form role="form">
                  <div class="form-group">
                      <label>物品名称</label>
                      <input type="text" class="form-control" placeholder="输入物品名称" v-model="Name" v-validate:Name="['required']">
                    </div>
                    <div class="form-group">
                      <label>物品数量</label>
                      <input type="number" class="form-control" placeholder="输入物品物品数量" v-model="TotalCount" v-validate:TotalCount="['required']">
                    </div>
                    <div class="form-group">
                      <label>物品用途</label>
                      <textarea class="form-control" rows="4" placeholder="输入物品用途" v-model="Application" v-validate:Application="['required']"></textarea>
                    </div>
                    <div class="form-group">
                      <label><i class=" fa fa-user-plus">(审核人)</i></label>
                      <select class="form-control select2" id="choose">
                        <option v-for="option in options" v-bind:value="option.uid">{[option.username ]}
                      </option>
                    </select>
                    </div>
                 </form>
                 </validator>
              </div>
              <div class="box-footer">
                  <button type="submit" class="btn btn-info">保存</button>
              </div>
        </div>
      </div>
   </section>
</div>
<link href="/static/css/select2.min.css" rel="stylesheet">
<script src="/static/js/select2.full.min.js"></script>
<script>
  Vue.config.delimiters = ['{[', ']}']
  var vue = new Vue({
        el: '#goods_add',
        data: {
          options:[],
        },
        methods:{
          
        },
        ready:function(){
          $("#choose").select2();
          this.$http.get('/api/goods/approvalusers' , [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    this.options = response.data.Data
                }else{
                    alert(response.data.ErrMsg);
                    return;
                }
              }, function(response){
                alert('提交失败')
            });
        }
    });
</script>
{{template "footer.tpl" .}}