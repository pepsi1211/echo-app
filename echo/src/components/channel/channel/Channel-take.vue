<template>
  <div>
    <!-- 统计频道 -->
    <axn-text>
      0
    </axn-text>
    <!-- 没有更多内容了 -->
    <div class="empty">
      <p>没有更多内容了</p>
    </div>
  </div>
</template>
<script>
// 引入 频道(统计)
import AxnText from './Axn-text'
export default {
  data() {
   return{}
  },
  methods: {
    
  },
  watch: {
    
  },
  components: {
    "axn-text": AxnText
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
  // 
  .empty{
    color: #adadad;
  }
</style>