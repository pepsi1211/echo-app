<template>
    <div id="ranking">
        <div class="head">
            <div class="bg">
                <div class="title">
                    <p @click="histiry"></p>
                    <p>音乐勋章百强榜</p>
                </div>
                <div class="huiZhang">
                    <div class="baiYuan">
                        <img src="../../public/img/task/ic_ranking_red_packet.png" alt="">
                    </div>
                </div>
                
            </div>
        </div>
        <div class="index">
            <div class="showFriend">
            <div>
                <div>
                <span>我的音乐币排名</span>
                <span>无</span>
                </div>
            </div>
           
            <div>
                <div>
                <span>我的勋章排名</span>
                <span>0</span>
                </div>
            </div>
            </div>

            <div class="proportion">
                <span class="first">音乐勋章可免费兑换为MITC</span>
                <span style="color:#69d49e">1 MITC=￥0.01</span>
                <span class="first">MITC未来可购入部分歌曲的分红权</span>
                <span class="">MITC当前价格</span>
            </div>

            <div class="Worldname">
                <span class="first">排名</span>
                <span >本周勋章</span>
            </div>

            <div class="Slide">
                <div class="WorldRanked" v-for="(c,i) of arr" :key="i">
                    <div class="first">
                        <span 
                        :class="i==0?color.gold:(i==1?color.darkgray:(i==2?color.cbbebe:''))">1</span>
                        <div>
                            <img src="../../public/img/task/bg_medal_ranking_top.png" alt="">
                        </div>
                        <span>欧克少云</span>
                    </div>
                
                    <span >20</span>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            arr:[1,2,3,4,5,6,7,8,9],
            color:{gold:"gold",darkgray:"darkgray",cbbebe:"cbbebe"}
        }
    },
    methods: {
        histiry(){
      window.history.go(-1)
    }
    },
}
</script>
<style scoped>
#ranking{background: #eee;width: 375px;height: 670px}
#ranking>.head{width: 100%;height:100px;display: flex;}
#ranking>.head>.bg{width: 100%;height:100%;background-image:url("../../public/img/task/bg_medal_ranking_top.png");background-size: 100% 100%;display: flex;flex-flow: column;text-align: center;margin: 0 auto;}
#ranking>.head>.bg>div{width: 100%;color: #fff;margin: 0.8rem 0 0 0;font-size: 0.8rem}
.head>.bg>.title>p:first-child{width: 8px;height: 8px;margin:3px 0 0 10px;
border-bottom: 1px solid #fff;transform:rotate(50deg);
border-left: 1px solid #fff;}
.head>.bg>.title>p{margin: -0.8rem 0 0 0}
.bg>.huiZhang>.baiYuan{width: 15%;height: 3.5rem;margin: 1.2rem auto 0;}
.bg>.huiZhang>.baiYuan>img{width: 100%;height: 100%;}


#ranking>.index>.showFriend{display: flex;justify-content: space-around;padding: 1rem 0;margin: 1rem 0}
#ranking>.index>.showFriend>div{width: 50%;}
#ranking>.index>.showFriend>div:first-child{border-right: 1px solid #ccc}
#ranking>.index>.showFriend>div>div{display: flex;flex-flow: column}
#ranking>.index>.showFriend>div>div>span:nth-child(2){font-size: 1.5rem}


#ranking>.index>.proportion{width: 90%;margin: 0 auto;background: #efeaea;
display: flex;justify-content: space-between;flex-wrap: wrap;padding: 0.5rem 0.5rem}
#ranking>.index>.proportion>.first{width: 60%;text-align: left}
#ranking>.index>.proportion>span{width: 40%;padding: 0 0.1rem;box-sizing: border-box;text-align: right}


#ranking>.index>.Worldname{width: 95%;margin: 0 auto;padding: 0.8rem 0;
display: flex;justify-content: space-between;flex-wrap: wrap;border-bottom:1px solid #ccc}
#ranking>.index>.Worldname>.first{width: 60%;text-align: left}
#ranking>.index>.Worldname>span{width: 40%;padding: 0 0.1rem;box-sizing: border-box;text-align: right}



#ranking>.index>.Slide{width: 100%;height: 352px;overflow-y: scroll}
#ranking>.index>.Slide>.WorldRanked{width: 95%;margin: 0 auto;padding: 0.8rem 0;
display: flex;justify-content: space-between;flex-wrap: wrap;}
#ranking>.index>.Slide>.WorldRanked>.first{width: 90%;text-align: left;display: flex;align-items: center}

/*其他名*/
#ranking>.index>.Slide>.WorldRanked>.first>span:first-child{width: 5%;height: 23px;line-height: 23px;margin-right: 6%;padding: 0 0.2  rem;text-align: center}

/*第二名*/
#ranking>.index>.Slide>.WorldRanked>.first>span.cbbebe{width: 5%;height: 23px;line-height: 23px;margin-right: 6%;background:#cbbebe;padding: 0 0.2  rem;text-align: center}

/*第三名*/
#ranking>.index>.Slide>.WorldRanked>.first>span.darkgray{width: 5%;height: 23px;line-height: 23px;margin-right: 6%;background: darkgray;padding: 0 0.2  rem;text-align: center}

/*第一名*/
#ranking>.index>.Slide>.WorldRanked>.first>span.gold{width: 5%;height: 23px;line-height: 23px;margin-right: 6%;background: gold;padding: 0 0.2  rem;
text-align: center}


#ranking>.index>.Slide>.WorldRanked>.first>div{width: 13%;height: 30px;line-height: 30px}
#ranking>.index>.Slide>.WorldRanked>.first>div>img{width: 30px;height: 30px;line-height: 30px;border-radius: 50%}
#ranking>.index>.Slide>.WorldRanked>.first>span:last-child{width: 60%;height: 30px;line-height: 30px}
#ranking>.index>.Slide>.WorldRanked>span{width: 10%;padding: 0 0.1rem;box-sizing: border-box;text-align: right;line-height: 30px;color:#68d3a0 }
</style>