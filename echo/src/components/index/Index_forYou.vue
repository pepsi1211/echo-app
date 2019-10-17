<template>
  <div class="container">
    <!-- 标题 -->
    <div class="title">
      <h3>为你推荐<i class="i-right"></i></h3>
      <span><i class="i-play"></i>一键播放</span>
    </div>
    <!-- mint 轮播 -->
    <mt-swipe :auto="4000" style="width:359px;height:147px;margin:0 auto;" :showIndicators="false">
         <ul>
           <mt-swipe-item v-for="(item,i) of songs" :key="i" >
           <li style="height:200px">
             <!-- 定宽弹性 -->
             <div>
               <!-- 左边图片 -->
               <div>
                 <img :src="item.img" alt="">
               </div>
               <!-- 右边标题 -->
               <div>
                 <span>{{item.title}}</span>
                 <span>{{item.subtitle}}</span>
               </div>
             </div>
             
           </li>
           </mt-swipe-item>
         </ul>
      
    </mt-swipe>
  </div>
</template>
<script>

export default {
  data() {
   return{
     songs:[
       {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
       {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
       {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
       {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
       {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
       {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
       {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
       {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
       {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"}
     ]
   }
  },
  
methods: {
   
  },
watch: {
  
  },
computed: {
  
  },
components:{
  
  },
created() {
  
  },
mouted() {
  
  }
}
</script>
<style scoped lang="scss">
  // 最外层div
  .container{
    .title{
      display: flex;
      justify-content: space-between;
      padding: 0 10px;
      line-height: 28px;
      i{
        display: inline-block;
        width: 16px;
        height: 16px;
        vertical-align: middle;
      }
      h3{
        font-size: 15px;
      }
      span{
        font-size: 13px;
        color: #6ed56c;
      }
      // 右箭头
      .i-right{
        background: url(../../../public/img/index/right.png) no-repeat center;
        background-size:  100%;
        width: 18px;
        height: 18px;
        margin: 0 0 3px 4px;
      }
      // 播放
      .i-play{
        background: url(../../../public/img/index/play.png) no-repeat center;
        background-size:  100%;
        margin: 0 4px 3px 0;
      }
    }
  }
</style>