{{template "header.tpl" .}}
<div class="content-wrapper">
  <section class="content-header">
      <h1>
        申请加班
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">加班管理</a></li>
        <li class="active">申请加班</li>
      </ol>
    </section>
    <section class="content" id="overtime_my">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
            <div class="pull-right">
                <a class="btn btn-success" href="/overtime/add"><i class="fa fa-plus"></i> 新增加班申请</a>
            </div>
            </div>
            <div class="box-body">
                <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
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
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_1">
                <table class="table table-hover">
                <tbody><tr>
                  <th>加班开始时间</th>
                  <th>加班结束时间</th>
                  <th>加班原因</th>
                  <th>加班时长(单位:天)</th>
                  <th>更新时间</th>
                  <th>加班有效使用期</th>
                  <th>操作</th>
                  <th>详情</th>
                </tr>
                <tr v-for="item in myOnApprove.items">
                  <td>{[ item.StartTime ]}</td>
                  <td>{[ item.Endtime ]}</td>
                  <td>{[ item.Reason ]}</td>
                  <td>{[ item.LongTime ]}</td>
                  <td>{[ item.Updated ]}</td>
                  <td>{[ item.ExpireTime ]}</td>
                  <td><a class="btn btn-info" v-on:click="cancelReview(item.ReId)">取消申请</a></td>
                  <td><a class="btn btn-primary" href="/overtime/detail/{[ item['OtId'] ]}" target="_blank">审核详情</a></td>
                </tr>
              </tbody></table>
              </div>
              <div class="tab-pane" id="tab_2">
                <table class="table table-hover">
                <tbody><tr>
                  <th>加班开始时间</th>
                  <th>加班结束时间</th>
                  <th>加班原因</th>
                  <th>加班时长(单位:天)</th>
                  <th>更新时间</th>
                  <th>加班有效使用期</th>
                  <th>详情</th>
                </tr>
                <tr v-for="item in myApprovIng.items">
                  <td>{[ item.StartTime ]}</td>
                  <td>{[ item.Endtime ]}</td>
                  <td>{[ item.Reason ]}</td>
                  <td>{[ item.LongTime ]}</td>
                  <td>{[ item.Updated ]}</td>
                  <td>{[ item.ExpireTime ]}</td>
                  <td><a class="btn btn-primary" href="/overtime/detail/{[ item['OtId'] ]}" target="_blank">审核详情</a></td>
                </tr>
              </tbody></table>
              </div>
              <div class="tab-pane" id="tab_3">
                <table class="table table-hover">
                <tbody><tr>
                  <th>加班开始时间</th>
                  <th>加班结束时间</th>
                  <th>加班原因</th>
                  <th>加班时长(单位:天)</th>
                  <th>更新时间</th>
                  <th>加班有效使用期</th>
                  <th>详情</th>
                </tr>
                <tr v-for="item in myApprove.items">
                  <td>{[ item.StartTime ]}</td>
                  <td>{[ item.Endtime ]}</td>
                  <td>{[ item.Reason ]}</td>
                  <td>{[ item.LongTime ]}</td>
                  <td>{[ item.Updated ]}</td>
                  <td>{[ item.ExpireTime ]}</td>
                  <td><a class="btn btn-primary" href="/overtime/detail/{[ item['OtId'] ]}" target="_blank">审核详情</a></td>
                </tr>
              </tbody></table>
              </div>
              <div class="tab-pane" id="tab_4">
                <table class="table table-hover">
                <tbody><tr>
                  <th>加班开始时间</th>
                  <th>加班结束时间</th>
                  <th>加班原因</th>
                  <th>加班时长(单位:天)</th>
                  <th>更新时间</th>
                  <th>加班有效使用期</th>
                  <th>详情</th>
                </tr>
                <tr v-for="item in myRefuse.items">
                  <td>{[ item.StartTime ]}</td>
                  <td>{[ item.Endtime ]}</td>
                  <td>{[ item.Reason ]}</td>
                  <td>{[ item.LongTime ]}</td>
                  <td>{[ item.Updated ]}</td>
                  <td>{[ item.ExpireTime ]}</td>
                  <td><a class="btn btn-primary" href="/overtime/detail/{[ item['OtId'] ]}" target="_blank">审核详情</a></td>
                </tr>
              </tbody></table>
              </div>
              <div class="tab-pane" id="tab_5">
                <table class="table table-hover">
                <tbody><tr>
                  <th>加班开始时间</th>
                  <th>加班结束时间</th>
                  <th>加班原因</th>
                  <th>加班时长(单位:天)</th>
                  <th>更新时间</th>
                  <th>加班有效使用期</th>
                  <th>详情</th>
                </tr>
                <tr v-for="item in myCancel.items">
                  <td>{[ item.StartTime ]}</td>
                  <td>{[ item.Endtime ]}</td>
                  <td>{[ item.Reason ]}</td>
                  <td>{[ item.LongTime ]}</td>
                  <td>{[ item.Updated ]}</td>
                  <td>{[ item.ExpireTime ]}</td>
                  <td><a class="btn btn-primary" href="/overtime/detail/{[ item['OtId'] ]}" target="_blank">审核详情</a></td>
                </tr>
              </tbody></table>
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
                  <a class="btn btn-primary" href="/overtime/detail/{[ item['ReviewStatusId'] ]}" target="_blank">审核详情</a>
                  </td>
                </tr>
              </tbody></table>
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
                  <a class="btn btn-primary" href="/overtime/detail/{[ item['ReviewStatusId'] ]}" target="_blank">审核详情</a>
                  </td>
                </tr>
              </tbody></table>
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
                  <a class="btn btn-primary" href="/overtime/detail/{[ item['ReviewStatusId'] ]}" target="_blank">审核详情</a>
                  </td>
                </tr>
              </tbody></table>
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
<script>
  Vue.config.delimiters = ['{[', ']}']
  var vue = new Vue({
        el: '#overtime_my',
        data: {
          myOnApprove:{
             currentpage:0,
             total:0,
             items:{}
          },
          myApprovIng:{
             currentpage:0,
             total:0,
             items:{}
          },
          myApprove:{
             currentpage:0,
             total:0,
             items:{}
          },
          myRefuse:{
             currentpage:0,
             total:0,
             items:{}
          },
          myCancel:{
             currentpage:0,
             total:0,
             items:{}
          },
          isApprove:{
            currentpage:0,
            total:0,
            items:{}
          },
          hasRefused:{
            currentpage:0,
            total:0,
            items:{}
          },
          hasApprove:{
            currentpage:0,
            total:0,
            items:{}
          },
          approveDetail:"",
          currentApproveItems:{},
          refuseDetail:""
        },
        methods:{
          getReviewData:function(page ,status){
            var url = "/api/overtime/list?start="+ page +"&max=20&status=" + status
            this.$http.get(url, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    if(status == 1){
                        this.myOnApprove.currentpage = page
                        this.myOnApprove.total = response.data.data.Total
                        this.myOnApprove.items = response.data.data.Datas
                      }else if(status == 2){
                        this.myApprovIng.currentpage = page
                        this.myApprovIng.total = response.data.data.Total
                        this.myApprovIng.items = response.data.data.Datas
                      }else if(status == 3){
                        this.myApprove.currentpage = page
                        this.myApprove.total = response.data.data.Total
                        this.myApprove.items = response.data.data.Datas
                      }else if(status == 4){
                        this.myRefuse.currentpage = page
                        this.myRefuse.total = response.data.data.Total
                        this.myRefuse.items = response.data.data.Datas
                      }else if(status == 5){
                        this.myCancel.currentpage = page
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
            var url = "/api/review/cancel?reId="+ reviewId + "&types=overtime"
            this.$http.get(url, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    alert(response.data.ErrMsg);
                    this.getReviewData(1,1)
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
          myReviewList:function(page,status){
            var url = "/api/review/list?start="+ page +"&max=20&status=" + status + "&types=overtime"
            this.$http.get(url, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    if(status == 1){
                        this.isApprove.currentpage = page
                        this.isApprove.total = response.data.Datas.Total
                        this.isApprove.items = response.data.Datas.Datas
                      }else if(status == 2){
                        this.hasApprove.currentpage = page
                        this.hasApprove.total = response.data.Datas.Total
                        this.hasApprove.items = response.data.Datas.Datas
                      }else if(status == 3){
                        this.hasRefused.currentpage = page
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
            var url = "/api/review/approve?id="+ this.currentApproveItems.Id +"&reviewId=" + this.currentApproveItems.ReviewStatusId + "&level=" + this.currentApproveItems.Level + "&uid="+ this.currentApproveItems.Uid+"&types=overtime" + "&detail="+ this.approveDetail;
            this.$http.get(url, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    alert(response.data.ErrMsg);
                    this.myReviewList(1,1)
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
            var url = "/api/review/refuse?id="+ this.currentApproveItems.Id +"&reviewId=" + this.currentApproveItems.ReviewStatusId + "&level=" + this.currentApproveItems.Level + "&detail="+ this.refuseDetail + "&types=overtime";
            this.$http.get(url, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    alert(response.data.ErrMsg);
                    this.myReviewList(1,1)
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
            });
          },
        },
        ready:function(){
          this.getReviewData(1,1)
          this.getReviewData(1,2)
          this.getReviewData(1,3)
          this.getReviewData(1,4)
          this.getReviewData(1,5)
          this.myReviewList(1,1)
          this.myReviewList(1,2)
          this.myReviewList(1,3)
        }
    });
</script>
{{template "footer.tpl" .}}