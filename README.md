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
|inspiration_id|从inspiration向inspiration_detail传递|

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
|detailUI|inspiration_detail页主布局|

|容器对象名|说明|
|---|---|
### 你的任务：
#### inspirationDetail页面
1. `ds.Tables["my inspiration"].Rows[idtrans - 1][0].ToString()`为本页面需要展示的inspirationID.
2. 使用DataAdapter根据得到的inspirationID为关键字，从涉及的表中提取userID、灵感名、灵感内容、评价、使用该灵感进行的项目（按照stars进行排名，选择最多前3名进行显示，显示于表中hyperlink上，控件名及UI将于6.10下午之前给出）
3. 将userID、灵感名、灵感内容、来源灵感名放在gridview中显示。（请注意gridview的ID，具体见UI布局）

#### groupList页面
1. 新建Web窗体groupList.aspx
2. 在窗体上拖入一个gridview控件，设置gridview每页显示6条；不需要改变其样式
3. 编写GridRefresh函数，对Gridview进行刷新
4. 使用DataAdapter根据session中的inspiration_id获取相对应的项目名称、项目人数，显示在步骤2中新建的gridview中
5. 对选择按钮添加事件：redirect到group_manage.aspx

### 剩余任务：
1. inspirationDetail页面UI布局（6.10下午之前）
2. logup页面设计
3. inspiration_upload页面设计
4. group_manage页面设计
5. inspirationDetail用户交互
6. 将sourceID单独出来一个表
7. 在user表中新增username属性
8. 对password加密存储
9. 文档撰写

### 心得

1. C#的session是基于服务器的，js的session是浏览器上的，因此如果需要js传参给C#，应当将js存为cookie,再用`string inspiration_id = HttpContext.Current.Request.Cookies["inspiration_id"].Value;`访问
2. js返回的坐标偏移量offsetX是相对于最近的父容器的。
