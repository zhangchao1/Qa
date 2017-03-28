{{template "header.tpl" .}}
<style>
 .bs-wizard {margin-top: 40px;}

/*Form Wizard*/
.bs-wizard {border-bottom: solid 1px #e0e0e0; padding: 0 0 10px 0;}
.bs-wizard > .bs-wizard-step {padding: 0; position: relative;}
.bs-wizard > .bs-wizard-step + .bs-wizard-step {}
.bs-wizard > .bs-wizard-step .bs-wizard-stepnum {color: #595959; font-size: 16px; margin-bottom: 5px;}
.bs-wizard > .bs-wizard-step .bs-wizard-info {color: #999; font-size: 14px;}
.bs-wizard > .bs-wizard-step > .bs-wizard-dot {position: absolute; width: 40px; height: 40px; display: block; background: #92cf5c; top: 45px; left: 50%; margin-top: -7px; margin-left: -8px; border-radius: 50%;}
.bs-wizard > .bs-wizard-step > .bs-wizard-dot > .glyphicon {margin: 12px 12px; color: #0000}
.bs-wizard > .bs-wizard-step > .progress {position: relative; border-radius: 0px; height: 8px; box-shadow: none; margin: 30px 0; background-color: #e5e5e5; overflow: hidden;}
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
                
                <div class="col-xs-3 bs-wizard-step complete">
                  <div class="text-center bs-wizard-stepnum">Step 1</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="javascript:;" class="bs-wizard-dot"><span class="glyphicon glyphicon-user"></span></a>
                  <div class="bs-wizard-info text-center">Create</div>
                </div>
                
                <div class="col-xs-3 bs-wizard-step complete"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Step 2</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="javascript:;" class="bs-wizard-dot"><span class="glyphicon glyphicon-user"></span>
</a>
                  <div class="bs-wizard-info text-center">Edit</div>
                </div>
                
                <div class="col-xs-3 bs-wizard-step active"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Step 3</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="javascript:;" class="bs-wizard-dot"><span class="glyphicon glyphicon-user"></span>
</a>
                  <div class="bs-wizard-info text-center">Save</div>
                </div>
                
                <div class="col-xs-3 bs-wizard-step disabled"><!-- active -->
                  <div class="text-center bs-wizard-stepnum">Step 4</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="javascript:;" class="bs-wizard-dot"><span class="glyphicon glyphicon-user"></span>
</a>
                  <div class="bs-wizard-info text-center">Share</div>
                </div>
                <div class="col-xs-3 bs-wizard-step disabled"><!-- active -->
                  <div class="text-center bs-wizard-stepnum">Step 5</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="javascript:;" class="bs-wizard-dot"><span class="glyphicon glyphicon-user"></span>
</a>
                  <div class="bs-wizard-info text-center">Share</div>
                </div>
            </div>
   </section>
</div>
{{template "footer.tpl" .}}