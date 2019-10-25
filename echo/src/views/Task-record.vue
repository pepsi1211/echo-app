<template>
    <div id="record">
        <div class="head">
            <p @click="histiry"></p>
            <p>交易记录</p>
            <p></p>
        </div>
        <div class="index">
            <div class="musicCoin">
                <a href="javasrcipt:;" :class="musicmun==0?selection.selection:''" @click="musicmun=0" >消费</a>
                <a href="javasrcipt:;" :class="musicmun==1?selection.selection:''"  @click="musicmun=1">充值</a>
                <a href="javasrcipt:;" :class="musicmun==2?selection.selection:''" @click="musicmun=2">提现</a>
            </div>
            <ul class="content">
                <li v-show="musicmun==0">
                    <ul>
                        <li>播放歌曲[[3D环绕]咬口炸裂棉花糖吧Silencedddddd</li>
                        <li>-0.1</li>
                        <li>2019-10-21  18:58:08</li>
                        <li>获得勋章0.01枚</li>
                    </ul>
                </li>
                <li v-show="musicmun==1">456</li>
                <li v-show="musicmun==2">789</li>
            </ul>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            selection:{selection:"selection"},
            musicmun:0
        }
    },
    methods: {
        histiry(){
            window.history.go(-1)
        },
    },
}
</script>
<style scoped>
#record{width: 100%;height: 669px}
#record>.head{display: flex;justify-content: space-between;
padding: 1.5rem 0.5rem 0.5rem ;height: 3%;border-bottom: 1px solid #ccc}
#record>.head>p:first-child{width: 8px;height: 8px;margin:3px 0 0 10px;
border-bottom: 1px solid #000;transform:rotate(50deg);
border-left: 1px solid #000;}
#record>.head>p:nth-child(2){color: #000;font-size: 0.8rem;padding-right:2rem;font-weight: bold;}

#record>.index>.musicCoin{width: 100%;height: 40px;display: flex;background: #fff}
#record>.index>.musicCoin>.selection{background: #fff;border: 0px;border-bottom: 1px solid #eee;}
#record>.index>.musicCoin>a{width: 50%;height: 100%;border: 1px solid #eee;
box-sizing: border-box;display:block;line-height: 38px;border-left: 0px solid #eee;
color: #000;font-size: 1rem;padding: 1px;background: #eee}
#record>.index>.musicCoin>a+a{margin:0 0 0 0.2rem}


#record>.index>.content{width: 100%}
#record>.index>.content>li>ul{display: flex;display: flex;flex-wrap: wrap;padding: 1rem 0 0.5rem;border-bottom: 1px solid #ccc;width: 90%;margin: 0 auto}
#record>.index>.content>li>ul>li:first-child{width: 90%;text-align: left;
text-overflow:ellipsis;overflow:hidden;font-weight: bold}
#record>.index>.content>li>ul>li:nth-child(2){width: 10%;text-align: right;font-weight: bold}
#record>.index>.content>li>ul>li:nth-child(3){width: 70%;text-align: left}
#record>.index>.content>li>ul>li:nth-child(4){width: 30%;text-align: right}
</style>