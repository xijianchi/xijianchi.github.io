#!/bin/bash

# 根目录
echo '* **项目管理理论和实践**
  * [PMBOK](/01-PMO/PMBOK/)
  * [PRINCE2](/01-PMO/PRINCE2/)
* **工作技术**
  * [AI](/02-WorkTech/AI/)
  * [PPT](/02-WorkTech/PPT/)
  * [EXCEL](/02-WorkTech/EXCEL/)
* **个人内容**
  * [个人反思](/03-Reflection/)
  * [哲学](/04-Phil/)
  * [读书](/05-Reading/)
* [更新记录](/06-Changelog/)' > _sidebar.md

# PMO目录
echo '* [返回首页](/)
* **项目管理**
  * [PMBOK](/01-PMO/PMBOK/)
  * [PRINCE2](/01-PMO/PRINCE2/)' > 01-PMO/_sidebar.md

# PMBOK目录
echo '* [返回项目管理](/01-PMO/)
* **PMBOK指南**
  * [前言](/01-PMO/PMBOK/01-Perface.md)
  * [项目管理标准](/01-PMO/PMBOK/02-TheStandardForProjectManagement.md)
  * [PMBOK指南](/01-PMO/PMBOK/03-PMBOKGuide.md)
  * [附录](/01-PMO/PMBOK/04-Appendices.md)' > 01-PMO/PMBOK/_sidebar.md

# PRINCE2目录
echo '* [返回项目管理](/01-PMO/)
* **PRINCE2方法论**
  * [PRINCE2简介](/01-PMO/PRINCE2/README.md)' > 01-PMO/PRINCE2/_sidebar.md

# 工作技术目录
echo '* [返回首页](/)
* **工作技术**
  * [AI](/02-WorkTech/AI/)
  * [PPT](/02-WorkTech/PPT/)
  * [EXCEL](/02-WorkTech/EXCEL/)' > 02-WorkTech/_sidebar.md

# AI目录
echo '* [返回工作技术](/02-WorkTech/)
* **AI应用**
  * [AI简介](/02-WorkTech/AI/README.md)' > 02-WorkTech/AI/_sidebar.md

# PPT目录
echo '* [返回工作技术](/02-WorkTech/)
* **PPT技巧**
  * [PPT设计原则](/02-WorkTech/PPT/README.md)' > 02-WorkTech/PPT/_sidebar.md

# EXCEL目录
echo '* [返回工作技术](/02-WorkTech/)
* **Excel技巧**
  * [Excel基础](/02-WorkTech/EXCEL/README.md)' > 02-WorkTech/EXCEL/_sidebar.md

# 个人反思目录
echo '* [返回首页](/)
* **个人反思**
  * [反思总览](/03-Reflection/README.md)' > 03-Reflection/_sidebar.md

# 哲学目录
echo '* [返回首页](/)
* **哲学思考**
  * [道家思想](/04-Phil/DAO/)' > 04-Phil/_sidebar.md

# 道家思想目录
echo '* [返回哲学](/04-Phil/)
* **道家思想**
  * [经典著作](/04-Phil/DAO/Classics/)
  * [道教经典](/04-Phil/DAO/Scriptures/)
  * [渔樵问对](/04-Phil/DAO/YuQiaoWenDui.md)' > 04-Phil/DAO/_sidebar.md

# 经典著作目录
echo '* [返回道家思想](/04-Phil/DAO/)
* **经典著作**
  * [道德经](/04-Phil/DAO/Classics/DaoDeJing.md)
  * [庄子](/04-Phil/DAO/Classics/ZhuangZi.md)' > 04-Phil/DAO/Classics/_sidebar.md

# 道教经典目录 - 已更正"澄清韵"的名称
echo '* [返回道家思想](/04-Phil/DAO/)
* **道教经典**
  * [清静经](/04-Phil/DAO/Scriptures/QingJingJing.md)
  * [坐课](/04-Phil/DAO/Scriptures/ZaoKe.md)
  * [八大神咒](/04-Phil/DAO/Scriptures/BaDaShenZhou.md)
  * [澄清韵](/04-Phil/DAO/Scriptures/DengQingYun.md)' > 04-Phil/DAO/Scriptures/_sidebar.md

# 读书目录
echo '* [返回首页](/)
* **读书笔记**
  * [读书总览](/05-Reading/README.md)' > 05-Reading/_sidebar.md

# 更新记录目录
echo '* [返回首页](/)
* **更新记录**
  * [更新日志](/06-Changelog/README.md)' > 06-Changelog/_sidebar.md

echo "所有侧边栏文件已创建完成！"