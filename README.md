# <center>echo-app</center>
Using Vue-cli framework to create echo-app;

参加全国答辩小组 **深圳民治中心**

队名:**深圳民治龙舟队**

选题:**10号命题音乐库**

> 组长:**洪智豪**(负责后台数据库,接口API)

> 组员:**梁文杰**(负责主页设计,主页功能实现,播放器功能,弹幕)

> 组员:**陆荣粼**(负责用户个人主页,登录与注册,修改资料)

> 组员:**潘金权**(负责任务系统,每日签到,账户充值)

***



**仓库目录结构说明**

1. echo-serve 服务器文件夹

   1.01. public 托管静态资源文件

   1.02. E-R模型图

   1.03. ECHO数据库设计说明书

   1.04. app.js 服务器启动文件

   1.05. SmsSender 短信验证码发送器文件

   1.06. echo-table.sql 为数据库总表(附带插入数据)

   1.07~1.10. echo单独数据

   1.11. package.json 依赖文件

2. echo 前端文件夹(vue-cli)

   2.01. public 静态文件

   2.02. src 存放组件与配置文件

   2.03. package.json 依赖文件

***



**ECHO数据库设计说明**
首次创建时间为:2019/10/08

**数据表清单**:

|  数据表名称  |                   功能备注                   |
| :----------: | :------------------------------------------: |
|  echo_user   |         用户表，记载注册后的用户信息         |
|  echo_song   |            记载歌曲信息,作者,时间            |
|  echo_love   |              记载用户的收藏列表              |
| echo_comment |       记载用户评论歌曲的用户,时间等等        |
| echo_channel |     为每首歌曲区分频道,承载每首歌曲类型      |
| echo_famous  | 名人系列,当普通用户申请认证之后,即可成为名人 |
| echo_wallet  |               用户的应用币管理               |



**数据库设计思路**:

1. 确定第一张表为用户列表,用于记载用户基本信息
2. 为了实现收藏歌曲的功能,用于记载用户分别收藏了什么歌曲,再通过所记录的用户id和歌曲id查询歌曲详情
3. 创建歌曲详情表,记录歌曲的详细信息,包括上传者,歌曲名字,歌曲作者
4. 每首歌曲会有评论内容,创建保存用户评论内容的评论表
5. 每首歌曲会分类,归类进各个频道,频道的类型体现歌曲的风格
6. 站内还会有注册认证的著名歌手·作曲家·民间高手等 名人表用于记录认证后的特殊用户
7. 钱包是用户管理音乐币的数据表

**后台API列表**

|                API接口                |                         |
| :-----------------------------------: | :---------------------: |
|            1.登录/注册接口            | 10.响应查看当天有没签到 |
| 2.点击发送验证码,接入腾讯短信服务接口 |     11.响应修改签到     |
|              3.主页接口               |   12.清空每日签到记录   |
|            4.任务模块接口             |                         |
|             5.频道页接口              |                         |
|           6."我的"页面接口            |                         |
|            7.个人主页接口             |                         |
|              8.修改资料               |                         |
|              9.注销接口               |                         |

***



**前端功能**

1. 注册与登录模块

   * 登录注册页面实现了验证码发送功能,后台接入腾讯云短信服务器,在点击发送时,将会发送验证码到手机号上

   - 设计时为了方便用户登录,我们去掉了繁琐的密码输入,以手机号作为用户唯一标识,加上验证码,登录app
   - 只需要手机号+验证码即可完成登录,如果数据库查询不到该手机号码,则视为注册操作,注册后自动视为登录

2. 主页展示模块
   * 将主页面按模块分割,分割后由一个个组件实现每个模块的功能,页面整洁干净,代码清爽易懂
   * 引用了mint-ui组件库.mescroll插件.v-touch插件.
   * 提供给用户一个音乐广场,每时每刻的音乐都是不同的,多种多样的选择

3. 任务模块
   
   * 每日签到功能
   * 任务系统包含了个人用户钱包管理
   * 充值功能