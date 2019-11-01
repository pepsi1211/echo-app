const express = require("express");
const bodyParser = require("body-parser");
const mysql = require("mysql");
const cors = require("cors");
const session = require("express-session");
const sender = require('./SmsSender.js')

//创建连接池
var pool = mysql.createPool({
  host:"127.0.0.1",
  port:3306,
  user:"root",
  password:"",
  database:"echo_app",
  connectionLimit:15
})

// 配置跨域模块
// 允许哪个程序跨域访问服务器
// 脚手架:8080 允许8080访问服务器
// 服务器这边是5050

var app = express();

app.use(cors({
  origin:["http://127.0.0.1:8080","http://localhost:8080"],
  credentials:true //每次发出的请求需要验证
}))

// 配置凭证模块 session
app.use(session({
  secret:"128位字符串",//安全字符串
  resave:true, //请求时更新数据
  saveUninitialized:true
}))

app.listen(5050);

app.use(bodyParser.urlencoded({
  extended:false
}))

app.use(express.static("./public"));

// 1.登录/注册 模块功能
app.post("/login",(req,res)=>{
  // 获取前台得到的数据
  var phone = req.body.phone;
  // console.log(req.body);
  var uname = "用户"+Math.floor(Math.random()*999);
  // console.log(uname);
  pool.query("select uid,avatar from echo_user where phone = ? ",[phone],(err,result)=>{
    if(err) throw err;
      // 获取执行结果 判断查询是否成功result.length
      // console.log(result);
    if(result.length==0){
      // 此时判断为新用户,进行注册操作
      pool.query("insert into echo_user values(?,?,?,?,?,?,?,?,?,?,?,?)",[null,uname,null,phone,"http://127.0.0.1:5050/img/avatar/echo.png",null,null,null,null,0,0,0],(err,result)=>{
        if(err) throw err
        if(result.affectedRows>0){
          pool.query("select uid from echo_user where phone = ?",[phone],(err,result)=>{
            if (err) throw err;
            if(result.length>0){
              var uid = result[0].uid;
              req.session.uid = uid;
              res.send({code:2,msg:"注册成功",data:req.session.uid});
              var pay_time = Math.floor(Date.now()/1000);
              console.log(pay_time);
              pool.query("insert into echo_wallet values(?,?,?,?)",[uid,20,200,pay_time],(err,result)=>{
                if (err) throw err;
                if(result.affectedRows>0){
                  req.session.uid = uid;
                  console.log(req.session.uid)
                }else{
                  console.log("code:-3,msg:'插入数据失败,未知原因'");
                }
              })
            }else{
              console.log("查询失败")
            }
          })
        }else{
          console.log("注册失败,未知原因")
        }
      });
    }else{
      // 将用户的id保存在session对象中
      //result数据格式将会是[{id:1}]
      req.session.uid = result[0].uid;
      res.send({code:1,msg:"登录成功",data:req.session.uid});
      console.log(result,req.session)
    }
  })
});

// 2.点击发送验证码,后台接入腾讯短信服务接口
app.get("/sendSms",(req,res)=>{
  // 获取前台输入的手机号
  var phoneNumbers = [req.query.phone];
  // 这是sdkappid和appkey
  sender.config.sdkappid = 1400278193;
  sender.config.appkey = '05f8e469cb020ac14c44d85513fb9e98';

  /**
  * 带模板单发短信接口
  * @param {string} nationCode 国家码，如果中国 86
  * @param {string} phoneNumber 手机号
  * @param {number} templId 短信模板参数，如不清楚，请在 https:/console.qcloud.com/sms/smsContent 查看
  * @param {array} params 模板参数数组，元素类型为 {string}，元素个数不要超过模板参数个数
  * @param {string} sign 短信签名
  * @param {string} extend 扩展字段，如无需要请填空字符串
  * @param {string} ext 此字段腾讯云后台服务器会按原样在应答中
  * @param {function} cb 异步结果回调函数
  */
  var rand = (Math.random()*99999999999999999+"").substring(0,4);
  console.log(rand);
   // 调用发送的函数
  sender.singleSmsSendWithParam('86', phoneNumbers[0], 454808, [`${rand}`,'2'], '深圳民治龙舟队', '', '', function (data) {
    var ret = JSON.parse(data);
    if (0 != ret.result) {
        console.log(ret);
    }
  });
  // 将随机数返回前台
  res.send({code:1,data:rand});
});

// 3.主页接口
app.get("/getindex",(req,res)=>{
  // 主页每日推荐歌曲接口
  pool.query("select sname,song_pic,author from echo_song",[],(err,result1)=>{
    if(err) throw err;
    if(result1.length>0){
      console.log("code:1");
      pool.query("select cname,pic,followed,phrase from echo_channel",[],(err,result2)=>{
        if(err) throw err;
        if(result2.length>0){
          console.log("code:2");
          pool.query("select fname,followed,f_avatar from echo_famous",[],(err,result3)=>{
            if(err) throw err;
            if(result4.length>0){
              res.send({code:3,msg:"响应每日推荐歌曲,频道,",dataSong:result1,dataChannel:result2,dataFamous:result3});
            }else{
              res.send({code:-3,msg:"响应失败"})
            }
          });
        }else{
          res.send({code:-2,msg:"响应失败"})
        }
      });
    }else{
      res.send({code:-1,msg:"失败"});
    }
  });
});


