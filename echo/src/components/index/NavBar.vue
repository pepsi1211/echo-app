<template>
<div>
  <div class="container">
    <!-- 头部导航栏 -->
    <!-- 左 中 右 -->
    <!-- 右箭头 -->
    <i class="left" name="left" @click="back"></i>
    <!-- 中间文字 -->
    <slot name="h3"></slot>
    <!-- 右边图标 -->
    <!-- 搜索加音乐 -->
    <slot name="div"></slot>
    <!-- 音乐 -->
    <slot name="icon1"></slot>
    <!-- 空白 使标题居中 -->
    <slot name="space" class="space"></slot>
  </div>
  <!-- 白线 -->
  <div class="line"></div>
</div> 
</template>
 
<script>
export default {
  data() {
   return{}
  },
  methods: {
    back(){
      this.$router.go(-1);
    }
  },
  watch: {
    
  },
  components: {
    
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
  // 最外层div
  .container{
    padding: 0 .5rem;
    line-height: 2.5rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    // h3
    h3{
      font-size: .9375rem; 
    }
    // 左边返回箭头
    .left{
      display: inline-block;
      width: 3rem;
      height: 0.9rem;
      background: url(../../../public/img/index/back_gray.png) no-repeat;
      background-size: contain;
      vertical-align: middle;
    }
    // 右边
    .right{
      display: flex;
      justify-content: space-between;
      align-items: center;
      width: 3rem;
      // width: 150px;
      i{
        display: inline-block;
        width: 1rem;
        height:1rem;
        // 第一个i
        &:first-child{
          background: url(../../../public/img/index/ic_search_black.png) no-repeat;
          background-size: contain;
        }
        &:nth-child(2){
          background: url(../../../public/img/index/disk.png) no-repeat;
          background-size: contain;
         
        }
      }
    }
    // 音乐
    .icno{
      display: inline-block;
      width: 1rem;
      height:1rem;
      background: url(../../../public/img/index/disk.png) no-repeat;
      background-size: contain;
    }
    // 空白
    .space{
      width: 3rem;
    }
    // line
    .line{
      color: #e5e5e5;
      height: 1px;
    }
  }
</style>