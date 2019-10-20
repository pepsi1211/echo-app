<template>
  <div id="Invitation">
    <div class="head">
            <p></p>
            <p>邀请好友</p>
            <p></p>
        </div>
    <div class="index">
        <div class="title">邀请好友，即可获得<b>该好友7天内消费的10%分成</b>邀请好友越多赚得越多哦~</div>
        <div class="pic">
          <div class="Course">
            <img src="../../public/img/task/ic_invite_friend_des_1.png" alt="">
            <div class="picZi">
              <span>1</span>
              <span>分享红包给好友让好友下载echo</span>
            </div>
          </div>
          <div class="Course">
            <img src="../../public/img/task/ic_invite_friend_des_2.png" alt="">
            <div class="picZi">
              <span>2</span>
              <span class="narrow">复制兑换码让好友兑换</span>
            </div>
          </div>
          <div class="Course">
            <img src="../../public/img/task/ic_invite_friend_des_3.png" alt="">
            <div class="picZi">
              <span>3</span>
              <span class="narrow">好友在我的页面兑换</span>
            </div>
          </div>
        </div>


        <div class="redeem">
          <div>
            <p>兑换码</p>
            <p>iNF5-XV1GH-ABKsN</p>
            <p>复制</p>
          </div>
        </div>

        <div class="share">
          <div class="shareZi">
            <p></p>
            <p>分享至</p>
            <p></p>
          </div>
          <div class="shareZi1">
            <div>
              <img src="../../public/img/task/v2_timeline.png" alt="">
              <p>朋友圈</p>
            </div>
            <div>
              <img src="../../public/img/task/v2_wechat.png" alt="">
              <p>微信</p>
            </div>
            <div>
              <img src="../../public/img/task/v2_qq.png" alt="">
              <p>qq</p>
            </div>
            <div>
              <img src="../../public/img/task/v2_douban.png" alt="">
              <p>豆瓣</p>
            </div>
            <div>
              <img src="../../public/img/task/v2_sina.png" alt="">
              <p>微博</p>
            </div>
            <div>
              <img src="../../public/img/task/v2_qzone.png" alt="">
              <p>QQ空间</p>
            </div>
          </div>
        </div>


        <div class="link">
            <img src="../../public/img/task/v2_timeline.png" alt="">
            <p>复制分享链接</p>
        </div>

        <div class="showFriend">
          <div>
            <div>
              <span>0</span>
              <span>可分红好友</span>
            </div>
          </div>
          <div class=""></div>
          <div>
            <div>
              <span>0</span>
              <span>可分红好友</span>
            </div>
          </div>
        </div>
    </div>
  </div>
</template>
<script>
export default {
  
}
</script>
<style scoped>
#Invitation>.head{display: flex;justify-content: space-between;
padding: 1.5rem 0.5rem 0.5rem ;height: 3%;border-bottom: 1px solid #ccc}
#Invitation>.head>p:first-child{width: 8px;height: 8px;margin:3px 0 0 10px;
border-bottom: 1px solid #000;transform:rotate(50deg);
border-left: 1px solid #000;}
#Invitation>.head>p:nth-child(2){color: #000;font-size: 0.8rem;padding-right:2rem;font-weight: bold}


#Invitation>.index{width: 100%;margin-top: 0.8rem}
#Invitation>.index>.title{padding: 0 3rem}
#Invitation>.index>.pic{width: 100%;display: flex;flex-wrap: wrap;justify-content: space-around}
#Invitation>.index>.pic>.Course{width: 25%;margin: 1rem 0}
#Invitation>.index>.pic>.Course>img{width: 45%}
#Invitation>.index>.pic>.Course>.picZi{width: 100%;display: flex;
justify-content: space-around;padding-top: 0.5rem}
#Invitation>.index>.pic>.Course>.picZi>span:first-child{font-size: 1.5rem}
#Invitation>.index>.pic>.Course>.picZi>.narrow{padding: 0 0.3rem;text-align: left;}
#Invitation>.index>.pic>.Course>.picZi>span{font-size:11px;color: rgba(0,0,0,0.5)}


#Invitation>.index>.redeem{width: 95%;margin: 0 auto;background: #ccc}
#Invitation>.index>.redeem>div{width: 70%;margin: 0 auto;
display: flex;justify-content: space-around;padding: 0.5rem}
#Invitation>.index>.redeem>div>p{padding: 0.2rem}
#Invitation>.index>.redeem>div>p:nth-child(2){background: #fff}
#Invitation>.index>.redeem>div>p:nth-child(3){background:#599b71;
padding: 0.2rem 0.8rem;color: #fff}


#Invitation>.index>.share>.shareZi{width: 60%;margin: 1rem auto 0}
#Invitation>.index>.share>.shareZi{display: flex;justify-content: space-between}
#Invitation>.index>.share>.shareZi>p:first-child{border-top: 1px solid #edebeb;
width: 40%;margin-top: 0.5rem}
#Invitation>.index>.share>.shareZi>p:last-child{border-top: 1px solid #edebeb;
width: 40%;margin-top: 0.5rem}
#Invitation>.index>.share>.shareZi1{display: flex;justify-content: space-between;
width: 70%;margin:0 auto 1rem;flex-wrap: wrap}
#Invitation>.index>.share>.shareZi1>div{width: 30%;padding-top: 1rem}
#Invitation>.index>.share>.shareZi1>div>img{width: 60%}

#Invitation>.index>.link{width: 95%;margin: 0 auto;display: flex;
justify-content: center;padding: 1rem 0;border-top: 1px solid #edebeb;
border-bottom: 1px solid #edebeb;align-items: center}
#Invitation>.index>.link>img{width: 6%;padding-right: 0.3rem}


#Invitation>.index>.showFriend{display: flex;justify-content: space-around;padding: 1rem 0}
#Invitation>.index>.showFriend>div:nth-child(2){border-left: 1px solid #edebeb}
#Invitation>.index>.showFriend>div>div{display: flex;flex-flow: column}
#Invitation>.index>.showFriend>div>div>span:first-child{font-size: 1.5rem}
</style>