<template>
    <div id="renWu">
        <!--这是头部勋章-->
        <div class="head">
            <div class="bg">
                <p>共有0.01个音乐勋章</p>
                <p>当前可兑换0.00个MITC<span @click="details">查看详情</span></p>
                <div class="huiZhang">
                    <div class="baiYuan" @click="hieMeadl">
                        <div>
                            <img src="../../public/img/task/ic_medal.png" alt=""  >
                            <div class="zhoJiaZi">0</div>
                        </div>
                        
                    </div>
                </div>
                
            </div>
            
        </div>
         
        <div class="index">

            <!--音乐币-->
            <div class="yinYue">
                <div @click="music">
                    <p>25.9</p>
                    <p>我的音乐币</p>
                    <p>=2279金币</p>
                </div>
                <div @click="bonus">
                    <p>0</p>
                    <p>我可分红的好友</p>
                    <p>共邀请0位好友</p>
                </div>
            </div>


             <!--任务加排名-->
            <div class="myTask" v-for="(a,i)  of myTask" :key="i" @click="mytask(i)">
                <img :src="a.pic" alt="" class="front">
                <div class="in">{{a.in}}</div>
                <div class="after">
                    <div class="zi">{{a.after}}</div>
                    <div class="jiaTou"></div>
                </div>
            </div>
           
            <!--红包-->
            <div class="Packet">
                <div class="openPacket">
                    <img src="../../public/img/task/ic_medal_red_packet_opened.png" alt="">
                    <p>新人红色<br>26.00音乐币</p>
                    
                </div>
                <div class="shutPacket" v-for="(a,i) of packet" :key="i">
                    <img src="../../public/img/task/ic_medal_red_packet_disable.png" alt="">
                    <p class="up">{{a.title}}</p>
                    <p class="lower">{{a.lower}}</p>
                </div>
            </div>
        </div>

        <!--点击事件勋章介绍-->
        <div class="medalIntro dnone">
            <table></table>
        <div class="huiZhang1">
            <div class="baiYuan1">
               <div>
                     <img src="../../public/img/task/ic_medal.png" alt=""  >
                    <div class="zhoJiaZi1">0</div>
                 </div>
            </div>
            <div class="out" @click="endMedol">x</div>
        </div>
        <div class="voucher">
            <p>音乐勋章</p>
            <p>echo音乐币消费凭证</p>
        </div>
        <div class="voucher" v-for="(b,i) of wenzi" :key="i">{{b.son}}</div>
        <div class="myCurrency">
            <a href="javasrcipt:;" class="recharge" @click="music">充值音乐币</a>
            <a href="javasrcipt:;" class="savings" @click="details">我的储蓄罐</a>
        </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            myTask:[
                {pic:require("../../public/img/task/ic_medal_task.png"),in:"我的任务",after:"今日可免费领0/86金币"},
                {pic:require("../../public/img/task/ic_medal_rank.png"),in:"我的排名",after:"无"}
            ],
            packet:[
                {title:"首交离线歌曲红包",lower:"离线下载歌曲获得"},
                {title:"首交获得音乐勋章红包",lower:"消费音乐获得"},
                {title:"首次成功邀请好友注册红包",lower:"成功邀请好友获得"}
            ],
            wenzi:[
                {son:"在echo,所有音乐币消费,都会获得音乐勋章碎片。当集齐10个音乐勋章碎片，即可获得1个音乐勋章，音乐勋章可兑换MITC."},
                {son:"MITC为新加坡非盈得机构MusicLife Foundaion发行的数字货币,由日本音乐生活株式会社进行商业运营。音乐勋章可免费兑换为MITC，这是echo回声与MusicLife Foundation的非赢利合作，无任何金融交易与兑换手续费。"},
                {son:"你可以通过听歌、离线、给歌曲送礼等形式消费音乐币，消费音乐币可获得勋章。邀请一位付费好友也可获得1枚音乐勋章。放入储蓄罐的音乐勋章可兑换MITC，兑换价根据市场价格而定。"}
                ]
        }
    },
    methods:{
         hieMeadl(){
             var medalIntro=document.getElementsByClassName("medalIntro");
             medalIntro=medalIntro[0]
             medalIntro.className="medalIntro";
         },
         endMedol(){
             var medalIntro=document.getElementsByClassName("medalIntro");
             medalIntro=medalIntro[0]
             medalIntro.className="medalIntro dnone";
         },
         music(){
             this.$router.push("/taskpurchase")
         },
         bonus(){
             this.$router.push("/taskinvitation")
         },
         details(){
             this.$router.push("/tasksavings")
         },
         mytask(i){
             if(i==0){this.$router.push("MyTask")}
             else if(i==1){this.$router.push("Taskranking")}
         },
         task(){
             this.axios.get("/task").then(res=>{
                if(res.data.code==1){}else if(res.data.code==-1){
                    alert("请登陆");
                    this.$router.push("/login")
                }
             })
         }
    },
    created(){
        this.task()
    },
}
</script>
<style scoped>
#renWu{background: #eee;width:100%;height: 640px}
#renWu>.head{width: 100%;height:100px;display: flex;}
#renWu>.head>.bg{width: 100%;height:100px;background: #ccc;border-bottom-left-radius: 50% 50%;border-bottom-right-radius:50% 50%;
display: flex;flex-flow: column;text-align: center;margin: 0 auto;}
#renWu>.head>.bg>p{width: 100%;color: #fff;margin: 0.5rem 0 0 0;}
#renWu>.head>.bg>p:not(:first-child){font-size: 0.2rem}
#renWu>.head>.bg>p>span{color: aquamarine;}

