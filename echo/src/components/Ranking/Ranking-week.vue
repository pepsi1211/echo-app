<template>
  <div class="container">
    <ranking-tit>本周热门回声</ranking-tit>
    <ranking-echo :imgs="imgs"></ranking-echo>
    <!-- <line-division></line-division> -->
  </div>
</template>
<script>
// 头部
import RankingTit from './Ranking-tit'
// line
import Line from '../index/sublevel/Line'
// 引入回声
import RankingEcho from './Ranking-echo'
export default {
  data() {
   return{
     imgs:{img:require('../../../public/img/index/today1.jpg'),
     title:"What you know",
     subtitle:"echo回声"}
     
   }
  },
  methods: {
    
  },
  watch: {
    
  },
  components: {
    "ranking-tit": RankingTit,
    "line-division": Line,
    "ranking-echo": RankingEcho
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
    padding: .375rem .5rem;
  }
  .line{
    height: .125rem;
  }
</style>