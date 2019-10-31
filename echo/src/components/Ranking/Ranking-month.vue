<template>
  <div class="container">
    <!-- 标题 -->
    <div class="tit">
      <i class="tit-icon"></i>
      <span>9月份排行总榜</span>
    </div>
    <!-- 回声 -->
    <banner :color="color">
      <span>回声</span>
    </banner>
    <!-- 榜单 -->
    <public :list="list"></public>
  </div>
</template>
<script>
// 引入banner
import Banner from './Banner'
// 引入public
import Public from './public'
export default {
  data() {
   return{
     color:"#f29da0,#fbacb1",
     list:[
       {img:require('../../../public/img/index/mouth.jpg'),text:"echo回声",textIcon:require('../../../public/img/index/echo.jpg'),title:"我和我的祖国(钢琴独奏版)-JI LIU(刘骥)"
       },
       {img:require('../../../public/img/index/mouth.jpg'),text:"echo回声",
       textIcon:require('../../../public/img/index/echo.jpg'),title:"我和我的祖国(钢琴独奏版)-JI LIU(刘骥)"
       },
       {img:require('../../../public/img/index/mouth.jpg'),text:"echo回声",
       textIcon:require('../../../public/img/index/echo.jpg'),title:"我和我的祖国(钢琴独奏版)-JI LIU(刘骥)"
       },
     ]
   }
  },
  methods: {
    
  },
  watch: {
    
  },
  components: {
    "banner": Banner,
    "public": Public
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
  .container{
    padding: .3125rem 0;
  }
  .tit{
    text-align: left;
    padding: .25rem 0 .375rem .5rem;
    // 设置背景图
    .tit-icon{
      display: inline-block;
      width: .9375rem;
      height:.9375rem;
      background: url(../../../public/img/index/data.jpg) no-repeat;
      background-size: contain;
      vertical-align: middle;
      margin-right: .3125rem;
    }
  }
</style>