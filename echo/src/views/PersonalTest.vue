<template>
  <div class="container">
    <!-- 图片 -->
    <a href="javascript:void(0)">
      <img :src="testPic" style="width:100%;">
    </a>
  </div>
</template>
<script>
export default {
  props:{
    testPic:""
  },
  data() {
   return{}
  },
}
</script>
<style scoped lang='scss'>
  // 最外层div
  .container{
    margin: 0 auto;
      height: 75px;
    a{
      height: 75px;
      display: inline-block;
      width: 100%;
      text-align: center;
    }
    img{
      height:100%;
    }
  }
</style>