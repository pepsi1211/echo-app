<template>
    <div id="purchase">
        <div class="head">
            <p @click="histiry"></p>
            <p>我的音乐币</p>
            <p @click="record">交易记录</p>
        </div>
        
        <div class="index">
            <div class="showMoney">
                <img src="../../public/img/task/ic_home_music.png" alt="">
                <span>25.90</span>
            </div>
            <div class="musicCoin">
                <a href="javasrcipt:;" @click="musicmun=0">充值</a>
                <a href="javasrcipt:;" @click="musicmun=1">提现</a>
            </div>


            <!-- switch是充值   控制充值-->
            <div class="switch" v-if="musicmun==0">
                <div class="recharge">
                    <span>音乐币充值金额</span>
                    <span>开通会员打5折</span>
                </div>
                <div class="number">
                    <span>￥</span>
                    <input type="text" v-model="num">
                    <span>获得{{(num||0)>9999999999?0:num==""?0:num}}枚音乐币</span>
                </div>
                <div class="fixedMoney">
                    <span >￥30</span>
                    <span>￥50</span>
                    <span>￥100</span>
                </div>
                <div class="ChoiceMoney">
                    <img src="../../public/img/task/ic_pay_ali.png" alt="">
                    <span>支付宝支付</span>
                    <img src="../../public/img/task/ic_playlist_downloaded.png" alt="">
                </div>
            </div>

            <!-- 输入名字 -->
            <div class="drawing" v-if="musicmun==1">
                <div class="repeat" v-for="(a,i) of repeat" :key="i">
                    <div class="title">
                        <p>{{a.title}}</p>
                        <p></p>
                    </div>
                    <input type="text" :placeholder="a.inputTitle">
                </div>
    
            <!-- 输入金额 -->
                <div class="repeat1">
                    <div class="title1">
                        <p>音乐币提现金额</p>
                        <p>0元可提现</p>
                    </div>
                    <div class="input1">
                        <p>￥</p>
                        <input type="text1" value="0">
                    </div>
                </div>

                <div class="fixedMoney">
                    <span >￥1</span>
                    <span>￥2</span>
                    <span>￥5</span>
                    <span>￥10</span>
                    <span>￥20</span>
                    <span>￥50</span>
                </div>

                <div class="underZi">
                    
                    <div v-for="(b,i) of underZi" :key="i">
                        {{b.title}}
                    </div>
                </div>
            </div>
            
        </div>

        
        <div class="foot">充值</div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            num:"",
            repeat:[
                {title:"支付宝真实名字",inputTitle:"请仔细确认，若输入错误，echo对损失不负责赔偿"},
                {title:"支付宝账户",inputTitle:"请仔细确认，若输入错误，echo对损失不负责赔偿"}
            ],
            underZi:[
                {title:"通过好友分红收入的音乐币可以提现，平台赠送的音乐币不在提现范围内。"},
                {title:"提现手续费为5金币，你可以通过完成任务免费获取金币，提现申请将在1~3小时审批到账"},
                {title:"最低提现金额为1元，若遇法定节假日或夜晚时段，到账可能延误。请联系24小时客服查询"}
                
            ],
            musicmun:0
        }
    },
    methods: {
      histiry(){
        window.history.go(-1)
      },
      record(){
          this.$router.push("/TaskRecord")
      }
    },
}
</script>
<style scoped>
a{text-decoration: none}
.dnone{display: none}
#purchase{background: #fff;width: 100%;height: 670px}
#purchase>.head{display: flex;justify-content: space-between;
padding: 1.5rem 0.5rem 0.5rem ;height: 3%}
#purchase>.head>p:first-child{width: 8px;height: 8px;margin:3px 0 0 10px;
border-bottom: 1px solid #000;transform:rotate(50deg);
border-left: 1px solid #000;}
#purchase>.head>p:nth-child(2){color: #000;font-size: 0.8rem;padding-left: 2rem}


#purchase>.index{width: 100%;height: 84%}
#purchase>.index>div.showMoney{background:linear-gradient(to right,#ffa891,#ff7084);width: 100%;height: 70px;display: flex;
align-items: center;justify-content: center}
#purchase>.index>div.showMoney>img{width: 10%}
#purchase>.index>div.showMoney>span{font-size: 30px;color: #fff;margin: 0 0 0 0.4rem}


#purchase>.index>.musicCoin{width: 100%;height: 40px;display: flex;}
#purchase>.index>.musicCoin>a{width: 50%;height: 100%;border: 1px solid #eee;
box-sizing: border-box;display:block;line-height: 38px;border-left: 0px solid #eee;
color: #000;font-size: 1rem;padding: 1px;background: #fff}
#purchase>.index>.musicCoin>a+a{color: #666;background: #eee;border-right: 0px solid #eee;}


