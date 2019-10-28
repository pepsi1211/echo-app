<template>
  <div>
    
    <!-- 列表 -->
    <mescroll-vue ref="mescroll" :down="mescrollDown" :up="mescrollUp" @init="mescrollInit">
    <!-- 频道 -->
    <axn-text>139</axn-text>
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
          <p class="channel-title">{{item.title}}</p>
          <!-- 文字 -->
          <span class="channel-subtitle">{{item.subtitle}}</span>
        </div>
      </li>
    </ul>
    </mescroll-vue>
  </div>
</template>
<script>
// 引入 频道(统计)
import AxnText from './Axn-text'
// 引入mescroll的组件
import MescrollVue from 'mescroll.js/mescroll.vue'
export default {
  data() {
   return{
    // 保存按钮状态
    paused:{
      "channel-play": true,
    },
    // 保存当前点击按钮
    playI:-1,
    img:require('../../../../public/img/index/pull_refresh_anim.gif'),
     mescroll:null,   // mescroll实例对象
     mescrollDown:{
       htmlContent:`<img src="http://127.0.0.1:5050/img/channel/pull_refresh_anim.gif" style="width:210px;">`  // 下拉刷新的动画
     }, // 下拉刷新的配置()
     mescrollUp: {  // 上拉刷新的配置
       callback: this.upCallback,
      //  use: false,  // 不启用上拉刷新
      isLock:true,  // 锁定上拉刷新
      htmlLoading:"",
      
     },
     dataList:[]  // 列表数据
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
    },
    // mescroll组件初始化的回调，可获取到mescroll对象
    mescrollInit(page,mescroll) {
      this.mescroll = mescroll;  // 如果this.mescroll对象没有使用到，则可以不写
    },
    // 上拉回调 
    upCallback(page,mescroll) {
      setTimeout(()=>{
        mescroll.endErr();
      },800)
      
    }
  },
  watch: {
    
  },
  components: {
    "axn-text": AxnText,
    MescrollVue   // 注册mescrol组件
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
      text-align: left;
      // 设置字体
      span{
        color: #b8b8b8;
        font-size: 12px;
        transform: scale(.8);
      }
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
  // 通过fixed固定mescroll的高度
  .mescroll{
    position: fixed;
    top:4.25rem;
    bottom:0;
    height:auto;
  }
</style>