#db设计

##考勤表设计
###考勤表 attendance

###上班时间和下班时间有一个浮动的范围，两者之差要大于9个小时

| 字段 | 说明|类型|
| --- | --- | --- | 
| id | 自增id | int |
| uid | 用户uid | int|
| types | 考勤类型| int |
| ip | 打卡ip | vachar|
| updated | 更新时间 | datetime |
| created | 创建时间 | datetime |

##审核相关表设计

###请假表 leave

| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| id | 自增id | int |
| uid | 用户uid | int |
| types | 类型| int|
| startTime | 请假开始时间| datetime |
| endTime | 请假结束时间| datetime |
| longTime | 请假时长| int |
| status | 审核状态 | int |
| reason | 请假原因 | varchar |
| targetUid | 目标审核人 | varchar |
| image | 请假相关证明 | varchar |
| result | 审核结果 | vachar |
| updated | 更新时间 | datetime |
| created | 创建时间 | datetime |
| longTime | 加班时长| int |

##知识分享 

###文章表 article

| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| aid | 自增id | int |
| uid | 用户uid | int |
| title | 标题 | varchar |
| content | 内容 | varchar |
| tag | 内容标签 | varchar |
| types | 内容类型 | varchar |
| status | 软删除 | int |
| admireNum | 点赞数 | int |
| commentNum | 评论数 | int |
| viewNum | 浏览数 | int |
| updated | 更新时间 | datetime |
| created | 创建时间 | datetime |

##点赞模块

###点赞表 admire 
| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| id | 自增id | int |
| guid | 被点赞模型的id | int |
| types | 点赞类型 | int |
| count | 点赞总数 | int |
| updated | 评论更新时间 | datetime |
| created | 评论时间 | datetime |

###用户点赞统计表 userAdmire 
| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| id | 自增id | int |
| uid | 点赞uid | int |
| name | 点赞用户 | int |
| status | 点赞状态 | int |
| guid | 被点赞模型的id | int |
| created | 点赞时间 | datetime |

##评论模块

###知识评论 comment
| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| id | 自增id | int |
| uid | 用户uid | int |
| aid | 文章id | int |
| types | 评论的类型 | int |
| content| 评论内容 | int |
| status | 删除评论 | int |
| updated | 评论更新时间 | datetime |
| created | 评论时间 | datetime |

##浏览模块

###浏览 ViewContent
| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| id | 自增id | int |
| guid | 用户uid | int |
| types | 文章id | int |
| count | 浏览总数 | int |
| updated | 浏览更新时间 | datetime |
| created | 评论时间 | datetime |

###用户浏览 userViewLog
| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| id | 自增id | int |
| uid | 用户uid | int |
| aid | 文章id | int |
| count | 该用户浏览该文章总数 | int |
| updated | 评论更新时间 | datetime |
| created | 评论时间 | datetime |


##简历管理模块

###简历表 resumes
| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| id | 自增id | int |
| uid | 简历创建者uid | int |
| name | 姓名 | varchar |
| sex | 性别 | varchar |
| address | 居住地址 | varchar |
| phone | 联系方式 | varchar |
| descrpition | 简历详细描述| varchar |
| attachment | 简历附件| varchar |
| status | 简历状态| int |
| updated | 简历更新时间 | datetime |
| created | 简历创建时间 | datetime |

##相册模块

###相册 photoAlbum

| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| id | 自增id | int |
| uid | uid | int |
| image | 相册 | varchar |
| title | 标题 | varchar |
| tag | 标签相册 | varchar |
| descrpition | 相册描述| varchar |
| admireNum | 点赞数 | int |
| commentNum | 评论数 | int |
| viewNum | 浏览数 | int |
| status | 软删除| int |
| updated | 简历更新时间 | datetime |
| created | 简历创建时间 | datetime |

##审核模块

###流程审核表 processReview
| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| id | 自增id | int |
| uid | 审核人 | int |
| revieUid | 审核申请的id | int |
| note | 审核备注 | varchar |
| types | 审核类型 | int |
| targetUid | 被审核人 | int |
| status | 审核状态 | int |
| updated | 审核更新时间 | datetime |
| created | 审核创建时间 | datetime |