/* 充值的样式 */
#purchase>.index>.switch{width: 100%;height:452px}
#purchase>.index>.switch>.recharge{width: 100%;height: 20px;background: #fff;
padding-top: 30px;display: flex;justify-content: space-around}
#purchase>.index>.switch>.recharge>span{width: 45%;display: block;text-align: left}
#purchase>.index>.switch>.recharge>span+span{text-align: right;color: mediumseagreen}

#purchase>.index>.switch>.number{width: 96%;height: 40px;background: #fff;
display: flex;justify-content: space-around;margin:0.2rem 0.5rem;
border: 1px solid #ccc;line-height: 40px}
#purchase>.index>.switch>.number>span{width: 2%;display: block;text-align: left}
#purchase>.index>.switch>.number>input{width: 54%;display: block;text-align: left;border: 0px solid #fff;outline: none}
#purchase>.index>.switch>.number>span:last-child{width:40%;font-size: 12px;text-align: right;padding-right: 0.2rem}

#purchase>.index>.switch>.fixedMoney{width: 94%;margin: 1.5rem auto 1.5rem;
display: flex;justify-content: space-around}
#purchase>.index>.switch>.fixedMoney>span{width: 30%;height: 30px;line-height: 30px;border: 1px solid #27f17a;color: #60a45b}

#purchase>.index>.switch>.ChoiceMoney{width: 96%;height: 40px;background: #fff;
display: flex;justify-content: space-around;margin:0.2rem 0.5rem;
border-bottom: 1px solid #ccc;line-height: 40px}
#purchase>.index>.switch>.ChoiceMoney>img{width: 8%;text-align: left;height: 78%}
#purchase>.index>.switch>.ChoiceMoney>span{width: 80%;display: block;text-align: left;}
#purchase>.index>.switch>.ChoiceMoney>img:last-child{width:5%;font-size: 12px;text-align: right;height: 50%;padding: 0.5rem 0 0}



/* 提现的样式 */
#purchase>.index>.drawing{width: 95%;height: 452px;margin: 0 auto;overflow-Y: auto;}
#purchase>.index>.drawing>.repeat{width: 100%;}
#purchase>.index>.drawing>.repeat>.title{width: 100%;
    display: flex;justify-content: space-between
}
#purchase>.index>.drawing>.repeat>.title>p{width: 50%;text-align: left;margin: 1rem 0 0 0}
#purchase>.index>.drawing>.repeat>.title>p+p{width: 50%;text-align: right}
#purchase>.index>.drawing>.repeat>input{width: 95%;padding: 0.4rem;margin: 0.4rem 0 0 0}

#purchase>.index>.drawing>.repeat1{width: 100%;}
#purchase>.index>.drawing>.repeat1>.title1{width: 100%;
    display: flex;justify-content: space-between
}
#purchase>.index>.drawing>.repeat1>.title1>p{width: 50%;text-align: left;margin: 1rem 0 0 0}
#purchase>.index>.drawing>.repeat1>.title1>p+p{width: 50%;text-align: right}
#purchase>.index>.drawing>.repeat1>.input1{width: 99%;display: flex;
justify-content: space-between;align-items: center;border: 1px  solid #aaa}
#purchase>.index>.drawing>.repeat1>.input1>input{width: 95%;padding: 0.4rem
;border: 0  solid #fff;height: 20px;outline: none}
#purchase>.index>.drawing>.repeat1>.input1>p{padding: 0 0 0 0.4rem}


#purchase>.index>.drawing>.fixedMoney{width: 100%;margin: 0.3rem auto 1.5rem;
display: inline-flex;justify-content: space-between;flex-wrap: wrap}
#purchase>.index>.drawing>.fixedMoney>span{width: 30%;height: 30px;
line-height: 30px;border: 1px solid #27f17a;color: #60a45b;margin: 0.8rem 0 0 0}


#purchase>.index>.drawing>.underZi{width:100%;background: #aaa}
#purchase>.index>.drawing>.underZi>div{width:90%;border-bottom: 1px solid #222;margin: 0 auto;padding-top: 0.5rem}
#purchase>.index>.drawing>.underZi>div:first-child{padding: 0.5rem 2.8rem;box-sizing: border-box}
#purchase>.index>.drawing>.underZi>div:last-child{box-sizing: border-box;border-bottom: 0px solid #222}


#purchase>.foot{width: 100%;height: 8%;background: #7de276;line-height:53.39px;
color: #fff}
</style>