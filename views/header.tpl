<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>QAMS 实用,简单的后台</title>
  <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <link href="//cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
  <link href="https://cdn.bootcss.com/admin-lte/2.3.7/css/AdminLTE.min.css" rel="stylesheet">
  <link href="https://cdn.bootcss.com/admin-lte/2.3.7/css/skins/_all-skins.min.css" rel="stylesheet">
  <link href="//cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
  <script src="https://cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>
  <script src="https://cdn.bootcss.com/jqueryui/1.12.1/jquery-ui.min.js"></script>
  <script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="https://cdn.bootcss.com/admin-lte/2.3.8/js/app.min.js"></script>
  <script src="https://cdn.bootcss.com/admin-lte/2.3.7/js/demo.js"></script>
  {{if eq 1 .vueVersion}}
  <script src="https://cdn.bootcss.com/vue/1.0.25/vue.js"></script>
  <script src="//cdn.bootcss.com/vue-resource/1.0.3/vue-resource.min.js"></script>
  <script src="https://cdn.bootcss.com/vue-validator/2.1.3/vue-validator.js"></script>
  {{else if eq 2 .vueVersion}}
  <script src="https://cdn.bootcss.com/vue/2.1.7/vue.min.js"></script>
  <script src="https://cdn.bootcss.com/vue-resource/1.0.3/vue-resource.min.js"></script>
  {{end}}
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
  	<header class="main-header">
    <a href="/" class="logo">
        <span class="logo-mini"><b>Qa</b></span>
        <span class="logo-lg"><b>Qa</b>后台</span>
    </a>
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">10</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 10 notifications</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 200px;"><ul class="menu" style="overflow: hidden; width: 100%; height: 200px;">
                  <li>
                    <a href="#">
                      <i class="fa fa-users text-aqua"></i> 5 new members joined today
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the
                      page and may cause design problems
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-users text-red"></i> 5 new members joined
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-user text-red"></i> You changed your username
                    </a>
                  </li>
                </ul><div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 3px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div><div class="slimScrollRail" style="width: 3px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
              </li>
              <li class="footer"><a href="#">View all</a></li>
            </ul>
          </li>
          <!-- Tasks: style can be found in dropdown.less -->
          <li class="dropdown tasks-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger">9</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 9 tasks</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 200px;"><ul class="menu" style="overflow: hidden; width: 100%; height: 200px;">
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Design some buttons
                        <small class="pull-right">20%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Create a nice theme
                        <small class="pull-right">40%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">40% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Some task I need to do
                        <small class="pull-right">60%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Make beautiful transitions
                        <small class="pull-right">80%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">80% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                </ul><div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 3px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div><div class="slimScrollRail" style="width: 3px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
              </li>
              <li class="footer">
                <a href="#">View all tasks</a>
              </li>
            </ul>
          </li>
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="http://img2.plures.net/0de1/ee17/efd5/7f6c/7b3d/1960/27a2/6a3c.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">Alexander Pierce</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="http://img2.plures.net/0de1/ee17/efd5/7f6c/7b3d/1960/27a2/6a3c.jpg" class="img-circle" alt="User Image">

                <p>
                  Alexander Pierce - Web Developer
                  <small>Member since Nov. 2012</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
</header>
<aside class="main-sidebar">
   <section class="sidebar">
     <ul class="sidebar-menu">
        <li class="treeview">
          <a href="#">
            <i class="fa fa-user"></i> <span>个人中心</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" style="display: none;">
            
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-book"></i> <span>知识积累</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" {{if eq "article" .controllerName}}style="display: block"{{else}}style="display: None"{{end}}>
            <li class="active"><a href="/article/index"><i class="fa fa-star-o"></i>精彩文章</a></li>
            <li><a href="/article/my"><i class=" fa fa-user-secret"></i>我的文章</a></li>
            <li><a href="/article/my/recycle"><i class="fa fa-trash-o"></i>已删除的文章</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-tasks"></i> <span>项目管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" style="display: none;">
            
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-map-signs"></i> <span>考勤管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" style="display: none;">
            
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-users"></i> <span>请假管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" style="display: none;">
            
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa  fa-calendar-times-o"></i> <span>加班管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" style="display: none;">
            
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-money"></i> <span>报销管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" style="display: none;">
            
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa  fa-archive"></i> <span>物品申请管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" style="display: none;">
            
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-user-plus"></i> <span>出差管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" style="display: none;">
            
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-map-o"></i> <span>简历库</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" style="display: none;">
            
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa  fa-life-buoy"></i> <span>缤彩生活</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" style="display: none;">
            
          </ul>
        </li>
      </ul>
    </section>
</aside>
