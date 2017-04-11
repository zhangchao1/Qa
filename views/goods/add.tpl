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
              <div class="col-md-12">
                  <div class="callout callout-success">
                      <b>申请物品:</b>
                      <p>
                      1.生活用品和生活用品不用归还给物品管理员。
                      2.电子产品需在离职前归还物品管理员，这一块需要做好备注。
                      </p>
                  </div>
              </div>
              <validator name="validation1">
                <form role="form">
                  <div class="form-group">
                      <label>物品名称</label>
                      <input type="text" class="form-control" placeholder="输入物品名称" v-model="Name" v-validate:Name="['required']">
                    </div>
                    <div class="form-group">
                      <label>物品类型</label>
                        <select class="form-control select2" v-model="Type" v-validate:Type="['required']">
                          <option selected="selected" value="生活用品">生活用品</option>
                          <option value="办公用品">办公用品</option>
                          <option value="电子产品">电子产品</option>
                        </select>
                    </div>
                    <div class="form-group">
                      <label>物品数量</label>
                      <input type="number" class="form-control" placeholder="输入物品物品数量" v-model="TotalCount" v-validate:TotalCount="['required']">
                    </div>
                    <div class="form-group">
                      <label>物品用途</label>
                      <textarea class="form-control" rows="4" placeholder="输入物品用途" v-model="Application" v-validate:Application="['required']"></textarea>
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
         
        }
    });
</script>
{{template "footer.tpl" .}}