
<template>
  <div class="index">
    <!-- 轮播图 -->
    <index-carousel></index-carousel>
    <!-- 导航栏 -->
    <index-nav></index-nav>
    <!-- today -->
    <index-today></index-today>
    <!-- 为你推荐 -->
    <index-for-you></index-for-you>
    <!-- 特色频道 -->
    <index-channel></index-channel>
  </div>
</template>

<script>
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
export default {
  data() {
   return{}
  },
methods: {

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
  "index-channel":Index_channel
},
created() {
  
  },
mouted() {
  
  }
}
</script>
<style scoped>
  /* 最外层 */
  .index{
    padding: 10px 0;
  }
</style>
