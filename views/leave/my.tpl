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
    <section class="content" id="leave_my">
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
              <li><a href="#tab_2" data-toggle="tab">审核中</a></li>
              <li><a href="#tab_3" data-toggle="tab">已通过</a></li>

              <li><a href="#tab_4" data-toggle="tab">已拒绝</a></li>
              <li><a href="#tab_5" data-toggle="tab">已取消</a></li>
              <li><a href="#tab_6" data-toggle="tab">待我审核</a></li>
              <li><a href="#tab_7" data-toggle="tab">被我审核通过</a></li>
              <li><a href="#tab_8" data-toggle="tab">被我拒绝</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_1">
                <table class="table table-hover">
                <tbody><tr>
                  <th>请假类型</th>
                  <th>请假开始时间</th>
                  <th>请假结束时间</th>
                  <th>请假原因</th>
                  <th>请假时长(单位:天)</th>
                  <th>更新时间</th>
                  <th>操作</th>
                  <th>详情</th>
                </tr>
                <tr v-for="item in myOnApprove.items">
                  <td>{[ item.Type ]}</td>
                  <td>{[ item.StartTime ]}</td>
                  <td>{[ item.Endtime ]}</td>
                  <td>{[ item.Reason ]}</td>
                  <td>{[ item.LongTime ]}</td>
                  <td>{[ item.Updated ]}</td>
                  <td><a class="btn btn-info" v-on:click="cancelReview(item.ReId)">取消申请</a></td>
                  <td><a class="btn btn-primary" href="/leave/detail/{[ item['LeId'] ]}" target="_blank">审核详情</a></td>
                </tr>
              </tbody></table>
               <div class="box-footer clearfix">
                    <vue-pagination :cur.sync="myOnApprove.currentpage" :all.sync="myOnApprove.total" v-on:btn-click="getReviewData(1)"></vue-pagination>
              </div>
              </div>
              <div class="tab-pane" id="tab_2">
                <table class="table table-hover">
                <tbody><tr>
                  <th>请假类型</th>
                  <th>请假开始时间</th>
                  <th>请假结束时间</th>
                  <th>请假原因</th>
                  <th>请假时长(单位:天)</th>
                  <th>更新时间</th>
                  <th>详情</th>
                </tr>
                <tr v-for="item in myApprovIng.items">
                  <td>{[ item.Type ]}</td>
                  <td>{[ item.StartTime ]}</td>
                  <td>{[ item.Endtime ]}</td>
                  <td>{[ item.Reason ]}</td>
                  <td>{[ item.LongTime ]}</td>
                  <td>{[ item.Updated ]}</td>
                  <td><a class="btn btn-primary" href="/leave/detail/{[ item['LeId'] ]}" target="_blank">审核详情</a></td>
                </tr>
              </tbody></table>
                <div class="box-footer clearfix">
                    <vue-pagination :cur.sync="myApprovIng.currentpage" :all.sync="myApprovIng.total" v-on:btn-click="getReviewData(2)"></vue-pagination>
              </div>
              </div>
              <div class="tab-pane" id="tab_3">
                <table class="table table-hover">
                <tbody><tr>
                  <th>请假类型</th>
                  <th>请假开始时间</th>
                  <th>请假结束时间</th>
                  <th>请假原因</th>
                  <th>请假时长(单位:天)</th>
                  <th>更新时间</th>
                  <th>详情</th>
                </tr>
                <tr v-for="item in myApprove.items">
                  <td>{[ item.Type ]}</td>
                  <td>{[ item.StartTime ]}</td>
                  <td>{[ item.Endtime ]}</td>
                  <td>{[ item.Reason ]}</td>
                  <td>{[ item.LongTime ]}</td>
                  <td>{[ item.Updated ]}</td>
                  <td><a class="btn btn-primary" href="/leave/detail/{[ item['LeId'] ]}" target="_blank">审核详情</a></td>
                </tr>
              </tbody></table>
              <div class="box-footer clearfix">
                    <vue-pagination :cur.sync="myApprove.currentpage" :all.sync="myApprove.total" v-on:btn-click="getReviewData(3)"></vue-pagination>
              </div>
              </div>
              <div class="tab-pane" id="tab_4">
                <table class="table table-hover">
                <tbody><tr>
                  <th>请假类型</th>
                  <th>请假开始时间</th>
                  <th>请假结束时间</th>
                  <th>请假原因</th>
                  <th>请假时长(单位:天)</th>
                  <th>更新时间</th>
                  <th>详情</th>
                </tr>
                <tr v-for="item in myRefuse.items">
                  <td>{[ item.Type ]}</td>
                  <td>{[ item.StartTime ]}</td>
                  <td>{[ item.Endtime ]}</td>
                  <td>{[ item.Reason ]}</td>
                  <td>{[ item.LongTime ]}</td>
                  <td>{[ item.Updated ]}</td>
                  <td><a class="btn btn-primary" href="/leave/detail/{[ item['LeId'] ]}" target="_blank">审核详情</a></td>
                </tr>
              </tbody></table>
              <div class="box-footer clearfix">
                    <vue-pagination :cur.sync="myRefuse.currentpage" :all.sync="myRefuse.total" v-on:btn-click="getReviewData(4)"></vue-pagination>
              </div>
              </div>
              <div class="tab-pane" id="tab_5">
                <table class="table table-hover">
                <tbody><tr>
                  <th>请假类型</th>
                  <th>请假开始时间</th>
                  <th>请假结束时间</th>
                  <th>请假原因</th>
                  <th>请假时长(单位:天)</th>
                  <th>更新时间</th>
                  <th>详情</th>
                </tr>
                <tr v-for="item in myCancel.items">
                  <td>{[ item.Type ]}</td>
                  <td>{[ item.StartTime ]}</td>
                  <td>{[ item.Endtime ]}</td>
                  <td>{[ item.Reason ]}</td>
                  <td>{[ item.LongTime ]}</td>
                  <td>{[ item.Updated ]}</td>
                  <td><a class="btn btn-primary" href="/leave/detail/{[ item['LeId'] ]}" target="_blank">审核详情</a></td>
                </tr>
              </tbody></table>
              <div class="box-footer clearfix">
                    <vue-pagination :cur.sync="myCancel.currentpage" :all.sync="myCancel.total" v-on:btn-click="getReviewData(5)"></vue-pagination>
              </div>
              </div>
               <div class="tab-pane" id="tab_6">
                <table class="table table-hover">
                <tbody><tr>
                  <th>类型</th>
                  <th>创建时间</th>
                  <th>被审核人</th>
                  <th>职位</th>
                  <th>操作</th>
                </tr>
                <tr v-for="item in isApprove.items">
                  <td>{[ item.Type ]}</td>
                  <td>{[ item.Created ]}</td>
                  <td>{[ item.UserName ]}</td>
                  <td>{[ item.Job ]}</td>
                  <td>
                  <a class="btn btn-info" data-toggle="modal" data-target="#approveModal" v-on:click="getCurrentApproveItem(item)">审核通过</a>
                  <a class="btn btn-danger" data-toggle="modal" data-target="#refuseModal" v-on:click="getCurrentApproveItem(item)">审核拒绝</a>
                  <a class="btn btn-primary" href="/leave/detail/{[ item['ReviewStatusId'] ]}" target="_blank">审核详情</a>
                  </td>
                </tr>
              </tbody></table>
              <div class="box-footer clearfix">
                    <vue-pagination :cur.sync="isApprove.currentpage" :all.sync="isApprove.total" v-on:btn-click="myReviewList(1)"></vue-pagination>
              </div>
              </div>
              <div class="tab-pane" id="tab_7">
                <table class="table table-hover">
                <tbody><tr>
                  <th>类型</th>
                  <th>创建时间</th>
                  <th>被审核人</th>
                  <th>职位</th>
                  <th>详情</th>
                </tr>
                <tr v-for="item in hasApprove.items">
                  <td>{[ item.Type ]}</td>
                  <td>{[ item.Created ]}</td>
                  <td>{[ item.UserName ]}</td>
                  <td>{[ item.Job ]}</td>
                  <td>
                  <a class="btn btn-primary" href="/leave/detail/{[ item['ReviewStatusId'] ]}" target="_blank">审核详情</a>
                  </td>
                </tr>
              </tbody></table>
              <div class="box-footer clearfix">
                    <vue-pagination :cur.sync="hasApprove.currentpage" :all.sync="hasApprove.total" v-on:btn-click="myReviewList(2)"></vue-pagination>
              </div>
              </div>
              <div class="tab-pane" id="tab_8">
                <table class="table table-hover">
                <tbody><tr>
                  <th>类型</th>
                  <th>创建时间</th>
                  <th>被审核人</th>
                  <th>职位</th>
                  <th>详情</th>
                </tr>
                <tr v-for="item in hasRefused.items">
                  <td>{[ item.Type ]}</td>
                  <td>{[ item.Created ]}</td>
                  <td>{[ item.UserName ]}</td>
                  <td>{[ item.Job ]}</td>
                  <td>
                  <a class="btn btn-primary" href="/leave/detail/{[ item['ReviewStatusId'] ]}" target="_blank">审核详情</a>
                  </td>
                </tr>
              </tbody></table>
              <div class="box-footer clearfix">
                    <vue-pagination :cur.sync="hasRefused.currentpage" :all.sync="hasRefused.total" v-on:btn-click="myReviewList(3)"></vue-pagination>
              </div>
              </div>
            </div>
          </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal fade" id="approveModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
          &times;
        </button>
        <h4 class="modal-title" id="myModalLabel">
          申请通过
        </h4>
      </div>
      <div class="modal-body">
        <form role="form">   
          <div class="form-group">
            <label>备注</label>
            <textarea class="form-control" rows="4" placeholder="输入通过的备注" v-model="approveDetail"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">放弃
        </button>
        <button type="button" class="btn btn-primary" v-on:click="approveReview">
          确认审核通过
        </button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal -->
