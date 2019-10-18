<template>
    <div id="renWu">
        <!--这是头部勋章-->
        <div class="head">
            <div class="bg">
                <p>共有0.01个音乐勋章</p>
                <p>当前可兑换0.00个MITC<span>查看详情</span></p>
                <div class="huiZhang">
                    <div class="baiYuan">
                        <div>
                            <img src="../../public/img/task/ic_medal.png" alt=""  v-text="0">
                            <div class="zhoJiaZi">0</div>
                        </div>
                        
                    </div>
                </div>
                
            </div>
            
        </div>
         
        <div class="index">

            <!--音乐币-->
            <div class="yinYue">
                <div>
                    <p>25.9</p>
                    <p>我的音乐币</p>
                    <p>=2279金币</p>
                </div>
                <div>
                    <p>0</p>
                    <p>我可分红的好友</p>
                    <p>共邀请0位好友</p>
                </div>
            </div>


             <!--任务加排名-->
            <div class="myTask" v-for="(a,i) of myTask" :key="i">
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
        <div class="medalIntro">
            
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
            ]
        }
    }
}
</script>
<style scoped>
#renWu{background: #eee;width: 100%;height: 670px}
#renWu>.head{width: 100%;height:100px;display: flex;}
#renWu>.head>.bg{width: 100%;height:100px;background: #ccc;border-bottom-left-radius: 50% 50%;border-bottom-right-radius:50% 50%;
display: flex;flex-flow: column;text-align: center;margin: 0 auto;}
#renWu>.head>.bg>p{width: 100%;color: #fff;margin: 0.5rem 0 0 0;}
#renWu>.head>.bg>p:not(:first-child){font-size: 0.2rem}
#renWu>.head>.bg>p>span{color: aquamarine;}

.bg>.huiZhang>.baiYuan{background: #fff;border-radius: 50%;
width: 15%;height: 3.5rem;margin: 0.6rem auto 0;
display: flex;justify-content: center;align-items: center}
.huiZhang>.baiYuan>div{background: #eee;width: 90%;
height:667px;height: 90%;border-radius: 50%;display: flex;justify-content: center;align-items: center;position: relative;}
.huiZhang>.baiYuan>div>img{width: 70%;height: 70%;}
.huiZhang>.baiYuan>div>.zhoJiaZi{position: absolute;font-size: 1px;
color: #fff;margin-top: -2px}



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
#renWu>.index>.myTask>.front{width: 10%;height: 100%;
padding:0.2rem 0.8rem 0.4rem 0.3rem;margin: 0 0px 0 10px}
#renWu>.index>.myTask>.in{width: 40%;height: 100%;
line-height: 30px;font-size: 0.8rem}
#renWu>.index>.myTask>.after{width: 50%;height: 100%;
line-height: 30px;font-size: 0.8rem;color: rgba(0,0,0,0.5);
display: flex;justify-content:space-around}
#renWu>.index>.myTask>.after>.zi{width:80%}
#renWu>.index>.myTask>.after>.zi{width:80%;text-align:right}
#renWu>.index>.myTask>.after>.jiaTou{width:5%;height: 30%;
border-bottom: 1px solid #666;transform:rotate(-135deg);
border-left: 1px solid #666;margin-top: 0.6rem}


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
font-size:12px;transform: scale(0.6,0.6);bottom:-7px;left:-11px;text-align: center;color: #fff}
</style>