// 4.任务模块接口
app.get("/task",(req,res)=>{
  var uid = req.session.uid;
  pool.query("select music_coin,gold_coin from echo_wallet where uid = ?",[uid],(err,result)=>{
    if (err) throw err;
    if(result.length>0){
      res.send({code:1,msg:"响应成功",data:result})
    }else{
      res.send({code:-1,msg:"响应失败,没有得到uid"})
    }
  });
});

// 5.频道页接口
app.get("/getChannel",(req,res)=>{
  pool.query("select cname,pic,followed from echo_channel",[],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,msg:"响应成功",data:result})
    }else{
      res.send({code:-1,msg:"响应失败"})
    }
  });
});


// 6."我的"页面接口
/*  分别查询两张表格
    第一张表格返回的数据形式为data1:result1
    **第一张表格为用户名,头像,关注个数,被关注个数
    第二张表格返回的数据形式为data2:result2
    **第二章表格为喜欢歌曲的总数
*/
app.get("/getMe",(req,res)=>{
  var uid = req.session.uid;
  var loveSongTotal = 0;
  pool.query("select uname,avatar,following,followed from echo_user where uid = ?",[uid],(err,result1)=>{
    if(err) throw err;
    console.log(result1)
    if(result1.length>0){
      console.log("查询成功")
      pool.query("select sid from echo_love where uid = ?",[uid],(err,result2)=>{
        if (err) throw err;
        loveSongTotal = result2.length;
        res.send({code:1,msg:"查询成功",data1:result1,data2:loveSongTotal,data3:uid});
      })
    }else{
      res.send({code:-1,msg:"查询失败,获取不到uid"})
    }
  });
});

// 7.个人主页接口
app.get("/getPersonPage",(req,res)=>{
  var uid = req.session.uid;
  var selectSongSql = "select song_pic,sname,love from echo_song where sid in("
  pool.query("select uname,avatar,xz,gender,city,following,followed,friend,introduction from echo_user where uid = ?",[uid],(err,result1)=>{
    if(err) throw err;
    if(result1.length>0){
      console.log("这步已经查询到了用户名,头像等等...");
      pool.query("select sid from echo_love where uid = ?",[uid],(err,result2)=>{
        if(err) throw err;
        if(result2.length>0){
          for(var i=0;i<result2.length;i++){
            selectSongSql += result2[i].sid;
            console.log(selectSongSql);
          };
          selectSongSql += ")";
          pool.query(selectSongSql,[],(err,result3)=>{
            if(err) throw err;
            if(result.length>0){
              res.send({code:3,msg:"查询歌曲详情成功",dataUser:result1,dataSong:result3});
            }
          })
        }else{
          var love = 0;
          res.send({code:-2,msg:"查询失败",dataUser:result1,dataLove:love})
        }
      })
    }else{
      res.send({code:-1,msg:"查询失败,获取uid失败"})
    }
  })
});

// 8.修改资料
app.post("/update",(req,res)=>{
  var uid = req.session.uid;
  var obj = req.body;
  console.log(obj)
  pool.query("update echo_user set uname = ?,gender = ?,city = ?,xz = ?,introduction = ? where uid = ?",[obj.uname,obj.gender,obj.city,obj.xz,obj.introduction,uid],(err,result)=>{
    if (err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"修改成功"})
    }else{
      res.send({code:-1,msg:"修改失败"})
    }
  });
});

// 9.注销接口
app.get("/logout",(req,res)=>{
  req.session.uid=undefined;
  res.send({code:1,msg:'注销成功'})
});


// 10.响应查看当天有没签到
app.get("/sign",(req,res)=>{
  pool.query("select sign_in,currenttime,dayzerotime,dayContinuity,music_coin,uid from echo_sign where uid=1",[],
  (err,result)=>{
    if(err) throw err;
    if(result.length>0){res.send(result)}
    else{
      res.send({code:-1,msg:"响应失败"})
    }
  })
})

// 11.响应修改签到
app.get("/modifySign",(req,res)=>{
  var sign=req.query.sign;   //是否签到
  var currenttime=req.query.currenttime;  //现在时间
  var dayzerotime=req.query.dayzerotime;  //当天零点
  var dayContinuity=req.query.dayContinuity;  //连续签到
  var coin=req.query.coin;
  var uid=req.query.uid;
  console.log(sign,currenttime,dayzerotime,dayContinuity,coin,uid)
  pool.query("update echo_sign set sign_in=?,currenttime=?,dayzerotime=?,dayContinuity=?,music_coin=? where uid=?",[sign,currenttime,dayzerotime,dayContinuity,coin,uid],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){res.send(result)}
    else{res.send({code:-1,msg:"修改失败"})}
  })
})

// 12.清空每日签到记录
app.get("/changesign",(req,res)=>{
  var sign=req.query.sign;   //修改每天零点登陆后把签到变回未登陆
  var uid=req.query.uid;
  console.log(uid,sign)
  pool.query("update echo_sign set sign_in=? where uid=?",[sign,uid],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){res.send(result)}
    else{res.send({code:-1,msg:"修改失败"})}
  })
});

