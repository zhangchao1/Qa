{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        编辑个人资料
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">用户</a></li>
        <li class="active">编辑个人资料</li>
      </ol>
    </section>
    <section class="content" id="user_detail">
      <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">个人资料</h3>
                  <div class="pull-right">
                  </div>
            </div>
              <div class="box-body">
              <validator name="validation1">
                <form role="form">
                <div class="form-group">
                    <label><i class=" fa fa-birthday-cake">(出生日期)</i></label>
                    <input type="text" class="form-control" placeholder="输入日期" v-model="Birthday" v-validate:Birthday="['required']" id="birth"> 
                </div>
                 <div class="form-group">
                    <label><i class="fa fa-mobile-phone">(联系方式)</i></label>
                    <input type="text" class="form-control" placeholder="输入手机号" v-model="PhoneNum" v-validate:PhoneNum="['required']"> 
                </div>
                <div class="form-group">
                    <label><i class="fa fa fa-book margin-r-5">(教育方式描述)</i></label>
                    <textarea class="form-control" rows="3" placeholder="教育描述" v-model="Eduction" v-validate:Eduction="['required']"></textarea>
                </div>
                <div class="form-group">
                    <label><i class="fa fa-map-marker margin-r-5">(所在地)</i></label>
                    <input type="text" class="form-control" placeholder="输入地址简介" v-model="Location" v-validate:Location="['required']"> 
                </div>
                <div class="form-group">
                    <label><i class="fa fa-pencil margin-r-5">(技能)</i>
                      <a href="javascript:" v-on:click="add">
                        <span class="glyphicon glyphicon-plus"></span>
                      </a>
                      <a href="javascript:" v-on:click="remove">
                      <span class="glyphicon glyphicon-minus"></span>
                      </a>
                    </label>
                    <table class="table">
                    <thead>
                      <tr>
                        <th>颜色标记</th>
                        <th>技能简介</th>
                      </tr>
                    </thead>
                    <tbody>
                    <tr v-for="item in Skill">
                      <td height=50px>
                      <div class="form-group">
                      <select class="form-control select2 valid untouched dirty modified" v-model="item.Color">
                        <option value="info">一般</option>
                        <option value="primary">初级</option>
                        <option value="warning">高级</option>
                        <option value="success">资深</option>
                      </select>
                      </div>
                      </td>
                      <td height=50px>
                        <input type="text" class="form-control" placeholder="输入技能简介" v-model="item.Description"> 
                      </td>
                    </tr>
                    </tbody>
                  </table>
                </div>
                <div class="form-group">
                    <label><i class="fa fa-file-text-o margin-r-5">(座右铭)</i></label>
                    <textarea class="form-control" rows="3" placeholder="输入座右铭" v-model="Motto" v-validate:Motto="['required']"></textarea>
                </div>
                <div class="form-group">
                    <label><i class="fa fa-institution">(个人爱好总结)</i></label>
                    <textarea class="form-control" rows="3" placeholder="输入个人喜好" v-model="Habit" v-validate:Habit="['required']"></textarea>
                </div>
                 </form>
                 </validator>
              </div>
              <div class="box-footer">
                  <button type="submit" class="btn btn-info" :disabled="!$validation1.valid" v-on:click="save" >保存</button>
              </div>
        </div>
      </div>
   </section>
</div>
<link href="/static/css/bootstrap-datepicker.min.css" rel="stylesheet">
<script src="/static/js/bootstrap-datepicker.min.js"></script>
<script>
  var vue = new Vue({
        el: '#user_detail',
        data: {
          Habit:"",
          Motto:"",
          Location:"",
          Eduction:"",
          PhoneNum:"",
          Birthday:"",
          Skill:[]
        },
        methods:{
          save:function(){
            var params = {
                  Habit: this.Habit,
                  Motto: this.Motto,
                  Location: this.Location,
                  Eduction: this.Eduction,
                  PhoneNum: this.PhoneNum,
                  Birthday: this.Birthday,
                  Skill:this.Skill
              }
              this.$http.post('/api/user/saveuserdetail', params, []).then(function(response){
                console.log(response)
                if(response.data.IsSuccess == true){
                    alert(response.data.ErrMsg)
                    window.location.href="/account/center"
                }else{
                    alert(response.data.ErrMsg);
                }
              }, function(response){
                alert('提交失败')
              });
            },
          add:function(){
            var newItem  = {}
            this.Skill.push(newItem)
          },
          remove:function(){
            var dele_length = this.Skill.length-1
            this.Skill.splice(dele_length, 1)
          }
        },
        ready:function(){
          $('#birth').datepicker({
            format: "yyyy-mm-dd",
            autoclose: true,
          });
          this.$http.get('/api/user/getuserdetail', [], []).then(function(response){
                console.log(response)
                if(response.data.IsSuccess == true){
                    this.Habit = response.data.Data.Habit
                    this.Motto = response.data.Data.Motto
                    this.Location = response.data.Data.Location
                    this.Eduction = response.data.Data.Eduction
                    this.PhoneNum = response.data.Data.PhoneNum
                    this.Birthday = response.data.Data.Birthday
                    this.Skill = response.data.Data.Skill
                }else{
                    alert("请求失败");
                }
              }, function(response){
                alert('提交失败')
            });
        }
    });
</script>
{{template "footer.tpl" .}}