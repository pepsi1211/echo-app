<template>
  <div>
    <!-- 频道 -->
    <axn-text>176</axn-text>
    <!--  -->
    <channel-public :imgs="imgs"></channel-public>
  </div>
</template>
<script>
// 引入频道
import AxnText from './Axn-text'
// 引入
import ChannelPublic from './Channel-public'
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
    count:0
   }
  },
  methods: {
    
  },
  watch: {
    
  },
  components: {
    "axn-text": AxnText,
    "channel-public": ChannelPublic
  },
  computed: {
    
   
  },
  created() {
    
  },
  mounted() {
    // 计算频道
   
  },
  updated() {
    
  },
  destroyed() {
    
  }
}
</script>
<style scoped lang='scss'>
  
</style>