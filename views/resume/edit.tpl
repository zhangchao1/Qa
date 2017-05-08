{{template "header.tpl" .}}
<div class="content-wrapper">
	<section class="content-header">
      <h1>
        编辑简历
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a class="active">简历管理</a></li>
        <li class="active">编辑简历</li>
      </ol>
    </section>
    <section class="content" id="resume_edit">
      <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">编辑简历</h3>
                  <div class="pull-right">
                  </div>
            </div>
              <div class="box-body">
                <validator name="validation1">
                <form role="form">
                <div class="form-group">
                    <label>名称</label>
                    <input type="text" class="form-control" placeholder="输入汉字" v-model="Name" v-validate:Name="['required']">
                </div>
                  <div class="form-group">
                    <label>性别</label>
                    <div class="radio">
                      <label>
                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="1" checked="checked" v-model="Sex" v-validate:Sex="['required']">
                       男
                      </label>
                    </div>
                    <div class="radio">
                      <label>
                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="2" v-model="Sex" v-validate:Sex="['required']">
                        女
                      </label>
                    </div>
                  <div class="form-group">
                      <label>年龄</label>
                      <input type="number" class="form-control" placeholder="年龄" v-model="Age" v-validate:Age="['required']">
                  </div>
                  <div class="form-group">
                      <label>住址</label>
                      <input type="text" class="form-control" placeholder="住址" v-model="Address" v-validate:Address="['required']">
                  </div>
                  <div class="form-group">
                      <label>联系方式</label>
                      <input type="text" class="form-control" placeholder="联系方式" v-model="Tel" v-validate:Tel="['required']">
                  </div>
                  <div class="form-group">
                  <label>学历</label>
                  <select class="form-control select2" v-model="Eduction" v-validate:Eduction="['required']">
                    <option selected="selected" value="小学">小学</option>
                    <option value="初中">初中</option>
                    <option value="高中">高中</option>
                    <option value="本科">本科</option>
                    <option value="研究生">研究生</option>
                    <option value="博士">博士</option>
                    <option value="教授">教授</option>
                  </select>
                  </div>
                  <div class="form-group">
                      <label>求职意向</label>
                      <input type="text" class="form-control" placeholder="求职意向" v-model="Job" v-validate:Job="['required']">
                  </div>
                  <div class="form-group">
                      <label>工作经历</label>
                      <textarea class="form-control" rows="4" placeholder="工作经历(200个字以内)" name="content" v-model="WorkExperience" v-validate:WorkExperience="['required']" ></textarea>
                  </div>
                  <div class="form-group">
                      <label>自我评价</label>
                      <textarea class="form-control" rows="4" placeholder="自我评价(50个字以内)"  name="content" v-model="SelfQuality" v-validate:SelfQuality="['required']" ></textarea>
                  </div>
                 </form>
                 </validator>
              </div>
              <div class="box-footer">
                  <button type="submit" class="btn btn-info" v-on:click="save" :disabled="!$validation1.valid">保存</button>
              </div>
        </div>
      </div>
   </section>
</div>
<script>
  var vue = new Vue({
        el: '#resume_edit',
        data: {
          SelfQuality: "",
          WorkExperience:"",
          Job:"",
          Eduction:"",
          Tel:"",
          Address:"",
          Age:"",
          Sex:"",
          Name:"",
        },
        delimiters: ['{[', ']}'],
        methods:{
          save:function(){
            
          }
        },
        ready:function(){
          
        }
    });
</script>
{{template "footer.tpl" .}}