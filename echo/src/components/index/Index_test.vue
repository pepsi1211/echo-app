<template>
  <div class="container">
    <!-- 图片 -->
    <a href="javascript:void(0)">
      <img :src="require('../../../public/img/index/test.jpg')" style="width:358px" alt="">
    </a>
  </div>
</template>
<script>
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
  created() {
  
  },
  mouted() {
  
  }
}
</script>
<style scoped lang='scss'>
  // 最外层div
  .container{
    margin: 0 auto;
    padding: 10px 8px;
    a{
      display: inline-block;
      width: 358px;
      text-align: center;
    }
  }
</style>