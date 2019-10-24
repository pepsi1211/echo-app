<template>
  <div>
    <!-- 频道 -->
    <axn-text>176</axn-text>
    <!--  -->
    <channel-copy :imgs="imgs"></channel-copy>
  </div>
</template>
<script>
// 引入频道
import AxnText from './Axn-text'
// 引入
import ChannelCopy from './Channel-copy'
export default {
  
  data() {
   return{
     imgs:[
       {img:require('../../../../public/img/index/channel1.jpg'),title:"3D音乐奇幻旋律馆",subtitle:"138.1万关注"},
       {img:require('../../../../public/img/index/channel1.jpg'),title:"3D音乐奇幻旋律馆",subtitle:"138.1万关注"},
       {img:require('../../../../public/img/index/channel1.jpg'),title:"3D音乐奇幻旋律馆",subtitle:"138.1万关注"},
        {img:require('../../../../public/img/index/channel1.jpg'),title:"3D音乐奇幻旋律馆",subtitle:"138.1万关注"},
       {img:require('../../../../public/img/index/channel1.jpg'),title:"3D音乐奇幻旋律馆",subtitle:"138.1万关注"},
       {img:require('../../../../public/img/index/channel1.jpg'),title:"3D音乐奇幻旋律馆",subtitle:"138.1万关注"},
        {img:require('../../../../public/img/index/channel1.jpg'),title:"3D音乐奇幻旋律馆",subtitle:"138.1万关注"},
       {img:require('../../../../public/img/index/channel1.jpg'),title:"3D音乐奇幻旋律馆",subtitle:"138.1万关注"},
       {img:require('../../../../public/img/index/channel1.jpg'),title:"3D音乐奇幻旋律馆",subtitle:"138.1万关注"},
       {img:require('../../../../public/img/index/channel1.jpg'),title:"3D音乐奇幻旋律馆",subtitle:"138.1万关注"}
     ],
    
   }
  },
  methods: {
    
  },
  watch: {
    
  },
  components: {
    "axn-text": AxnText,
    "channel-copy": ChannelCopy
  },
  computed: {
    // 计算频道
    // calc(){
    //   for(img of this.imgs){
    //     this.count++;
    //   }
    // }
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
  
</style>