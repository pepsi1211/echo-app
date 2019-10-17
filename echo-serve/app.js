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
  database:"echo",
  connectionLimit:15
})

// 配置跨域模块
// 允许哪个程序跨域访问服务器
// 脚手架:8080 允许8080访问服务器
// 服务器这边是3000

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
  var upwd = req.query.upwd;
  // console.log(phone,upwd);
  pool.query("select uid,avatar from echo_user where phone = ? and upwd = md5(?)",[phone,upwd],(err,result)=>{
    if(err) throw err;
    // 获取执行结果 判断查询是否成功result.length
    if(result.length==0){
      res.send({code:-1,msg:"用户名或密码有误"})
    }else{
      // 将用户的id保存在session对象中
      //result数据格式将会是[{id:1}]
      req.session.uid = result[0].uid;
      res.send({code:1,msg:"登录成功"})
    }
  })
});

//2.当登录成功时发生监听变化,向服务器发送请求,请求个人资料
app.get("/userData",(req,res)=>{
  var uid = req.session.uid;
  // console.log(uid);
  pool.query("select uname,avatar from echo_user where uid = ?",[uid],(err,result)=>{
    if(err) throw err;
    if(result.length==0){
      res.send({code:-1,msg:"尚未登录"})
    }else{
      res.send({code:1,data:result})
    }
  })
});

//3.注销接口 用户凭证清0 undefined
app.get("/logout",(req,res)=>{
  // var uid = req.session.uid;
  // pool.query("select uid from echo_user where uid = ?",[uid],(err,result)=>{
  //   if(err) throw err;
  //   if(result.length>0){
  //     res.send({code:1,msg:"注销成功"})
  //     req.session.uid=undefined;
  //   };
  // })
  req.session.uid=undefined;
  res.send({code:1,msg:'注册成功'})
});

//4.首页的详情接口 当加载页面的时候 请求首页歌曲详情
//查询至主页的数据库,返回数据
app.get("/index",(req,res)=>{
  pool.query("select * from echo_index",[],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result})
    }
  })
});