<template>
  <div class="index">
    <mescroll-vue @init="mescrollInit" :down="mescrollDown">
      <!-- 头部 -->
      <echo-headerv1></echo-headerv1>
      <!-- 轮播图 -->
      <index-carousel></index-carousel>
      <!-- 导航栏 -->
      <index-nav></index-nav>
      </mescroll-vue>
      <!-- today -->
      <index-today></index-today>
      <!-- 为你推荐 -->
      <index-for-you :songs="list.dataSong"></index-for-you>
      <!-- 特色频道 -->
      <index-channel :songs="list.dataChannel"></index-channel>
      <!-- 测试人格 -->
      <index-test></index-test>
      <!-- 好歌推荐1 -->
      <good-songs1 :songs="list.dataSong"></good-songs1>
      <!-- 好歌推荐2 -->
      <good-songs2 :songs="list.dataSong"></good-songs2>
      <!-- 好歌推荐3 -->
      <good-songs3 :songs="list.dataSong"></good-songs3>
      <!-- 新歌发布 -->
      <new-songs :songs="list.dataSong"></new-songs>
      <!-- 瞩目艺人 -->
      <index-head-linear :stars="list.dataFamous"></index-head-linear>
      <!-- 音乐杂志 -->
      <index-magazine></index-magazine>
  </div>
</template>
<script>
// 引入mescroll
import Mescroll from 'mescroll.js/mescroll.vue'
// 1.引入轮播图组件
import Index_carousel from '../components/index/Index_carousel'
// 2.引入导航组件
import Index_nav from '../components/index/Index_nav'
// 3.import today
import Index_today from '../components/index/Index_today'
// 4.引入为你推荐
import Index_forYou from '../components/index/Index_forYou'
// 5.引入 特色频道
import Index_channel from '../components/index/Index_channel'
// 6.引入好歌推荐1
import GoodSongs1 from '../components/index/GoodSongs1'
// 6.引入好歌推荐2
import GoodSongs2 from '../components/index/GoodSongs2'
// 6.引入好歌推荐3
import GoodSongs3 from '../components/index/GoodSongs3'
// 7.测试人格
import Index_test from '../components/index/Index_test'
// 8.新歌发布
import NewSongs from '../components/index/NewSongs'
// 9.瞩目艺人
import Index_Headlinear from '../components/index/Index_Headliner'
// 10.音乐杂志
import Index_magazine from '../components/index/Index_magazine'
export default {
  data() {
   return{
     mescroll: null,
     mescrollDown:{
      htmlContent:`<img src="http://127.0.0.1:5050/img/channel/pull_refresh_anim.gif" style="width:210px;">`, // 下拉刷新的动画
      callback: this.downCallback,
      auto: true,
      autoShowLoading:false,
     },
     dataList: [],
     list:0
   }
  },
methods: {
    // mescroll组件初始化的回调，
    mescrollInit(mescroll){
      this.mescroll = mescroll;
    },
    downCallback(mescroll){
      setTimeout(()=>{
        mescroll.endSuccess();
      },800)
    },
     getData(){
      // 发送ajax请求
      var url = 'getindex'
      this.axios.get(url,{}).then(res=>{
        // console.log(res);
        // console.log(res.data.datasong);
        // 将请求回来数据放到data中
        this.list = res.data;
        var data = res.data;
        // console.log(data.dataChannel.splice(Math.random()*8,4));
        // 如果请求成功
        if(data.code>0){

        }
      })
    }
  },
watch: {
  
  },
computed: {
  
  },
components:{
  "index-carousel":Index_carousel,
  "index-nav":Index_nav,
  "index-today":Index_today,
  "index-for-you":Index_forYou,
  "index-channel":Index_channel,
  "good-songs1": GoodSongs1,
  "good-songs2": GoodSongs2,
  "good-songs3": GoodSongs3,
  "index-test": Index_test,
  "new-songs": NewSongs,
  "index-head-linear": Index_Headlinear,
  "index-magazine": Index_magazine,
  "mescroll-vue": Mescroll
},
created() {
     
  },
mounted() {
  this.mescroll.triggerDownScroll();
  // 加载页面数据
  this.getData();
  },
updated(){
  }
}
</script>
<style scoped>
  /* 最外层 */
  .index{
    padding: 10px 0;
  }
</style>
