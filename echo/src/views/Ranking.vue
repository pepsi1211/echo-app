<template>
  <div>
    <!-- 头部导航栏 -->
    <nav-bar>
      <h3 slot="h3">Echo</h3>
      <div slot="space" class="space"></div>
    </nav-bar>
    <!-- 1.一小时回声 -->
    <ranking-hours></ranking-hours> 
    <!-- 2.热门回声 -->
    <ranking-today></ranking-today>
    <!-- 3.本周热门回声 -->
    <ranking-week></ranking-week>
    <!-- 4.九月份排行绑 -->
    <ranking-month></ranking-month>
    <!-- 5.名人 -->
    <ranking-famous :list="list"></ranking-famous>
    <!-- 6.echo影音 -->
    <ranking-mv></ranking-mv>
  </div>
</template>
<script>
// 引入头部导航栏
import NavBar from '../components/index/NavBar'
// 1.引入1小时回声
import RankingHours from '../components/Ranking/Ranking-hours'
// 2.引入今日回声
import RankingToday from '../components/Ranking/Ranking-today'
// 3.引入本周热门回声
import RankingWeek from '../components/Ranking/Ranking-week'
// 4.引入月排行榜
import RankingMonth from '../components/Ranking/Ranking-month'
// 5.引入名人
import RankingFamous from '../components/Ranking/Ranking-famous'
// 6.引入影音
import RankingMv from '../components/Ranking/Ranking-mv'
export default {
  data() {
   return{
     list:[
       {img:require('../../public/img/index/singer.jpg'),singer:"周杰伦",fans:15.2,text:"歌手  职业演唱歌手"},
       {img:require('../../public/img/index/singer.jpg'),singer:"周杰伦",fans:15.2,text:"歌手  职业演唱歌手"},
       {img:require('../../public/img/index/singer.jpg'),singer:"周杰伦",fans:15.2,text:"歌手  职业演唱歌手"}
     ],
     
   }
  },
  methods: {
    
  },
  watch: {
    
  },
  components: {
    "ranking-hours": RankingHours,
    "nav-bar": NavBar,
    "ranking-today": RankingToday,
    "ranking-week": RankingWeek,
    "ranking-month": RankingMonth,
    "ranking-famous": RankingFamous,
    "ranking-mv":RankingMv
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