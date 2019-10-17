<template>
  <div>
    <!-- 为你推荐 -->
    <!-- 双声道联袂馆 -->
    <!-- 霓虹流行乐 -->
    <!-- 关于我爱你这件事 -->
    <!-- 标题 -->
    <div class="title">
      <h3>
        <!-- 标题 -->
        <slot name="title"></slot>
        <i class="i-right"></i>
      </h3>
      <span><i class="i-play"></i>一键播放</span>
    </div>
    <!-- 歌曲列表 -->
    <div>
      <ul>
        <mt-swipe :auto="4000" style="width:359px;height:147px;margin:0 auto;" :showIndicators="false">
          <mt-swipe-item v-for="n in 3" :key="n">
            <!-- 循环li -->
            <li>
              <ul>
                <li v-for="(item,i) of songs" :key="i">
                  <!-- 一页 -->
                  <div class="songs">
                    <!-- 左 -->
                    <div class="songs-img">
                      <img :src="item.img" style="width:50px;height:50px;" alt="">
                    </div>
                    <!-- 右 -->
                    <div class="songs-right">
                      <span>{{item.title}}</span>
                      <span>{{item.subtitle}}</span>
                    </div>
                  </div>
                </li>
              </ul>
            </li>
          </mt-swipe-item>
        </mt-swipe>
      </ul>
    </div>
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
      
     ]
   }
  },
methods: {
  
  },
watch: {
  
  },
computed: {
  
  },
created() {
  
  },
mouted() {
  
  }
}
</script>
<style scoped lang='scss'>
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
  // 歌曲
  .songs{
    display: flex;
    // img
    // 右边
    .songs-right{
      display: flex;
      flex-direction: column;
    }
  }
</style>