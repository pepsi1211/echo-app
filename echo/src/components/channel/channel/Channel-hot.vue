<template>
  <div>
    <axn-text>139</axn-text>
    <!-- 列表 -->
    <ul class="channel-ul">
      <li class="chanel-item">
        <!-- 上下弹性 -->
        <a href="javascript:void(0);" class="channel-a">
          <!-- 背景图 -->
          <i class="channel-bg">
            <!-- 按钮 -->
          <i class="channel-play"></i>
          </i>
          <!-- 文字 -->
          <p class="channel-title">3d音乐奇幻旋律馆</p>
          <!-- 文字 -->
          <span class="channel-subtitle">138.1万关注</span>
        </a>
      </li>
      <li class="chanel-item">
        <!-- 上下弹性 -->
        <a href="javascript:void(0);" class="channel-a">
          <!-- 背景图 -->
          <i class="channel-bg">
            <!-- 按钮 -->
          <i class="channel-play"></i>
          </i>
          <!-- 文字 -->
          <p class="channel-title"></p>
          <!-- 文字 -->
          <span class="channel-subtitle"></span>
        </a>
      </li>
    </ul>
  </div>
</template>
<script>
// 引入 频道(统计)
import AxnText from './Axn-text'
export default {
  data() {
   return{}
  },
  methods: {
    
  },
  watch: {
    
  },
  components: {
    "axn-text": AxnText
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
        .channel-play{
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
      }
    }
  }
</style>