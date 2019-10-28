<template>
  <div class="container">
    <!-- 公共组件 统计频道 -->
    <p>
      共 <slot></slot>个频道
    </p>
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
    padding: 14px 0 8px 0;
  }
  p{
    color: #adadad;
  }
</style>