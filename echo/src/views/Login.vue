<template>
    <main>
        <div class="login-bg">
            <!-- 页面顶部 -->
            <div class="login-top">
                <div class="logo">
                    <img src="../../public/img/logo_echo.png">
                </div>
                <div>
                    <span style="font-size:14px;">潮流音乐生活方式</span>
                </div>
            </div>
            <!-- 页面中部 -->
            <div class="login-mid">
                <div class="inputphone">
                    <p class="areacode">+86</p>
                    <input class="phone" type="text" placeholder="请输入您的手机号" v-model="iptphone">
                </div>
                <div class="login-mid1">
                    <div class="code1">
                        <input v-model="varifycode" class="textcode" type="number" placeholder="输入验证码">
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
                        <img src="../../public/img/v2_sina.png">
                    </div>
                    <div class="icon">
                        <img src="../../public/img/v2_wechat.png">
                    </div>
                    <div class="icon">
                        <img src="../../public/img/v2_qq.png">
                    </div>
                    <div class="icon">
                        <img src="../../public/img/ic_email.png">
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
</template>
<script>
export default {
    data(){
        return {
            iptphone:"",
            sendAuthcode:false,
            auth_time:30,
            rancode:"",
            varifycode:"",
        }
    },
    methods:{
        send(){
            var pnum=this.iptphone;
            var preg=/^1[3-8][0-9]{9}$/; 
            if(!pnum){//如果为空
                console.log("手机不能为空");
                return;
            }else if(!preg.test(pnum)){
                //如果手机格式不正确
                console.log("请输入正确的手机号");
                return;
            }else{
                this.varify(); 
                this.ran()
                //发送axios请求
                // var url
                // var obj={}
                // this.axios.get(url,{params:obj}).then(res=>{
                //     console.log(res)
                // })
            }
        },
        varify:function(){
            var t=setInterval(()=>{
                this.auth_time--;
                this.sendAuthcode=true;
                console.log(this.auth_time)
                if(this.auth_time<=0){
                    this.auth_time=30
                    this.sendAuthcode=false;
                    clearInterval(t)
                    var resend=document.getElementById('resend')
                    resend.innerHTML="重新发送"
                }
            },100)
        },
        ran:function(){
            var randoms=[0,1,2,3,4,5,6,7,8,9,'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
        'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
        var rancode="";
        for(var i=0;i<4;i++){
            var index=Math.floor(Math.random()*36)
            rancode+=randoms[index]
        }
        console.log(rancode) 
        }
    },
    watch:{
        varifycode(){
            console.log(this.varifycode);
        }
    }

}
</script>
<style scoped>
.main{
    width:375px;
}
.login-bg{
    background: url('../../img/drawable-hdpi-v4/famous_person_income_bg_pic.png') no-repeat center center;
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
}
.inputphone .phone{
    background: transparent;
    margin-left:1px;
    padding-left:10px;
    padding-top: 4px;
    padding-bottom: 4px;
    outline: none;
    border: none;
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
.login-btm .icon>img{
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