##加班模块

###加班表 overtime
| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| id | 自增id | int |
| uid | 用户uid | int |
| types | 类型| int|
| startTime | 加班开始时间| datetime |
| endTime | 加班结束时间| datetime |
| longTime | 加班时长| int |
| status | 审核状态 | int |
| reason | 加班原因 | varchar |
| targetUid | 目标审核人 | varchar |
| result | 审核结果 | vachar |
| updated | 更新时间 | datetime |
| created | 创建时间 | datetime |


##报销模块

###报销表 expense
| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| id | 自增id | int |
| uid | 用户uid | int |
| targetUid | 目标审核人 | varchar |
| totalAmounts | 审核金额总数量 | int |
| status | 审核状态 | int |
| content | 报销内容 | text |
| image | 报销附件图 | varchar |
| result | 审核结果 | vachar |
| updated | 更新时间 | datetime |
| created | 创建时间 | datetime |



##出差模块

###出差表 travel
| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| id | 自增id | int |
| uid | 用户uid | int |
| targetUid | 目标审核人 | varchar |
| types | 类型| int|
| startTime | 出差开始时间| datetime |
| endTime | 出差结束时间| datetime |
| longTime | 出差时长| int |
| reason | 出差原因 | varchar |
| status | 审核状态 | int |
| image | 出差附件图 | varchar |
| result | 审核结果 | vachar |
| updated | 更新时间 | datetime |
| created | 创建时间 | datetime |


##物品模块

###物品表 goods
| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| id | 自增id | int |
| uid | 用户uid | int |
| targetUid | 目标审核人 | varchar |
| types | 类型| int|
| totalCount | 申请总量 | int|
| content | 申请内容 | text |
| detail | 申请详情 | varchar |
| updated | 更新时间 | datetime |
| created | 创建时间 | datetime |


##项目模块

###项目表 project
| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| id | 自增id | int |
| types | 类型| int|
| name | 项目名称| varchar|
| content | 项目详情| varchar|
| startTime | 项目开始时间| datetime |
| endTime | 项目结束时间| datetime |
| creatUid | 创建人 | int |
| headUid | 负责人 | int |
| cycle | 项目周期| varchar |
| schedule | 项目进度| varchar |
| status | 项目状态 | int |
| updated | 更新时间 | datetime |
| created | 创建时间 | datetime |


###产品表 projectOfProduct
| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| id | 自增id | int |
| projectId | 项目id | int |
| projecHeadUid | 产品负责人 | int |
| productUid | 产品uid | varchar |
| schedule | 产品进度 | varchar |
| status | 项目状态 | int |
| remark  | 备注 |  | varchar |
| updated | 更新时间 | datetime |
| created | 创建时间 | datetime |


###测试表 projectOfTest
| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| id | 自增id | int |
| projectId | 项目id | int |
| testHeadUid | 测试负责人 | int |
| testUid | 测试uid | varchar |
| schedule | 测试进度 | varchar |
| remark  | 备注 |  | varchar |
| status | 项目状态 | int |
| updated | 更新时间 | datetime |
| created | 创建时间 | datetime |


###前端开发表 projectOfFrontDevelop
| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| id | 自增id | int |
| projectId | 项目id | int |
| frontDeHeadUid | 前端负责人 | int |
| frontDeUid | 前端开发uid | varchar |
| schedule | 前端进度 | varchar |
| remark  | 备注 |  | varchar |
| status | 项目状态 | int |
| updated | 更新时间 | datetime |
| created | 创建时间 | datetime |


###后端开发表 projectOfBackDevelop
| 字段 | 说明 | 类型 |
| --- | --- | --- | 
| id | 自增id | int |
| projectId | 项目id | int |
| backDeHeadUid | 后端负责人 | int |
| backDeUid | 后端开发uid | varchar |
| schedule | 后端进度 | varchar |
| remark  | 备注 |  | varchar |
| status | 项目状态 | int |
| updated | 更新时间 | datetime |
| created | 创建时间 | datetime |


































































































































