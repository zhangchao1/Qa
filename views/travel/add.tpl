{{template "header.tpl" .}}
<style>
 .bs-wizard {margin-top: 40px;}

/*Form Wizard*/
.bs-wizard {border-bottom: solid 1px #e0e0e0; padding: 0 0 10px 0;}
.bs-wizard > .bs-wizard-step {padding: 0; position: relative;margin: 0px 0px 20px;}
.bs-wizard > .bs-wizard-step + .bs-wizard-step {}
.bs-wizard > .bs-wizard-step .bs-wizard-info {color: #999; font-size: 14px;top: -25px;position: relative;text-align: center;}
.bs-wizard > .bs-wizard-step > .bs-wizard-dot {position: absolute; width: 50px; height: 50px; display: block; background: #92cf5c; top: 25px; left: 50%; margin-top: -10px; margin-left: -4px; border-radius: 50%;}
.bs-wizard > .bs-wizard-step > .bs-wizard-dot > .glyphicon {margin: 16px 17px; color: white}
.bs-wizard > .bs-wizard-step > .bs-wizard-status {position: absolute; width: 20px; height: 20px; display: block; background: #92cf5c; top: 40px; margin-top: 25px; left:18%;border-radius: 50%;}
.bs-wizard > .bs-wizard-step > .bs-wizard-status.start{
  margin-left: 9px; 
}
.bs-wizard > .bs-wizard-step > .bs-wizard-status.process{
  margin-left: 30px; 
}
.bs-wizard > .bs-wizard-step > .bs-wizard-status.end{
  margin-left: 2px; 
}
.bs-wizard > .bs-wizard-step > .bs-wizard-status > .glyphicon{color: white;margin: 2px 2px;}
.bs-wizard > .bs-wizard-step > .bs-wizard-reviewName{
  position: absolute; top:80px;margin-left: 70px;margin-top: 10px;margin-bottom: 20px
}
.bs-wizard > .bs-wizard-step > .bs-wizard-reviewName > p{
  margin: 0 10px;color:#7c887c;
}
.bs-wizard > .bs-wizard-step > .progress {position: relative; border-radius: 0px; height: 8px; box-shadow: none; margin: 40px 0; background-color: #e5e5e5; overflow: hidden;}
.bs-wizard > .bs-wizard-step > .progress > .progress-bar {width:0px; box-shadow: none; background: #92cf5c;}
.bs-wizard > .bs-wizard-step.complete > .progress > .progress-bar {width:100%;}
.bs-wizard > .bs-wizard-step.active > .progress > .progress-bar {width:50%;}
.bs-wizard > .bs-wizard-step:first-child.active > .progress > .progress-bar {width:0%;}
.bs-wizard > .bs-wizard-step:last-child.active > .progress > .progress-bar {width: 100%;}
.bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot {background-color: #e5e5e5;}
.bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot:after {opacity: 0;}
.bs-wizard > .bs-wizard-step:first-child  > .progress {left: 50%; width: 50%;}
.bs-wizard > .bs-wizard-step:last-child  > .progress {width: 50%;}
.bs-wizard > .bs-wizard-step.disabled a.bs-wizard-dot{ pointer-events: none; }
</style>
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        出差申请
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">出差管理</a></li>
        <li class="active">出差申请</li>
      </ol>
    </section>
    <section class="content" id="travel_add">
       <div class="row bs-wizard" style="border-bottom:0;">
                
                <div class="col-xs-2 bs-wizard-step complete">
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="javascript:;" class="bs-wizard-dot"><span class="glyphicon glyphicon-lock"></span></a>
                  <div class="bs-wizard-status start"><span class="glyphicon glyphicon-ok"></span></div>
                  <div class="bs-wizard-info">提交申请单</div>
                  <div class="bs-wizard-reviewName">
                    <p>张超(zhangchao)</p>
                    <p>2017/03/08 14:56:55</p>
                  </div>
                </div>
                <div class="col-xs-2 bs-wizard-step complete"><!-- complete -->
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="javascript:;" class="bs-wizard-dot"><span class="glyphicon glyphicon-user"></span>
</a>               <div class="bs-wizard-status process"><span class="glyphicon glyphicon-ok"></span></div>
                  <div class="bs-wizard-info">欧阳证明觉得骄傲</div>
                </div>
                
                <div class="col-xs-2 bs-wizard-step active"><!-- complete -->
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="javascript:;" class="bs-wizard-dot"><span class="glyphicon glyphicon-user"></span>
</a>
                  <div class="bs-wizard-status process"><span class="glyphicon glyphicon-ok"></span></div>
                  <div class="bs-wizard-info">Save</div>
                </div>
                
                <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="javascript:;" class="bs-wizard-dot"><span class="glyphicon glyphicon-user"></span>
</a>              <div class="bs-wizard-status process"><span class="glyphicon glyphicon-ok"></span></div>
                  <div class="bs-wizard-info">Share</div>
                </div>
                <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="javascript:;" class="bs-wizard-dot"><span class="glyphicon glyphicon-user"></span>
</a>              <div class="bs-wizard-status process"><span class="glyphicon glyphicon-ok"></span></div>
                  <div class="bs-wizard-info text-center">Share</div>
                </div>
                <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="javascript:;" class="bs-wizard-dot"><span class="glyphicon glyphicon-user"></span>
</a>              <div class="bs-wizard-status process"><span class="glyphicon glyphicon-ok"></span></div>
                  <div class="bs-wizard-info">Share</div>
                </div>
                <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="javascript:;" class="bs-wizard-dot"><span class="glyphicon glyphicon-user"></span>
</a>              <div class="bs-wizard-status end"><span class="glyphicon glyphicon-ok"></span></div>
                  <div class="bs-wizard-info">审核流程完成</div>
                </div>
            </div>
   </section>
</div>
{{template "footer.tpl" .}}