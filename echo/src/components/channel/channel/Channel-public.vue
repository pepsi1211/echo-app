<template>
  <div>
    <!-- 列表 -->
<<<<<<< HEAD
=======
    <mescroll-vue ref="mescroll" :down="mescrollDown">
    <!-- 频道 -->
    <axn-text>139</axn-text>
>>>>>>> lwj
    <ul class="channel-ul">
      <li class="chanel-item" v-for="(item,i) of imgs" :key="i">
        <!-- 上下弹性 -->
        <div class="channel-a">
          <!-- 背景图 -->
          <i class="channel-bg">
            <!-- 按钮 -->
          <i class="channel-pause" :class="i==playI&&(paused)" @click="toggle(i)"></i>
          </i>
          <!-- 文字 -->
          <p class="channel-title">{{imgs.title}}</p>
          <!-- 文字 -->
          <span class="channel-subtitle">{{imgs.subtitle}}</span>
        </div>
      </li>
    </ul>
  </div>
</template>
<script>
// 引入 频道(统计)
import AxnText from './Axn-text'
export default {
  data() {
   return{
    // 保存按钮状态
    paused:{
      "channel-play": true,
    },
    // 保存当前点击按钮
<<<<<<< HEAD
    playI:0
=======
    playI:-1,
    img:require('../../../../public/img/index/pull_refresh_anim.gif'),
     mescroll:null,   // mescroll实例对象
     mescrollDown:{
       htmlContent:`<img src="http://127.0.0.1:5050/img/channel/pull_refresh_anim.gif" style="width:210px;">`,  // 下拉刷新的动画
       callback: this.downCallback,
       autoShowLoading:true
       
     }, 
     dataList:[]  // 列表数据
>>>>>>> lwj
   }
  },
  methods: {
    // 1.切换播放状态
    toggle(i){
      // 如果和playI相等，改为-1，
      if(i==this.playI){
        this.playI = -1;
      }else{
        // 否则改为i
        this.playI = i;
      }
<<<<<<< HEAD
=======
    },
    // mescroll组件初始化的回调，可获取到mescroll对象
    downCallback(mescroll){
      setTimeout(()=>{
        mescroll.endSuccess();
      },800)
>>>>>>> lwj
    }
  },
  watch: {
    
  },
  components: {
    "axn-text": AxnText
  },
  props:{
    imgs:{
      type:Array,
      default: function(){
        return []
      }
    }
  },
  computed: {
    
  },
  created() {
    
  },
  mounted() {
    
  },
  updated() {
    
  },
  destroyed() {
    
  }
}
</script>
<style scoped lang='scss'>
  // 设置ul弹性
  .channel-ul{
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    padding: 0 .5rem;
    .channel-a{
      display: block;
      // 设置背景
      .channel-bg{
        position: relative;
        display: inline-block;
        width: 10.875rem;
        height: 11.25rem;
        background:url(../../../../public/img/index/channel1.jpg) no-repeat center;
        background-size: cover;
        border-radius: 5px;
        // 暂停按钮样式
        .channel-pause{
          position: absolute;
          display: inline-block;
          width:2.125rem;
          height: 2.125rem;
          background: url(../../../../public/img/index/ic_pause_black.png) no-repeat;
          background-size: 100%;
          top:8.5625rem;
          left: .6875rem;
          z-index: 2;
        }
        // 播放按钮
        .channel-play{
          position: absolute;
          display: inline-block;
          width:2.125rem;
          height: 2.125rem;
          background: url(../../../../public/img/index/ic_play_black.png) no-repeat;
          background-size: 100%;
          top:8.5625rem;
          left: .6875rem;
          z-index: 2;
        }
      }
    }
  }
</style>