<template>
    <div id="myTask">
        <div class="head">
            <p @click="histiry"></p>
            <p>我的任务</p>
            <p></p>
        </div>
        
        <div class="index">
            <div class="each">
                <div class="left">
                    <svg  width="40" height="40" viewBox="0 0 40 40">
                    <circle id="circle" cx="20" cy="20" r="18"  fill="none" stroke-width="3" stroke="#38b653" style="stroke-dasharray: 0,360"/>
                    </svg>
                    <div>{{sign.dayContinuity}}</div>
                </div>


                <div class="content">
                    <span >签到</span>
                    <span>连续签到七天获得10金币</span>
                </div>
                <div class="right">
                    <span class="sign" @click="Sign">签到</span>
                </div>
            </div>

            <div class="each" v-for="(a,i) of each" :key="i">
                <div class="left">
                    <svg  width="40" height="40" viewBox="0 0 40 40">
                    <circle id="circle" cx="20" cy="20" r="18"  fill="none" stroke-width="3" stroke="#38b653" style="stroke-dasharray: 360,360"/>
                    </svg>
                    <div>{{a.left}}</div>
                </div>
                <div class="content">
                    <span>{{a.title}}</span>
                    <span>{{a.content}}</span>
                </div>
                <div class="right">
                    <!-- <img src="../../public/img/task/bell_gold.png" alt=""> -->
                    <span>{{a.right}}</span>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            each:[
                {left:"邀请",title:"邀请好友任务",content:"获得好友7天内消费的10%的分成",right:"0分红"},
                {left:"0/20",title:"每日收听任务",content:"收听回声达到20分钟",right:"1金币"},
                {left:"0/3",title:"每日喜欢任务",content:"喜欢3个回声",right:"1金币"},
                {left:"0/3",title:"每日弹幕评论任务",content:"发3条弹幕评论",right:"1金币"},
                {left:"0/1",title:"每日回声分享任务",content:"任意一次回声对外分享",right:"1金币"},
                {left:"0/1",title:"每日用户关注任务",content:"关注1位用户",right:"1金币"},
                {left:"0/20",title:"离线回声任务",content:"累积离线超过20首回声",right:"10金币"},
                {left:"0/20",title:"下载铃声任务",content:"累积下载3条铃声",right:"10金币"},
                {left:"0/20",title:"应用市场评分任务",content:"应用市场5星好评",right:"15金币"},
                {left:"0/14",title:"圆满完成奖励",content:"完成所有的每日任务",right:"5金币"},
            ],
            complete:{complete:"complete",isNaN:false},
            sign:[]
        }
    },
    methods: {
        Sign(e){
            let time=new Date();
            var sameDay=time.getTime();
            time.setHours(0);   //设置指定当天小时字段
			 time.setMinutes(0);  //设置指定当天分钟字段
			 time.setSeconds(0);  //设置指定当天秒钟字段
             time.setMilliseconds(0);  //设置指定当天毫钟字段
             time=time.getTime();


            var Continuity=parseInt(this.sign.dayContinuity);
            var Coin=parseFloat(this.sign.music_coin);
          
           
           
            console.log(this.sign)
            console.log(time,this.sign.dayzerotime)
            console.log(Continuity)
            //console.log(time)
            //console.log(this.sign.sign_in)
            //console.log(this.sign.dayzerotime)
            if(this.sign.sign_in==undefined){
                this.axios.get("modifySign",{params:{
                    sign:1,
                    currenttime:sameDay,
                    dayzerotime:time,
                    dayContinuity:1,
                    coin:Coin+2,
                    uid:this.sign.uid
                    }}).then(res=>{
                    console.log(res);
                     this.cles();
                     return
                })
            };
            var topTime=parseInt(this.sign.dayzerotime+86400000);
            if(time==topTime){
                this.axios.get("modifySign",{params:{
                    sign:1,
                    currenttime:sameDay,   // currenttime  数据库签到时间
                    dayzerotime:time,     // dayzerotime  数据库签到当天零点
                    dayContinuity:Continuity+1>7?1:Continuity+1,     // dayContinuity  连续签到
                    coin:Continuity+1>7?(Coin+10):(Coin+2), 
                    uid:this.sign.uid
                    }}).then(res=>{
                    console.log(res);
                     this.cles()
                })
            }else if(time>topTime){
                this.axios.get("modifySign",{params:{
                    sign:1,
                    currenttime:sameDay,   // currenttime  数据库签到时间
                    dayzerotime:time,     // dayzerotime  数据库签到当天零点
                    dayContinuity:1,   // dayContinuity  连续签到
                    coin:Coin+2,    
                    uid:this.sign.uid
                    }}).then(res=>{
                    console.log(res);
                     this.cles()
                })
            }
        },
         histiry(){
            window.history.go(-1)
        },

        //判断进入时任务有没完成了
        cles(){
            var url="sign";
            let time=new Date();
            var sameDay=time.getTime();
            time.setHours(0);   //设置指定当天小时字段
			 time.setMinutes(0);  //设置指定当天分钟字段
			 time.setSeconds(0);  //设置指定当天秒钟字段
             time.setMilliseconds(0);  //设置指定当天毫钟字段
             time=time.getTime();
            console.log(time)
           this.axios.get(url).then(res=>{
               //符值给data的sign
               this.sign=res.data[0];
                console.log(this.sign.uid);
                 console.log(this.sign.dayzerotime)
                 console.log(this.sign)
               if(res.data[0].sign_in==0){}
               else if(res.data[0].sign_in==undefined){}
               else if(res.data[0].dayzerotime<time){
                    //这里还差个每天登陆判断数据库的零点时间要是小于现在当天的零点就变成sing_in为0
                   this.axios.get("changesign",{params:{
                    uid:this.sign.uid,
                    sign:0
                   
                    }}).then(res=>{
                    console.log(res);
                })
               }
               else{
                   var sign=document.getElementsByClassName("sign");
                    sign=sign[0];
                    
                var parent=sign.parentNode.parentNode.firstChild.firstChild.firstChild;
                    //console.log(parent)
                    parent.style.cssText="stroke-dasharray: 360,360;";
                    sign.className="complete";
                    sign.innerHTML="已签到";
               }
              
           });
        },

    },
    created(){
        this.cles()
    },
    
}
</script>
<style scoped>
#myTask{width: 100%;height: 669px}
#myTask>.head{display: flex;justify-content: space-between;
padding: 1.5rem 0.5rem 0.5rem ;height: 3%;border-bottom: 1px solid #ccc}
#myTask>.head>p:first-child{width: 8px;height: 8px;margin:3px 0 0 10px;
border-bottom: 1px solid #000;transform:rotate(50deg);
border-left: 1px solid #000;}
#myTask>.head>p:nth-child(2){color: #000;font-size: 0.8rem;padding-right:2rem;font-weight: bold;}


