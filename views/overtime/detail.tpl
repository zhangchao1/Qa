{{template "header.tpl" .}}

<div class="content-wrapper">
	<section class="content-header">
      <h1>
        加班审核详情
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">加班管理</a></li>
        <li class="active">加班审核详情</li>
      </ol>
    </section>
    <section class="content" id="overtime_detail">
    <div class="row">
        <div class="col-md-12">
             <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">审核流程</h3>
                </div>
                <div class="box-body">
                      <div class="col-md-12" style="height: 300px">
                    {{template "reviewStatus.tpl" .}}
                      </div>
                </div>
            </div>
            <div class="box">
              <div class="box-header with-border">
                <h3 class="box-title">加班申请详情</h3>
              </div>
            <div class="box-body">
               
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
    var oid = {{.oid}}
    var reviewStatusId = {{.reviewStatusId}}
    Vue.config.delimiters = ['{[', ']}']
    var vue = new Vue({
        el: '#overtime_detail',
        data: {
            nodelist:{},
            reviewDetail:{},
            reviewStatus:{},
            personList:{},
        },
        methods:{
            
        },
        ready:function(){
            var url = "/api/review/nodelist?reviewId="+ reviewStatusId +"&types=overtime";
            this.$http.get(url, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    this.nodelist = response.data.Datas
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
            });
            var url = "/api/overtime/detail?id="+ oid;
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
            var url = "/api/review/status?reviewId="+ reviewStatusId +"&types=overtime";
            this.$http.get(url, [], []).then(function(response){
                if(response.data.IsSuccess == true){
                    this.reviewStatus = response.data.Datas[0]
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
            });
            var url = "/api/review/personlist?reviewId="+ reviewStatusId +"&types=overtime";
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