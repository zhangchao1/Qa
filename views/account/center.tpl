{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        个人中心
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">用户</a></li>
        <li class="active">个人中心</li>
      </ol>
    </section>
    <section class="content" id="attendance_add">
      <div class="row">
        <div class="col-md-4">
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="{{.useravatar}}" alt="User profile picture">
              <h3 class="profile-username text-center">{{.username}}</h3>
              <p class="text-muted text-center">{{.userjob}}</p>
              <ul class="nav nav-stacked">
                <li><a href="#">年龄 <span class="pull-right text-green">{{.userage}}</span></a></li>
                <li><a href="#">性别 <span class="pull-right text-green">{{.usersex}}</span></a></li>
                <li><a href="#">部门<span class="pull-right text-green">技术部</span></a></li>
                <li><a href="#">职位<span class="pull-right text-green">PHP组</span></a></li>
                <li><a href="#">生日 <span class="pull-right text-green">1900-00-00</span></a></li>
                <li><a href="#">联系方式 <span class="pull-right text-green">18080909000</span></a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="col-md-8">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">关于我</h3>
            </div>
            <div class="box-body">
              <strong><i class="fa fa-book margin-r-5"></i>教育</strong>
              <p class="text-muted">
                B.S. in Computer Science from the University of Tennessee at Knoxville
              </p>
              <hr>
              <strong><i class="fa fa-map-marker margin-r-5"></i>所在地</strong>
              <p class="text-muted">Malibu, California</p>
              <hr>
              <strong><i class="fa fa-pencil margin-r-5"></i>擅长的技能</strong>
              <p>
                <span class="label label-danger">UI Design</span>
                <span class="label label-success">Coding</span>
                <span class="label label-info">Javascript</span>
                <span class="label label-warning">PHP</span>
                <span class="label label-primary">Node.js</span>
              </p>
              <hr>
              <strong><i class="fa fa-file-text-o margin-r-5"></i>座右铭</strong>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
              <hr>
              <strong><i class="fa fa-file-text-o margin-r-5"></i>个人喜好</strong>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
            </div>
            <!-- /.box-body -->
          </div> 
        </div>
      </div>
      <div class="row">
        <h3>
        时间安排表
      </h3>
        <div class="row">
        <div class="col-md-12">
          <ul class="timeline">
            <li class="time-label">
              <span class="bg-red">
                10 Feb. 2014
              </span>
              <li>
              <i class="fa fa-envelope bg-blue"></i>

              <div class="timeline-item">
                <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>

                <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>

                <div class="timeline-body">
                  Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                  weebly ning heekya handango imeem plugg dopplr jibjab, movity
                  jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                  quora plaxo ideeli hulu weebly balihoo...
                </div>
                <div class="timeline-footer">
                  <a class="btn btn-primary btn-xs">Read more</a>
                  <a class="btn btn-danger btn-xs">Delete</a>
                </div>
              </div>
            </li>
            </li>
          </ul>
        </div>
      </div>
      </div>
   </section>
</div>
{{template "footer.tpl" .}}