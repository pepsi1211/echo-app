
<template>
    <transition  mode="out-in" name="fade">
        <main v-if="show">        
        <div class="login-bg">
            <!-- 页面顶部 -->
            <div class="login-top">
                <div class="logo">
                    <img src="../../public/img/login/logo_echo.png">
                </div>
                <div>
                    <span style="font-size:14px;">潮流音乐生活方式</span>
                </div>
            </div>
            <!-- 页面中部 -->
            <div class="login-mid">
                <div class="inputphone">
                    <p class="areacode">+86</p>
                    <input maxlength="11" class="phone" type="text" placeholder="请输入您的手机号" v-model="iptphone">
                </div>
                <div class="login-mid1">
                    <div class="code1">
                        <input maxlength="4" value="phone" v-model="varifycode" class="textcode" type="text" placeholder="输入验证码">
                    </div>
                    <div class="code2">
                        <button class="sendcode" @click="send" :disabled="sendAuthcode">
                            <span id="resend" v-show="!sendAuthcode">发送</span> 
                            <span v-cloak v-show="sendAuthcode">{{auth_time}}后重新发送</span> 
                        </button>
                    </div>
                </div>
            </div>
            <!-- 页面底部 -->
            <p class="pp">
                <a href="javascript:;">其他登录方式</a>
            </p>
            <div class="login-btm">
                <div class="btm-w">
                    <div class="icon">
                        <a href="javascript:;">
                            <img src="../../public/img/login/v2_sina.png">
                        </a>
                    </div>
                    <div class="icon">
                        <a href="javascript:;">
                            <img src="../../public/img/login/v2_wechat.png">
                        </a>
                    </div>
                    <div class="icon">
                        <a href="javascript:;">
                            <img src="../../public/img/login/v2_qq.png">
                        </a> 
                    </div>
                    <div class="icon">
                        <a href="javascript:;">
                            <img src="../../public/img/login/ic_email.png">
                        </a>  
                  </div>
                </div>
            </div>
            <!-- 协议 -->
            <div class="xieyi">
                <p>
                    <a href="javascript:;">注册即视为同意echo回声用户协议</a>
                </p>
            </div>
        </div>
    </main>
    </transition>
</template>

