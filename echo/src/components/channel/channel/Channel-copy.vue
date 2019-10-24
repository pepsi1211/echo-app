<template>
  <div>
    <!-- 列表 -->
    <ul class="channel-ul">
      <li class="chanel-item" v-for="i in imgs" :key="i">
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
    playI:0
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