# 灵感分享站
## 时间安排
- [ ] 数据流图(6.4)
- [ ] 数据字典(6.4)
- [ ] 系统结构(6.4)
- [ ] 功能结构图(6.4)
- [x] E-R图绘制(6.4)
- [x] 逻辑结构设计(6.4)
- [ ] 数据库物理结构设计(6.4)
- [ ] 测试数据打造
- [ ] 页面基础功能实现(6.8)
- [ ] 页面实现与数据库的链接(6.9)
- [ ] 页面美化(6.14)
- [ ] 撰写报告书(6.18)
## 逻辑设计
### 数据库逻辑结构设计
user(**userID**,userName,contribution,password,logintime)

type(**typeID**,typeName)

inspiration(**inspirationID**,sourceID,citeTimes,content,typeID\*)

evaluation(**evaluationID**,inspirationID\*,evaluateTime,star,evaluationNote)

project(**projectID**,circleTime,projectLink)

parnership(**partnerID**,projectID\*,userID\*)

projectsource(**proSourceID**,projectID\*,inspirationID\*)

keyword(**keywordID**,inspirationID\*,keyword,typeID\*)

fruit(**fruitID**,projectID\*,fruitLink,PublishTime)
