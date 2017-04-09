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
          <div class="box box-primary">
              <div class="box-header with-border">
                <h3 class="box-title">审核流程</h3>
              </div>
          <div class="box-body">
          <div class="row" style="height:350px">
             <div class="col-md-12">
                <h4>审核状态图</h4>
                {{template "review.tpl" .}}
             </div>
          </div>
           <div class="row">
             <div class="col-md-12">
                <h4>请假审核详情</h4>
             </div>
          </div>
          <div class="row">
             <div class="col-md-12">
                <h4>审核级别</h4>
             </div>
          </div>    
          </div>
        </div>
    </div>
   </section>
</div>
<script>
    Vue.config.delimiters = ['{[', ']}']
    var vue = new Vue({
        el: '#leave_detail',
        data: {
            
        },
        methods:{
            
        },
        ready:function(){
            
        },
    });
</script>
{{template "footer.tpl" .}}