<template>
  <div class="replace-title">
    <!-- 换一批 头部 -->
    <h3><slot></slot></h3>
    <span class="icon"><i class="i-replace"></i>换一批</span>
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
  // 
  .replace-title{
    display: flex;
    justify-content: space-between;
    
    line-height: 28px;
    span{
      color: #cfcfcf;
    }
    // h3
    h3{
      font-size: 14px;
    }
    // 切换
    .i-replace{
      display: inline-block;
      width: 15px;
      height: 15px;
      background: url(../../../../public/img/index/replace.png) no-repeat center;
      background-size: 100%;
      vertical-align: middle;
      margin: 0 6px 2px 0;
    }
  }
</style>