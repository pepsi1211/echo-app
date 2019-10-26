<template>
  <div class="container">
    <!-- 标题 -->
    <div class="tit">
      <i class="tit-icon"></i>
      <span>9月份排行总榜</span>
    </div>
    <!--  -->
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