.bg>.huiZhang>.baiYuan{background: #fff;border-radius: 50%;
width: 17%;height: 4rem;margin: 0.9rem auto 0;
display: flex;justify-content: center;align-items: center}
.huiZhang>.baiYuan>div{background: #eee;width: 90%;
height:667px;height: 90%;border-radius: 50%;display: flex;justify-content: center;align-items: center;position: relative;}
.huiZhang>.baiYuan>div>img{width: 70%;height: 70%;}
.huiZhang>.baiYuan>div>.zhoJiaZi{position: absolute;font-size: 1px;
color: #fff;margin-top: -1px}



#renWu>.index{width: 100%;height: 100px;margin: 2.4rem 0 0 0;}
#renWu>.index>.yinYue{box-sizing: border-box;display: flex;
width: 100%;height: 100px}
#renWu>.index>.yinYue>div{border-radius: 3%;border: 1px solid #ccc;
width: 50%;height: 100%;margin:0 1rem 0;text-align: center;
box-shadow: 1px 3px 5px #ccc;background: #fff;
} 
#renWu>.index>.yinYue>div>p:first-child{font-size: 1.5rem;margin:0.8rem 0 0 0}
#renWu>.index>.yinYue>div>p:nth-child(2){font-size: 0.2em;margin:0 0 0 0}
#renWu>.index>.yinYue>div>p:nth-child(3){font-size: 0.1em;margin:0 0 0 0;color: rgba(0,0,0,0.5)}


#renWu>.index>.myTask{border: 1px solid #ccc;background: #fff;
box-shadow: 1px 3px 5px #ccc;
width: 93%;height: 2rem;border-top-left-radius: 5% 50%;
border-top-right-radius: 5% 50%;border-bottom-left-radius: 5% 50%;border-bottom-right-radius: 5% 50%;margin: 1rem auto;
display: flex;justify-content: space-between}
#renWu>.index>.myTask>.front{width: 5%;height: 65%;
padding:0.2rem 0.8rem 0.4rem 0.3rem;margin: 0 0px 0 10px}
#renWu>.index>.myTask>.in{width: 40%;height: 100%;
line-height: 30px;font-size: 0.8rem;text-align: left}
#renWu>.index>.myTask>.after{width: 50%;height: 100%;
line-height: 30px;font-size: 0.8rem;color: rgba(0,0,0,0.5);
display: flex;justify-content:space-around}

#renWu>.index>.myTask>.after>.zi{width:80%;text-align:right;font-size: 12px}
#renWu>.index>.myTask>.after>.jiaTou{width:4%;height: 23%;
border-bottom: 1px solid #666;transform:rotate(-135deg);
border-left: 1px solid #666;margin: 0.7rem 0 0 -0.1rem;}


.index>.Packet{width: 93%;height: 100px;display: flex;justify-content: space-between;margin: 2rem auto 0}
.index>.Packet>.openPacket{width: 20%;position: relative;}
.index>.Packet>.openPacket>img{width: 100%;}
.index>.Packet>.openPacket>p{width: 100%;position: absolute;
bottom:0;font-size:12px;margin: 0 0 4px 0;text-align: center;color:#28a745;transform: scale(0.6,0.6)}

.index>.Packet>.shutPacket{width:22%;display: flex;
justify-content: space-between;position: relative;}
.index>.Packet>.shutPacket>img{width:100%;padding: 0.4rem 0}
.index>.Packet>.shutPacket>p.up{width: 100%;position: absolute;
font-size:12px;transform: scale(0.6,0.6);top:37px;text-align: center;
}
.index>.Packet>.shutPacket>p.lower{width: 130%;position: absolute;
font-size:12px;transform: scale(0.6,0.6);bottom:9px;left:-11px;text-align: center;color: #fff}


.dnone{display: none}
.medalIntro{background:rgba(0,0,0,0.7);width: 100%;height: 667px;position: absolute;top: 0;left:0;}
.huiZhang1>.baiYuan1{background: #fff;    /*修改这里的上外边杠是0.6rem*/
border-radius: 50%;width: 15%;height: 3.5rem;margin: 1rem auto 0;
display: flex;justify-content: center;align-items: center}
.huiZhang1>.baiYuan1>div{background: #eee;width: 90%;
height:667px;height: 90%;border-radius: 50%;display: flex;justify-content: center;align-items: center;position: relative;}
.huiZhang1>.baiYuan1>div>img{width: 70%;height: 70%;}
.huiZhang1>.baiYuan1>div>.zhoJiaZi1{position: absolute;font-size: 1px;
color: #fff}
.out{background: #aaa;width: 5%;border-radius: 50%;float:right;position: absolute;top: 0.8rem;right: 1rem;color: #fff}

.voucher{padding: 0.5rem;margin: 0.3rem auto 0;width: 90%;color:#fff;
border-bottom:1px solid #666}
.voucher>p{color: #fff}
.voucher>p:first-child{font-size: 1.3rem;}


.myCurrency{width: 90%;margin: 1.5rem auto 0;display: flex;justify-content: space-around;}
.myCurrency>a{height: 2rem;line-height:2rem;font-size: 1rem;
color: #fff;width: 35%;border-top-left-radius: 1rem 1rem;
border-top-right-radius: 1rem 1rem;border-bottom-left-radius: 1rem 1rem;border-bottom-right-radius: 1rem 1rem}
.myCurrency>.recharge{background: chartreuse;}
.myCurrency>.savings{background: cornflowerblue}
</style>