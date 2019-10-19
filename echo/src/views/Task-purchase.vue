<template>
    <div id="purchase">
        <div class="head">
            <p></p>
            <p>我的音乐币</p>
            <p>交易记录</p>
        </div>
        
        <div class="index">
            <div class="showMoney">
                <img src="../../public/img/task/ic_home_music.png" alt="">
                <span>25.90</span>
            </div>
            <div class="musicCoin">
                <a href="javasrcipt:;">充值</a>
                <a href="javasrcipt:;">提现</a>
            </div>
            <div class="switch">
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
        </div>
        <div class="foot">充值</div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            num:""
        }
    },
    methods: {
        
    },
}
</script>
<style scoped>
a{text-decoration: none}
#purchase{background: #fff;width: 375px;height: 670px}
#purchase>.head{display: flex;justify-content: space-between;
padding: 1.5rem 0 0.5rem 0;height: 3%}
#purchase>.head>p:first-child{width: 8px;height: 8px;margin:3px 0 0 10px;
border-bottom: 1px solid #000;transform:rotate(50deg);
border-left: 1px solid #000;}
#purchase>.head>p:nth-child(2){color: #000;font-size: 0.8rem}

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


#purchase>.foot{width: 100%;height: 8%;background: #7de276;line-height:53.39px;
color: #fff;}
</style>