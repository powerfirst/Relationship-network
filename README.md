# 灵感分享站
## 时间安排
- [ ] 数据流图(6.4)
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

evaluation(**evaluationID**,inspirationID\*,evaluateTime,star,evaluationNote)

project(**projectID**,circleTime,projectLink)

parnership(**partnerID**,projectID\*,userID\*)

projectsource(**proSourceID**,projectID\*,inspirationID\*)

keyword(**keyword**,inspirationID\*,typeID\*)

fruit(**fruitID**,projectID\*,fruitLink,PublishTime)

### 数据库物理结构设计

请在word文档中设计，命名为“物理结构.docx”上传。

### 开发文档

#### 数据库设计
|变量名|所属表名|变量类型|说明|
|---|---|---|---|

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

|容器对象名|说明|
|---|---|
