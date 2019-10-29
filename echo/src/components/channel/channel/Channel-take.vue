<template>
  <div>
    <mescroll-vue ref="mescroll" :down="mescrollDown" :up="mescrollUp" @init="mescrollInit">
      <!-- 统计频道 -->
    <axn-text>
      0
    </axn-text>
    <!-- 没有更多内容了 -->
    <div class="empty">
      <p><i></i>没有更多内容了</p>
    </div>
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
  // 
  .empty{
    color: #adadad;
    i{
      display: inline-block;
      width: 21px;
      height: 21px;
      background: url(../../../../public/img/index/my_gold_no_trade_record.png) no-repeat;
      background-size: contain;
      vertical-align: middle;
    }
  }
  // 通过fixed固定mescroll的高度
  .mescroll{
    position: fixed;
    top:72px;
    bottom:0;
    height:auto;
  }
</style>