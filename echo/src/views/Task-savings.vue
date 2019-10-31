<template>
  <div id="savings">
    <div class="header">
<<<<<<< HEAD
      <div class="head">
        <!-- <<<<<<< HEAD -->
        <!-- <<<<<<< HEAD -->
        <p @click="histiry"></p>
        <!-- ======= -->
        <p></p>
        <!-- >>>>>>> 4ff05887966fe27e7c7576fc7b374b5133a285ca -->
        <!-- ======= -->
        <p></p>
        <!-- >>>>>>> 4ff05887966fe27e7c7576fc7b374b5133a285ca -->
        <p>音乐勋章储蓄罐</p>
        <p>兑换记录</p>
    <div class="head">

          <p></p>

          <p></p>

            <p></p>

            <p></p>

=======
    <div class="head">
            <p @click="histiry"></p>
>>>>>>> pjq
            <p>音乐勋章储蓄罐</p>
            <p>兑换记录</p>
      </div>

    <div class="showFriend">
          <div>
            <span>
              <img src="../../public/img/task/ic_medal.png" alt="">
              </span>
            <div>
              <span>0.02</span>
              <span>勋章累计总数</span>
            </div>
          </div>

          <div>
            <div>
              <span>0.00</span>
              <span>勋章可兑换数</span>
            </div>
             <span>
              <img src="../../public/img/task/ic_medal.png" alt="">
            </span>
          </div>
        </div>
    </div>

    <div class="index">
      <div class="first">勋章来源明细</div>

      <div class="charge" v-for="(a,i) of arr" :key="i">
        <span>
          <img src="../../public/img/task/ic_medal.png" alt="">
          <div>收听歌曲</div>
        </span>
        <span>消耗￥0.20获得0.02</span>
      </div>


      <div class="realName">
      <img src="../../public/img/task/ic_medal.png" alt="">
      <p>≈￥0.00 RMB</p>
      <p>充值购买的音乐币可免费兑换MITC</p>
      <a href="javasrcipt:;">实名认证并免费兑换</a>
    </div>

    </div>
<<<<<<< HEAD
=======
    <div class="foot">
      MITC为新加坡非盈利机构MusicLife Fondation发行的数字货币，由日本音乐生活株式会社进行商业运营。
      音乐勋章可免费兑换为MITC，这是echo回声与MusicLife Fondation的非赢利合作，无任何金融交易与兑换手续费。
      了解更多MITC信息请访问官网http://www.musiclife.io
    </div>
    
>>>>>>> pjq
  </div>
</template>
<script>
export default {
  data(){
    return{
        arr:[1,2,3]
    }
<<<<<<< HEAD

  },
  methods: {
    histiry() {
      window.history.go(-1);
    }
  },

  }




=======
  },
  methods: {
    histiry(){
        window.history.go(-1)
      }
  },
}
>>>>>>> pjq
</script>
<style scoped>
.header{background: royalblue;color: #fff;margin-top:1rem}
.header>.head{display: flex;justify-content: space-between;flex-wrap: wrap;
padding: 1rem 0.5rem 0.5rem ;height: 3%;}
.header>.head>p{width:30%;text-align: right;color: #fff}
.header>.head>p:first-child{width: 8px;height: 8px;margin:3px 0 0 10px;
border-bottom: 1px solid #fff;transform:rotate(50deg);
border-left: 1px solid #fff;}
.header>.head>p:nth-child(2){color: #000;font-size: 0.8rem;padding-left:4rem;font-weight: bold;color: #fff}


.header>.showFriend{display: flex;justify-content: space-around;padding: 1rem 0}
.header>.showFriend>div{width: 50%;display: flex;}
.header>.showFriend>div:first-child{border-right: 1px solid #ccc}
.header>.showFriend>div>span{width: 40%;text-align: left;padding: 0 0.3rem 0 0}
.header>.showFriend>div>span:first-child{width: 40%;text-align: right;padding: 0 0.3rem 0 0}
.header>.showFriend>div>span>img{width: 68%}
.header>.showFriend>div>div:first-child>span{padding: 0 0 0 2.3rem}

.header>.showFriend>div>div:nth-child(2)>span{text-align: left}
.header>.showFriend>div>div{display: flex;flex-flow: column;width: 60%}
.header>.showFriend>div>div>span:first-child{font-size: 1.5rem}
.header>.showFriend>div>div>span{font-size: 0.2rem}


#savings>.index>.first{padding: 1rem 0;border-bottom: 1px solid #ccc;margin: 0 auto;width: 95%}

#savings>.index>.charge{width: 95%;margin: 0 auto;display: flex;justify-content: space-between;
align-items: center;padding: 0.5rem 0;border-bottom: 1px solid #f3f1f1}
#savings>.index>.charge>span{width: 50%;text-align: right}
#savings>.index>.charge>span:first-child{display: flex;align-items: center}
#savings>.index>.charge>span>img{width: 20%}


#savings>.index>.realName{width: 95%;margin: 1rem auto 0;display: flex;flex-flow:column;
justify-content: center;align-items: center;}
#savings>.index>.realName>img{width: 13%;margin-bottom: 1rem}
#savings>.index>.realName>p:nth-child(2){font-size: 1.5rem;color: #0337d3}
#savings>.index>.realName>p:nth-child(3){color: #5f7acb;margin-bottom: 0.5rem}
#savings>.index>.realName>a{background: #3963e1;width: 100%;padding:0.5rem 0;color: #fff;border-top-left-radius: 5% 50%;
border-top-right-radius: 5% 50%;border-bottom-left-radius: 5% 50%;border-bottom-right-radius: 5% 50%;margin-bottom: 1rem}

#savings>.foot{width: 90%;margin:0 auto;}
</style>