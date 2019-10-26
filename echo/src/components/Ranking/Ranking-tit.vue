<template>
  <div class="container">
    <!-- 左右浮动 -->
    <div class="tit">
      <span class="tit-left">
        <i></i>
        <slot></slot>
      </span>
      <small class="tit-right">查看全部</small>
    </div>
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
  // 最外层
  .container{
    padding: 0 .625rem;
  }
  // 清除浮动
  .tit{
    line-height: 30px;
    &::after{
      display: block;
      content: "";
      clear: both;
    }
    // 左边浮动
    .tit-left{
      float: left;
      color: #000;
      font-size: .75rem;
      vertical-align: middle;
      i{
        display: inline-block;
        width: .9375rem;
        height:.9375rem;
        background: url(../../../public/img/index/ic_hot_fire.png) no-repeat;
        background-size: contain;
        vertical-align: middle;
        margin-right: .375rem;
        margin-bottom: .125rem;
      }
    }
    // 右边浮动
    .tit-right{
      float: right;
      color: #6ed56c;;
    }
  }
</style>