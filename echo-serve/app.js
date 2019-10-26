const express = require("express");
// const bodyParser = require("body-parser");
const mysql = require("mysql");
const cors = require("cors");
const session = require("express-session");

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

// app.use(bodyParser.urlencoded({
//   extended:false
// }))

app.use(express.static("./public"));

// 1.登录模块功能
app.get("/login",(req,res)=>{
  // 获取前台得到的数据
  var phone = req.query.phone;
  // var upwd = req.query.upwd;
  // console.log(phone,upwd);
  console.log(phone)
  pool.query("select uid,avatar from echo_user where phone = ? ",[phone],(err,result)=>{
  // pool.query("select uid,avatar from echo_user where phone = ? and upwd = md5(?)",[phone,upwd],(err,result)=>{
    if(err) throw err;
    // 获取执行结果 判断查询是否成功result.length
    if(result.length==0){
      res.send({code:-1,msg:"用户名或密码有误"})
    }else{
      // 将用户的id保存在session对象中
      //result数据格式将会是[{id:1}]
      req.session.uid = result[0].uid;
      res.send({code:1,msg:"登录成功"});
    }
  })
});

//2.注册模块功能

//3.请求主页
app.get("/getindex",(req,res)=>{
  let sid = req.query.sid;
  // 响应主页每日推荐歌曲
  pool.query("select sname,song_pic,author from echo_song where sid in(?)",[sid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,msg:"响应每日推荐歌曲数据",data:result});
    }else{
      res.send({code:-1,msg:"失败"});
    }
  });
  // 响应主页歌曲频道
  let cid = req.query.cid;
  pool.query("select cname,pic,followed,phrase from echo_channel where cid in(?)",[cid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      console.log(result);
      res.send({code:1,msg:"响应首页频道数据",dataChannel:result});
      pool.query("select sname,author,song_pic where cid in(?)",[cid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
          console.log(result);
          res.send({code:2,msg:"响应首页频道下歌曲数据",dataSong:result});
        }else{
          res.send({code:-2,msg:"响应失败"});
        }
      });
    }else{
      res.send({code:-1,msg:"响应失败"});
    }
  });
  //响应主页的艺人栏
  let fid = req.query.fid;
  pool.query("select fname,followed,f_avatar from echo_famous where fid in(?)",[fid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,msg:"响应主页艺人成功",dataFamous:result});
    }else{
      res.send({code:-1,msg:"响应失败"})
    }
  });
});

// 4.响应任务模块
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

// 5.响应频道页
app.get("/getHotChannel",(req,res)=>{
  pool.query("select cname,pic,followed from echo_channel",[],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,msg:"响应成功",data:result})
    }else{
      res.send({code:-1,msg:"响应失败"})
    }
  });
});

// 响应签到
