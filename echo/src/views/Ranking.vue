<template>
  <div>
    <!-- 头部导航栏 -->
    <nav-bar>
      <h3 slot="h3">Echo</h3>
      <div slot="space" class="space"></div>
    </nav-bar>
    <!-- 1.一小时回声 -->
    <ranking-hours></ranking-hours>
  </div>
</template>
<script>
// 引入头部导航栏
import NavBar from '../components/index/NavBar'
// 1.引入1小时回声
import RankingHours from '../components/Ranking/Ranking-hours'
// 2.引入今日回声
// 3.引入本周热门回声
export default {
  data() {
   return{}
  },
  methods: {
    
  },
  watch: {
    
  },
  components: {
    "ranking-hours": RankingHours,
    "nav-bar": NavBar
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