#myTask>.index{width:100%; height: 614px;overflow-y:scroll;}
#myTask>.index>.each{width:100%;height:40px;display: flex;justify-content: space-around;padding: 0.5rem 0;align-items: center;border-bottom: 1px solid #ccc}
#myTask>.index>.each>.left{width:40px;height: 40px;border-radius: 50%;position: relative;}

#myTask>.index>.each>.left>span{width:40px;height: 40px;background: #ccc;border-radius: 50%;display: flex;justify-content: center;align-items: center;}

#myTask>.index>.each>.left>span.complete{width:40px;height: 40px;
background: #98d84d;border-radius: 50%;display: flex;justify-content: center;align-items: center;}

#myTask>.index>.each>.left>div{width:32px;height: 32px;background: #fff;border-radius: 50%;position: absolute;top: 4px;left: 4px;line-height: 32px}

svg{background: #ccc;border-radius: 50%}
#circle{	
    
     transition: all 2s;
			}
			svg #circle{
                
    stroke-dashoffset:0;
		}


#myTask>.index>.each>.left>span>span{width:30px;height: 30px;background: #fff;border-radius: 50%;display: block;justify-content: center;align-items: center;line-height: 30px;}
#myTask>.index>.each>.content{display: flex;flex-flow: column;text-align: left;width: 62%;height:40px}
#myTask>.index>.each>.right{width: 20%;display:flex;justify-content: center;align-items: center;height:40px}
#myTask>.index>.each>.right>img{width: 30%;}
#myTask>.index>.each>.right>.sign{width: 80%;background: darkturquoise;height: 30px;line-height: 30px;color: #fff;border-radius: 5%}

#myTask>.index>.each>.right>.complete{width: 80%;background: #f9f9f9;height: 30px;line-height: 30px;color: #ccc;border-radius: 5%}


</style>