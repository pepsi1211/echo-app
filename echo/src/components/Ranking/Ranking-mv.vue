<template>
  <div>
    <!-- 标题 -->
    <banner :color="color">
      <span>echo影音</span>
    </banner>
    <!-- 主体 -->
    <public :list="list"></public>
  </div>
</template>
<script>
import Banner from './Banner'
import Public from './public'
export default {
  data() {
   return{
     color:"#7f9ed5,#98baf7",
     list:[
       {img:require('../../../public/img/index/mv1.jpg'),text:"奔跑怪物",textIcon:require('../../../public/img/index/echo.jpg'),title:`李宇春（Feat.Click#15）《原野》（电影《双子杀手》主题曲"独自进击"版MV`
       },
       {img:require('../../../public/img/index/mv1.jpg'),text:"echo回声",
       textIcon:require('../../../public/img/index/echo.jpg'),title:`李宇春（Feat.Click#15）《原野》（电影《双子杀手》主题曲"独自进击"版MV`
       },
       {img:require('../../../public/img/index/mv1.jpg'),text:"echo回声",
       textIcon:require('../../../public/img/index/echo.jpg'),title:`李宇春（Feat.Click#15）《原野》（电影《双子杀手》主题曲"独自进击"版MV`}
     ]
   }
  },
  methods: {
    
  },
  watch: {
    
  },
  components: {
    "banner":Banner,
    "public":Public
  },
  props: {
    
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
  
</style>