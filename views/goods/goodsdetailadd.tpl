{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        增加物品
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">物品管理</a></li>
        <li class="active">增加物品</li>
      </ol>
    </section>
    <section class="content" id="goodsdetail_add">
      <div class="row">
        <div class="col-md-12">
           <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">添加</h3>
                  <div class="pull-right">
                  </div>
            </div>
              <div class="box-body">
                <validator name="validation1">
                <form role="form">
                    <div class="form-group">
                      <label>物品名称</label>
                      <input type="text" class="form-control" placeholder="物品名称" v-model="Name" v-validate:Name="['required']">
                    </div>
                    <div class="form-group">
                      <label>分类</label>
                      <select class="form-control" v-model="Type" v-validate:types="['required']">
                        <option selected="selected">生活物品</option>
                        <option>普通办公物品</option>
                        <option>电子办公物品</option>
                        <option>贵重的办公物品</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label>单位</label>
                      <select class="form-control" v-model="Unit" v-validate:types="['required']">
                        <option selected="selected">个</option>
                        <option>包</option>
                        <option>台</option>
                        <option>只</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label>物品数量</label>
                      <input type="number" class="form-control" placeholder="物品数量" v-model="TotalCount" v-validate:TotalCount="['required']">
                    </div>
                  </form>
                </validator>
              </div>
              <div class="box-footer">
                  <button type="submit" class="btn btn-info" v-on:click="save" :disabled="!$validation1.valid">保存</button>
              </div>
        </div>
          </div>
      </div>
   </section>
</div>
<script>
  Vue.config.delimiters = ['{[', ']}']
  var vue = new Vue({
        el: '#goodsdetail_add',
        data: {
            Name:"",
            Type:"",
            Unit:"",
            TotalCount:1,
        },
        methods:{
          save:function(){


          }
        },
        ready:function(){
          
        }
    });
</script>
{{template "footer.tpl" .}}