</div>
<div class="modal fade" id="refuseModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
          &times;
        </button>
        <h4 class="modal-title" id="myModalLabel">
          审核被拒绝
        </h4>
      </div>
      <div class="modal-body">
        <form role="form">   
          <div class="form-group">
            <label>备注</label>
            <textarea class="form-control" rows="4" placeholder="输入审核拒绝的备注" v-model="refuseDetail"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">放弃
        </button>
        <button type="button" class="btn btn-primary" v-on:click="RefuseReview">
          确认审核拒绝
        </button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal -->
</div>
   </section>
</div>
<script src="/static/js/vue-page.js"></script>
<script>
  Vue.config.delimiters = ['{[', ']}']
  var vue = new Vue({
        el: '#leave_my',
        data: {
          myOnApprove:{
             currentpage:1,
             total:0,
             items:{}
          },
          myApprovIng:{
             currentpage:1,
             total:0,
             items:{}
          },
          myApprove:{
             currentpage:1,
             total:0,
             items:{}
          },
          myRefuse:{
             currentpage:1,
             total:0,
             items:{}
          },
          myCancel:{
             currentpage:1,
             total:0,
             items:{}
          },
          isApprove:{
            currentpage:1,
            total:0,
            items:{}
          },
          hasRefused:{
            currentpage:1,
            total:0,
            items:{}
          },
          hasApprove:{
            currentpage:1,
            total:0,
            items:{}
          },
          approveDetail:"",
          currentApproveItems:{},
          refuseDetail:""
        },
        components:{VuePagination},
        methods:{
          getReviewData:function(status){
            var page;
            if(status == 1){
              page = this.myOnApprove.currentpage;
            }else if(status == 2){
              page = this.myApprovIng.currentpage;
            }else if(status == 3){
              page = this.myApprove.currentpage;
            }else if(status == 4){
              page = this.myRefuse.currentpage;
            }else if(status == 5){
              page = this.myCancel.currentpage;
            }
            var url = "/api/leave/leaveList?start="+ page +"&max=20&status=" + status
            this.$http.get(url, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    if(status == 1){
                
                        this.myOnApprove.total = response.data.data.Total
                        this.myOnApprove.items = response.data.data.Datas
                      }else if(status == 2){
                        this.myApprovIng.total = response.data.data.Total
                        this.myApprovIng.items = response.data.data.Datas
                      }else if(status == 3){
                        this.myApprove.total = response.data.data.Total
                        this.myApprove.items = response.data.data.Datas
                      }else if(status == 4){
                        this.myRefuse.total = response.data.data.Total
                        this.myRefuse.items = response.data.data.Datas
                      }else if(status == 5){
                        this.myCancel.total = response.data.data.Total
                        this.myCancel.items = response.data.data.Datas
                      }
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
            });
          },
          cancelReview:function(reviewId){
            var url = "/api/review/cancel?reId="+ reviewId + "&types=leave"
            this.$http.get(url, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    alert(response.data.ErrMsg);
                    this.getReviewData(1)
                    this.getReviewData(5)
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
            });
          },
          getCurrentApproveItem:function(item){
            this.currentApproveItems = item
          },
          myReviewList:function(status){
            var page;
            if(status == 1){
              page=this.isApprove.currentpage
            }else if(status == 2){
              page = this.hasApprove.currentpage
            }else if(status == 3){
              page = this.hasRefused.currentpage
            }
            var url = "/api/review/list?start="+ page +"&max=20&status=" + status + "&types=leave"
            this.$http.get(url, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    if(status == 1){
                        this.isApprove.total = response.data.Datas.Total
                        this.isApprove.items = response.data.Datas.Datas
                      }else if(status == 2){
                        this.hasApprove.total = response.data.Datas.Total
                        this.hasApprove.items = response.data.Datas.Datas
                      }else if(status == 3){
                        this.hasRefused.total = response.data.Datas.Total
                        this.hasRefused.items = response.data.Datas.Datas
                      }
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
            });
          },
          approveReview:function(){
            if(this.approveDetail == ""){
              alert("请填好审核备注")
              return
            }
            var url = "/api/review/approve?id="+ this.currentApproveItems.Id +"&reviewId=" + this.currentApproveItems.ReviewStatusId + "&level=" + this.currentApproveItems.Level + "&uid="+ this.currentApproveItems.Uid+"&types=leave" + "&detail="+ this.approveDetail;
            this.$http.get(url, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    alert(response.data.ErrMsg);
                    $("#approveModal").modal('hide')
                    this.myReviewList(1)
                    this.myReviewList(2)
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
            });
          },
          RefuseReview:function(){
            if(this.refuseDetail == ""){
              alert("请填好审核备注")
              return
            }
            var url = "/api/review/refuse?id="+ this.currentApproveItems.Id +"&reviewId=" + this.currentApproveItems.ReviewStatusId + "&level=" + this.currentApproveItems.Level + "&detail="+ this.refuseDetail + "&types=leave";
            this.$http.get(url, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    alert(response.data.ErrMsg);
                    $("#refuseModal").modal('hide')
                    this.myReviewList(1)
                    this.myReviewList(3)
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
            });
          },
        },
        ready:function(){
          this.getReviewData(1)
          this.getReviewData(2)
          this.getReviewData(3)
          this.getReviewData(4)
          this.getReviewData(5)
          this.myReviewList(1)
          this.myReviewList(2)
          this.myReviewList(3)
        }
    });
</script>
{{template "footer.tpl" .}}