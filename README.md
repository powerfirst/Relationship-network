# 灵感分享站
## 时间安排
- [x] 数据流图(6.4)
- [ ] 数据字典(6.4)
- [ ] 系统结构(6.4)
- [ ] 功能结构图(6.4)
- [x] E-R图绘制(6.4)
- [x] 逻辑结构设计(6.4)
- [x] 数据库物理结构设计(6.4)
- [x] 测试数据打造
- [ ] 页面基础功能实现(6.8)
- [ ] 页面实现与数据库的链接(6.9)
- [ ] 页面美化(6.14)
- [ ] 撰写报告书(6.18)
## 设计过程
### 数据库逻辑结构设计
user(**userID**,userName,contribution,password,logintime)

type(**typeID**,typeName)

inspiration(**inspirationID**,sourceID,citeTimes,content,typeID\*)

evaluation(**evaluationID**,inspirationID\*,evaluateTime,star,evaluationNote,userID*)

project(**projectID**,circleTime,projectLink)

partnership(**partnerID**,projectID\*,userID\*)

projectsource(**proSourceID**,projectID\*,inspirationID\*)

keyword(**keyword**,inspirationID\*,typeID\*)

fruit(**fruitID**,projectID\*,fruitLink,PublishTime)

### 数据库物理结构设计

请在word文档中设计，命名为“物理结构.docx”上传。

### 开发文档

#### 数据库设计
|变量名|所属表名|变量类型|说明|
|---|---|---|---|
|userID|user,evaluation,partnership|varchar(15)|用户名|

#### 页面后端设计
|变量名|作用域|变量类型|说明|
|---|---|---|---|

|函数名|作用域|返回值|说明|
|---|---|---|---|

|session对象|说明|
|---|---|

#### 页面前端设计
|css对象|说明|
|---|---|
|backgroundImg|index页面“为灵感赋能”|
|indexBackground|index页面背景|
|loginBox|登录框盒子|
|eachRow|登录框每一行的布局|
|inputBox|输入框textbox|
|hint|输入框左侧提示label|
|loginButton|登录&注册按钮|
|headStyle|各网页的顶部|
|headFont|各网页顶部的文字|
|profilePlace1|profile页主布局|
|profilePlace2|profile页左侧（个人资料）布局|
|profilePlace3|profile页个人资料行布局|
|profileIcon|profile页头像布局|
|inspirationUI|inspiration页主布局|
|inspirationContent|inspiration页gridview(用于展示inspiration)|
|buttonStyle|inspiration页自动生成的按钮|

|容器对象名|说明|
|---|---|
