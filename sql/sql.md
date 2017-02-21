sql备份指令：mysqldump -uroot -proot -d qa > e:\qa.sql
redis的admin用户的redis信息
db:4 key:qa:user:info field:1 value:{
  "Uid": 1,
  "Name": "admin",
  "UserName": "管理员",
  "Email": "admin@qa.cn",
  "Age": 27,
  "Sex": 1,
  "Avatar": "http://localhost:8087/static/img/user/5b8f068b4fef3673a45ff6d8cf66b34d.jpg",
  "Manager": 2,
  "Job": "运维工程师",
  "Level": 2,
  "Role": "组长"
}
HSet qa:user:info 1 {"Uid": 1,"Name": "admin","UserName": "管理员","Email": "admin@qa.cn","Age": 27,"Sex": 1,"Avatar": "http://localhost:8087/static/img/user/5b8f068b4fef3673a45ff6d8cf66b34d.jpg","Manager": 2,"Job": "运维工程师","Level": 2,"Role": "组长"}