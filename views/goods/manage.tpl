{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        物品列表
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">物品管理</a></li>
        <li class="active">物品列表</li>
      </ol>
    </section>
    <section class="content" id="goods_manage">
      <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                    <div class="input-group input-group-sm pull-left" style="width: 300px;">
                        <input type="text" name="table_search" class="form-control pull-right" placeholder="物品名称/物品类型" v-model="keywords">
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-default"> <i class="fa fa-search" @click="loadData"></i></button>
                        </div>
                    </div>
                    <div class="pull-right">
                        <a class="btn btn-success" href="/goods/goodsdetailadd"><i class="fa fa-plus" ></i> 新增</a>
                    </div>
                </div>
              <div class="box-body">
                  <table class="table table-hover">
                  <tbody><tr>
                    <th>物品类型</th>
                    <th>物品名称</th>
                    <th>物品数量</th>
                    <th>物品创建时间</th>
                    <th>物品更新时间</th>
                    <th>操作</th>
                  </tr>
                  <tr v-for="item in items">
                    <td>{[ item.Type ]}</td>
                    <td>{[ item.Name ]}</td>
                    <td>{[ item.TotalCount ]}</td>
                    <td>{[ item.Created ]}</td>
                    <td>{[ item.Updated ]}</td>
                    <td>
                    <a class="btn btn-primary" href="/goods/goodsdetailedit/{[ item['Id'] ]}" target="_blank">编辑</a>
                    <a class="btn btn-danger" v-on:click="deleteItem(item.Id)">删除</a>
                    </td>
                  </tr>
                </tbody>
                </table>
              </div>
              <div class="box-footer">
                  <vue-pagination :cur.sync="current_page" :all.sync="total_page" v-on:btn-click="loadData()"></vue-pagination>
              </div>
          </div>
          </div>
      </div>
   </section>
</div>
<script src="/static/js/vue-page.js"></script>
<script>
  Vue.config.delimiters = ['{[', ']}']
  var vue = new Vue({
        el: '#goods_manage',
        data: {
          current_page:1,
          total_page:0,
          items:[],
          keywords:'',
        },
        components:{VuePagination},
        methods:{
          loadData: function(){
              var url = "/api/goods/goodsdetail/list?start=" + this.current_page+"&max=30" + "&keywords="+this.keywords;
              this.$http.get(url, [], []).then(function(response){
                  var data = response.data;
                  if(data.IsSuccess == true){
                      this.items = data.data.Datas;
                      this.total_page = data.data.Total;
                  }else{
                      console.log("error")
                  }
              }, function(response) {
                  alert('请求失败')
              });
          },
          deleteItem:function(id){
             var url = "/api/goods/goodsdetail/delete?id=" + id;
             this.$http.get(url, [], []).then(function(response){
                  var data = response.data;
                  if(data.IsSuccess){
                    alert(data.ErrMsg)
                    this.loadData()
                  }else{
                    alert(data.ErrMsg)
                  }
                  
              }, function(response) {
                  alert('请求失败')
              });
          },
        },
        ready:function(){
          this.loadData();
        }
    });
</script>
{{template "footer.tpl" .}}