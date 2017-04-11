{{template "header.tpl" .}}

<div class="content-wrapper">
	<section class="content-header">
      <h1>
        请假审核详情
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">请假管理</a></li>
        <li class="active">请假审核详情</li>
      </ol>
    </section>
    <section class="content" id="leave_detail">
    <div class="row">
        <div class="col-md-12">
             <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">审核流程</h3>
                </div>
                <div class="box-body">
                      <div class="col-md-12">
                    {{template "reviewStatus.tpl" .}}
                      </div>
                </div>
            </div>
            <div class="box">
              <div class="box-header with-border">
                <h3 class="box-title">请假申请详情</h3>
              </div>
            <div class="box-body">
               <div class="col-md-12">
                  <div class="form-group">
                  <label>请假原因</label>
                  <textarea class="form-control" rows="3" disabled="">{[ reviewDetail["Reason"] ]}</textarea>
                </div>
               </div>
            </div>
            </div>
          <div class="box">
              <div class="box-header with-border">
                <h3 class="box-title">审核级别</h3>
              </div>
          <div class="box-body">
             <div class="col-md-12">
                {{template "reviewLevel.tpl" .}}
             </div>
          </div>
          </div>    
          </div>
        </div>
   </section>
</div>
<script>
    var rid = {{.rid}}
    Vue.config.delimiters = ['{[', ']}']
    var vue = new Vue({
        el: '#leave_detail',
        data: {
            nodelist:{},
            reviewDetail:{},
            reviewStatus:{},
            personList:{},
        },
        methods:{
            
        },
        ready:function(){
            var url = "/api/review/nodelist?reviewId="+ rid +"&types=leave";
            this.$http.get(url, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    this.nodelist = response.data.Datas
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
            });
            var url = "/api/leave/detail?id="+ rid;
            this.$http.get(url, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                  var detail = response.data.data
                    this.reviewDetail = detail[0]
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
            });
            var url = "/api/review/status?reviewId="+ rid +"&types=leave";
            this.$http.get(url, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    this.reviewStatus = response.data.Datas[0]
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
            });
            var url = "/api/review/personlist?reviewId="+ rid +"&types=leave";
            this.$http.get(url, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    this.personList = response.data.Datas
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
            });
        },
    });
</script>
{{template "footer.tpl" .}}