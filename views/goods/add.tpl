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
                        <select class="form-control" id="goods_detail_list" style="width=100%">
                        </select>
                    </div>
                    <div class="form-group">
                      <label>物品数量</label>
                      <input type="number" class="form-control" placeholder="输入物品物品数量" v-model="applyTotalCount" v-validate:applyTotalCount="['required']">
                    </div>
                    <div class="form-group">
                      <label>物品用途</label>
                      <textarea class="form-control" rows="4" placeholder="输入物品用途" v-model="application" v-validate:application="['required']"></textarea>
                    </div>
                 </form>
                 </validator>
              </div>
              <div class="box-footer">
                  <button type="submit" class="btn btn-info" v-on:click="save" :disabled="!$validation1.valid">保存</button>
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
          goodsDetailId:0,
          application:"",
          applyTotalCount:1,
        },
        methods:{
            getGoodsAll:function(){
              var url = "/api/goods/goodsdetail/all";
              this.$http.get(url, [], []).then(function(response){
                  var data = response.data;
                  if(data.IsSuccess == true){
                      var allGoodsDetail = data.Data;
                      for(var item of allGoodsDetail){
                          this.options.push({
                              'id' : item.Id,
                              'text' : item.Name
                          });
                      }
                      console.log(this.options)
                      var vue = this;
                      $('#goods_detail_list').select2({
                          placeholder: "搜索...",
                          data: vue.options
                      });
                      $('#goods_detail_list').on("select2:select", function(e) { 
                          vue.goodsDetailId = $('#goods_detail_list').val();
                          console.log(vue.goodsDetailId)
                      });
                  }else{
                      console.log("error")
                  }
              }, function(response) {
                  alert('请求失败')
              });

            },
            save:function(){
              this.goodsDetailId =  $('#goods_detail_list').val();
              var params = {
                  GoodsDetailId: Number(this.goodsDetailId),
                  Application: this.application,
                  ApplyTotalCount : Number(this.applyTotalCount),
              }
              this.$http.post('/api/goods/add', params, []).then(function(response){
                if(response.data.IsSuccess == true){
                    alert("保存成功")
                    window.location.href="/goods/manage"
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
              });
            }
        },
        ready:function(){
          this.getGoodsAll();
        }
    });
</script>
{{template "footer.tpl" .}}