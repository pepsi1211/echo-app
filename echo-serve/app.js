const express = require("express");
const bodyParser = require("body-parser");
const mysql = require("mysql");
const cors = require("cors");
const session = require("express-session");
const crypto = require("crypto");
const request = require("request");
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
  console.log(uname);
  pool.query("select uid,avatar from echo_user where phone = ? ",[phone],(err,result)=>{
    if(err) throw err;
      // 获取执行结果 判断查询是否成功result.length
      console.log(result);
    if(result.length==0){
      // 此时判断为新用户,进行注册操作
      pool.query("insert into echo_user values(?,?,?,?,?,?,?,?,?,?,?,?)",[null,uname,null,phone,"http://127.0.0.1:5050/img/avatar/echo.png",null,null,null,null,0,0,0],(err,result)=>{
        if(err) throw err
        if(result.affectedRows>0){
          res.send({code:2,msg:"注册成功"});
          pool.query("select uid from echo_user where phone = ?",[phone],(err,result)=>{
            if (err) throw err;
            if(result.length>0){
              var uid = result[0].uid;
              var pay_time = Math.floor(Date.now()/1000);
              console.log(pay_time);
              pool.query("insert into echo_wallet values(?,?,?,?)",[uid,20,200,pay_time],(err,result)=>{
                if (err) throw err;
                if(result.affectedRows>0){
                  req.session.uid = uid;
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
      res.send({code:1,msg:"登录成功"});
      console.log(result)
    }
  })
});

// 点击发送验证码,后台接入腾讯短信服务接口
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
  var rand = Math.floor(Math.random()*9999);
  if(rand<1000){
    rand += ""+(Math.floor(Math.random()*10))
  }
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

//3.主页接口
// app.get("/getindex",(req,res)=>{
//   let sid = req.query.sid;
//   // 主页每日推荐歌曲接口
//   pool.query("select sname,song_pic,author from echo_song where sid in(?)",[sid],(err,result)=>{
//     if(err) throw err;
//     if(result.length>0){
//       res.send({code:1,msg:"响应每日推荐歌曲数据",data:result});
//     }else{
//       res.send({code:-1,msg:"失败"});
//     }
//   });
//   // 主页歌曲频道接口
//   let cid = req.query.cid;
//   pool.query("select cname,pic,followed,phrase from echo_channel where cid in(?)",[cid],(err,result)=>{
//     if(err) throw err;
//     if(result.length>0){
//       console.log(result);
//       res.send({code:1,msg:"响应首页频道数据",dataChannel:result});
//       pool.query("select sname,author,song_pic where cid in(?)",[cid],(err,result)=>{
//         if(err) throw err;
//         if(result.length>0){
//           console.log(result);
//           res.send({code:2,msg:"响应首页频道下歌曲数据",dataSong:result});
//         }else{
//           res.send({code:-2,msg:"响应失败"});
//         }
//       });
//     }else{
//       res.send({code:-1,msg:"响应失败"});
//     }
//   });
//   //主页的艺人栏接口
//   let fid = req.query.fid;
//   pool.query("select fname,followed,f_avatar from echo_famous where fid in(?)",[fid],(err,result)=>{
//     if(err) throw err;
//     if(result.length>0){
//       res.send({code:1,msg:"响应主页艺人成功",dataFamous:result});
//     }else{
//       res.send({code:-1,msg:"响应失败"})
//     }
//   });
// });

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

// 6.响应签到

// 7."我的"页面接口
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
        res.send({code:1,msg:"查询成功",data1:result1,data2:result2});
      })
    }else{
      res.send({code:-1,msg:"查询失败,获取不到uid"})
    }
  });
});

// 8.个人主页接口
app.get("/getPersonPage",(req,res)=>{
  var uid = req.session.uid;
  var sid = [];
  pool.query("select uname,avatar,xz,gender,city,following,followed,friend from echo_user where uid = ?",[uid],(err,result1)=>{
    if(err) throw err;
    if(result.length>0){
      console.log("这步已经查询到了用户名,头像等等...");
      pool.query("select sid from echo_love where uid = ?",[uid],(err,result2)=>{
        if(err) throw err;
        if(result2.length>0){
          for(var i=0;i<result2.length;i++){
            sid = result2[i].sid;
          };
          pool.query("select song_pic,sname,love",[],(err,result3)=>{})
        }else{
          res.send({code:-2,msg:"查询失败"})
        }
      })
    }else{
      res.send({code:-1,msg:"查询失败,获取uid失败"})
    }
  })
});

