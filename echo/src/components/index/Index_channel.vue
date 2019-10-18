<template>
  <div class="container">
    <!-- title -->
    <replace-title>
      特色频道
    </replace-title>
    <!-- 主体 -->
    <div class="feature">
      <div class="feature-item"  v-for="(item,i) of songs" :key="i">
        <a href="javascript:void(0);">
          <!-- 播放图标 -->
          <i :class="paused"></i>
          <div class="feature-item-img">
            <img :src="item.img" alt="" >
          </div>
          <p>{{item.title}}</p>
          <p>{{item.subtitle}}</p>
        </a>
      </div>
    </div>
  </div>
</template>
<script>
// 引入title
import Replace_title from './title/Replace_title'
export default {
  data() {
   return{
     songs:[
       {img:require("../../../public/img/index/wall-big1.jpg"),title:"最美纯人声伴奏合唱",subtitle:"26.2万关注"},
       {img:require("../../../public/img/index/wall-big2.jpg"),title:"嘻哈帝国",subtitle:"6713关注"},
       {img:require("../../../public/img/index/wall-big3.jpg"),title:"做一名优秀的DJ",subtitle:"24.9万关注"},
       {img:require("../../../public/img/index/wall-big4.jpg"),title:"霹雳俱乐部",subtitle:"1.0万关注"},
     ],
     paused:{
       pause:true,
       play:false
     }
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
  components:{
    "replace-title":Replace_title
  },
mouted() {
  
  }
}
</script>
<style scoped lang='scss'>
  // 最外层div
  .container{
    padding: 0 10px;
  }
  // 弹性布局
  .feature{
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    // 设置单个项目宽高
    .feature-item{
      width: 170px;
      height:150px;
      overflow: hidden;
      border-radius: 5px;
      margin-top: 8px;
      position: relative;
      // 弹性容器
      a{
        display: block;
        width: 170px;
        height:150px;
        overflow: hidden;
        justify-content: space-between;
        text-decoration: none;
        // 设置图片宽高
        .feature-item-img{
          width: 170px;
          object-fit: contain;
          img{
            width:170px;
            height: 110px;
          }
        }
        // 文本对齐方式
        p{
          text-align: left;
        }
        p:nth-child(2){
          color: #2c3e50;;
        }
        p:nth-child(3){
          color: #b7b7b7;
        }
        // 播放/暂停按钮
        i{
          display: inline-block;
          width: 25px;
          height: 25px;
          position: absolute;
          left: 9%;
          top:48%;
        }
        // 播放状态按钮 暂停
        .pause{
          background: url(../../../public/img/index/ic_pause_black.png) no-repeat center;
          background-size: 100%;
        }
        // 播放
        .play{
          background: url(../../../public/img/index/ic_play_black.png) no-repeat center;
          background-size: 100%;
        }
      }
    }
  }
  
</style>