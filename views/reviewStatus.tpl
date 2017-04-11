<style>
 .bs-wizard {margin-top: 40px;}

/*Form Wizard*/
.bs-wizard {border-bottom: solid 1px #e0e0e0; padding: 0 0 10px 0;}
.bs-wizard > .bs-wizard-step {padding: 0; position: relative;margin: 0px 0px 20px;}
.bs-wizard > .bs-wizard-step + .bs-wizard-step {}
.bs-wizard > .bs-wizard-step .bs-wizard-info {color: #999; font-size: 14px;position: relative;text-align: center;}
.bs-wizard > .bs-wizard-step > .bs-wizard-dot {position: absolute; width: 50px; height: 50px; display: block; background: #92cf5c; top: 25px; left: 50%; margin-top: -10px; margin-left: -4px; border-radius: 50%;}
.bs-wizard > .bs-wizard-step > .bs-wizard-dot > .glyphicon {margin: 16px 17px; color: white}
.bs-wizard > .bs-wizard-step > .bs-wizard-status {position: absolute; width: 20px; height: 20px; display: block; background: #92cf5c; top: 40px; margin-top: 25px; left:18%;border-radius: 50%;}
.bs-wizard > .bs-wizard-step .bs-wizard-info.start{
  top:-25px;
  left:13px;
}
.bs-wizard > .bs-wizard-step .bs-wizard-info.process{
  top:-5px;
  left:-20px
}
.bs-wizard > .bs-wizard-step .bs-wizard-info.end{
  top:-25px;
  left:13px;
}
.bs-wizard > .bs-wizard-step > .bs-wizard-status.start{
  margin-left: 30px; 
}
.bs-wizard > .bs-wizard-step > .bs-wizard-status.process{
  margin-left: 30px; 
}
.bs-wizard > .bs-wizard-step > .bs-wizard-status.end{
  margin-left: 28px; 
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
<div class="row bs-wizard" style="border-bottom:0;"> 
    <div class="col-xs-2 bs-wizard-step complete">
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="javascript:;" class="bs-wizard-dot"><span class="glyphicon glyphicon-lock"></span></a>
      <div class="bs-wizard-status start"><span class="glyphicon glyphicon-ok"></span></div>
      <div class="bs-wizard-info start">审核申请</div>
      <div class="bs-wizard-reviewName">
        <p>{[ reviewDetail["UserName"] ]}({[ reviewDetail["Name"] ]})</p>
        <p>{[ reviewDetail["Created"] ]}</p>
      </div>
    </div>
    <template v-for="item in nodelist">

      <div class="col-xs-2 bs-wizard-step {[ item['RenderSatus'] ]}">
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="javascript:;" class="bs-wizard-dot"><span class="glyphicon glyphicon-user"></span></a>
      <template v-if="item.Status == 2 ">
        <div class="bs-wizard-status process"><span class="glyphicon glyphicon-ok"></span></div>
      </template>
      <div class="bs-wizard-info process">{[ item["UserName"] ]} {[ item["StatusTitle"] ]}</div>
    </div>
    </template>
    <div class="col-xs-2 bs-wizard-step {[ reviewStatus.RenderSatus ]}"><!-- active -->
      <div class="progress"><div class="progress-bar"></div></div>
      <a href="javascript:;" class="bs-wizard-dot"><span class="glyphicon glyphicon-list-alt"></span></a>
      <template v-if="reviewStatus.Status == 3 ">
        <div class="bs-wizard-status end"><span class="glyphicon glyphicon-ok"></span></div>
      </template>
      <div class="bs-wizard-info end">{[ reviewStatus.StatusTitle ]}</div>
    </div>
</div>