<script>
import qs from 'qs'
import axios from "axios"
export default {
    data(){
        return {
            show:false,
            //用户输入手机号
            iptphone:"",
            //按钮禁用
            sendAuthcode:false,
            //时间
            auth_time:30,
            rancode:"",
            varifycode:"",
            pnum:"",
            t:"",
            canclick:true
        }
    },
    methods:{
        loading(){
            setTimeout(() => {
            this.show=true
            }, 2150);
        },
        //判断手机号
        send(){
            if(this.canclick){
                this.canclick=false
                //在函数内声明的变量不能被外部访问，要在data中声明
                this.pnum=this.iptphone;
                var preg=/^1[3-8][0-9]{9}$/; 
                if(!this.pnum){//如果为空
<<<<<<< HEAD
                    this.$toast({message:"手机号不能为空"});
=======
                    this.$messagebox("提示","手机不能为空");
>>>>>>> lrl
                    this.canclick=true;
                    return;
                }else if(!preg.test(this.pnum)){
                    //如果手机格式不正确
<<<<<<< HEAD
                    this.$toast({message:"请输入正确的手机号"});
=======
                    this.$messagebox("提示","请输入正确的手机号");
                    this.canclick=true;
>>>>>>> lrl
                    return;
                }else{
                    // 调用定时器
                    this.varify(); 
                    setTimeout(()=>{
                        this.canclick=true;
                    },1000)
                    // 随机数
                    // this.ran()
                    // axios
                    var url="sendSms"
                    var obj={phone:this.pnum}
                    this.axios.get(url,{params:obj}).then(res=>{
                        this.rancode=res.data.data
                        console.log(this.rancode)
                        console.log(res.data)
                    })
                }
            }            
        },
        //设置周期定时器
        varify:function(){
            this.t=setInterval(()=>{
                this.auth_time--;
                this.sendAuthcode=true;
                if(this.auth_time<=0){
                    //刷新定时器
                    this.auth_time=30
                    //将按钮的disable设置为false
                    this.sendAuthcode=false;
                    //清除定时器
                    clearInterval(this.t)
                    //将页面上的发送改为重新发送
                    var resend=document.getElementById('resend')
                    resend.innerHTML="重新发送"
                }
            },1000)
        },
        //随机数
        ran:function(){
            var randoms=[0,1,2,3,4,5,6,7,8,9]
            // var rancode="";
            for(var i=0;i<4;i++){
                var index=Math.floor(Math.random()*10)
                this.rancode+=randoms[index]
                //截取前四位字符串
                this.rancode=this.rancode.substring(0,4)
            }
                console.log(this.rancode)
            // localStorage.setItem("rc",rancode)
            // var rc=localStorage.getItem("rc")
        },
    
    },
    created() {
        this.loading();
    },
    watch:{
        varifycode(){//输入框
            //收集用户输入的数字
                console.log('用户'+":"+this.varifycode,'验证码'+":"+this.rancode)
                //数字长度==4
                if(this.varifycode.length==4){
                //如果用户输入与验证码相等
                if(this.varifycode==this.rancode){
                    // 发送axios请求
                    var url="/login"
                    var obj=this.pnum;
                    // post请求要安装qs模块
                    //qs.stringify(phone:12345678910)
                    //             phone=12345678910
                    this.axios.post(url,qs.stringify({phone:obj})).then(res=>{
                        console.log(res)
                        //如果获取到uid说明登陆或注册成功
                        if(res.data.data!==undefined){
                            clearInterval(this.t)
                            this.$router.push("/index")
                        }
                        // else{
                        //     this.$messagebox("提示","登陆失败，重新登陆");
                        //     this.$router.push("/login");
                        //     return;
                        // }
                    })
                    // console.log("登录成功")
                }else{
                    this.$toast({message:"请输入正确验证码"})
                    return;    
                }
            }
        }
    }
}
</script>
<style scoped>
.fade-enter-active, .fade-leave-active {
  transition: opacity .3s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
.main{
    width:375px;
}
.login-bg{
    background: url('../../public/img/login/famous_person_income_bg_pic.png') no-repeat center center;
}
.login-top{
    margin-top:50px;
}
.logo img{
    width:150px;
    margin-bottom: 20px;
}
.login-mid{
    width: 272px;
    height: 300px;
    margin: 0 auto;
    display:flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
}
.inputphone{
    border-top-left-radius: 20px; 
    border-bottom-left-radius: 20px; 
    border-top-right-radius: 20px; 
    border-bottom-right-radius: 20px; 
    border: 1px solid #19ac73;
    width: 270px;
    height: 40px;
    display: flex;
}
.inputphone .areacode{
    width: 60px;
    height: 40px;
    margin:0;
    line-height: 40px;
    border-right: 1px solid #19ac73;
    font-size: 14px;
    color: #37be8b;
}
.inputphone .phone{
    background: transparent;
    margin-left:1px;
    padding-left:10px;
    padding-top: 4px;
    padding-bottom: 4px;
    outline: none;
    border: none;
    font-size: 16px;
    color:#37be8b;
}
.login-mid1{
    width:375px;
    display: flex;
    justify-content: space-between;
}
.login-mid1 .code1{
    width: 120px;
    height: 40px;
    border: 1px solid #19ac73;
    border-top-left-radius: 20px; 
    border-bottom-left-radius: 20px; 
    border-top-right-radius: 20px; 
    border-bottom-right-radius: 20px;
}
.code1 .textcode{
    width: 100px;
    height: 40px;
    background: transparent;
    outline: none;
    border: none;
    padding-left: 25px;
    color:#37be8b;
}
.login-mid1 .code2{
    width: 120px;
    height: 40px;
    border: 1px solid #19ac73;
    border-top-left-radius: 20px; 
    border-bottom-left-radius: 20px; 
    border-top-right-radius: 20px; 
    border-bottom-right-radius: 20px;
}
.login-mid1 .sendcode{
    width: 100px;
    height: 40px;
    background: transparent;
    outline: none;
    border: none;
}
.pp{
    font-size: 12px;
    margin-bottom: 20px;
}
.pp>a{
    text-decoration: none;
    color: #19ac73;
}
.login-btm{
    /* width:375px; */
    height: 90px;
    display: flex;
    justify-content:space-around; 
}
.login-btm .btm-w{
    width: 300px;
    display: flex;
    justify-content:space-around; 
}
.login-btm .icon>a>img{
    width:50px;
}
.xieyi{
    height:60px;
    text-align: center;
}
.xieyi a{
    text-decoration: none;
    color: #37be8b;
    font-size: 12px;
}
[v-cloak]{display:none;}
</style>
