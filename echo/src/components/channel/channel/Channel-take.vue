<template>
  <div>
    <mescroll-vue ref="mescroll" :down="mescrollDown" @init="mescrollInit">
     
    <!-- 没有更多内容了 -->
    <div class="empty" v-show="isShow">
       <!-- 统计频道 -->
    <axn-text>
      0
    </axn-text>
      <p><i></i>没有更多内容了</p>
    </div>
    </mescroll-vue>
  </div>
</template>
<script>
// 引入 频道(统计)
import AxnText from './Axn-text'
import Mescroll from 'mescroll.js/mescroll.vue'
export default {
  data() {
   return{
    
     mescroll:null,   // mescroll实例对象
     mescrollDown:{
       htmlContent:`<img src="http://127.0.0.1:5050/img/channel/pull_refresh_anim.gif" style="width:210px;">`,  // 下拉刷新的动画
        callback: this.downCallback,
        auto: true,
        autoShowLoading:false,
        // 加载中的文本
       
     }, // 下拉刷新的配置()
    
     dataList:[],  // 列表数据
     isShow:false
   }
  },
  methods: {
    // mescroll组件初始化的回调，可获取到mescroll对象
    mescrollInit(mescroll){
      console.log(1)
      this.mescroll = mescroll;
    },
    downCallback(mescroll){
      
      // 第1种: 请求具体接口
              // 成功隐藏下拉加载状态
              console.log(mescroll.triggerDownScroll);
              // mescroll.triggerDownScroll();
               setTimeout(()=>{
                  mescroll.endSuccess();
                  this.isShow = true;
               },800)
						
					// 	fail: () => {
					// 		// 失败隐藏下拉加载状态
					// 		mescroll.endErr()
					// 	}
					// })
					// 第2种: 下拉刷新和上拉加载调同样的接口, 那以上请求可删, 直接用mescroll.resetUpScroll()代替
					//mescroll.resetUpScroll(); // 重置列表为第一页 (自动执行 page.num=1, 再触发upCallback方法 )
					// 第3种: 下拉刷新什么也不处理, 可直接调用或者延时一会调用 mescroll.endSuccess() 结束即可
					//mescroll.endSuccess()
     
    }
    // 上拉回调 
    
  },
  watch: {
    
  },
  components: {
    "axn-text": AxnText,
    "mescroll-vue": Mescroll
  },
  computed: {
    
  },
  created() {
    
  },
  mounted() {
    
  },
  updated() {
    this.mescroll.triggerDownScroll()
  },
  destroyed() {
    
  }
}
</script>
<style scoped lang='scss'>
  // 
  .empty{
    color: #adadad;
  }
</style>