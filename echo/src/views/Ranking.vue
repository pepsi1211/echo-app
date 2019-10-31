<template>
  <div>
    <!-- 头部导航栏 -->
    <nav-bar>
      <h3 slot="h3">Echo</h3>
      <div slot="space" class="space"></div>
    </nav-bar>
    <!-- 1.一小时回声 -->
    <ranking-hours></ranking-hours>
    <!--  -->
    <ranking-today></ranking-today>
    <!--  -->
    <ranking-week></ranking-week>
    <!--  -->
    <ranking-month></ranking-month>
    <!--  -->
    <ranking-famous :list="list"></ranking-famous>
    <!--  -->
    <ranking-mv></ranking-mv>
  </div>
</template>
<script>
// 引入头部导航栏
import NavBar from '../components/index/NavBar'
// 1.引入1小时回声
import RankingHours from '../components/Ranking/Ranking-hours'
// 2.引入今日回声
import RankingToday  from '../components/Ranking/Ranking-today'

// 3.引入本周热门回声
import RankingWeek from '../components/Ranking/Ranking-week.vue'
// 4. 引入九月份排行榜
import RakningMonth from '../components/Ranking/Ranking-month'
// 5.引入名人
import RakningFamous from '../components/Ranking/Ranking-famous'
// 6.引入echo影音
import RankingMv from '../components/Ranking/Ranking-mv'
export default {
  data() {
   return{
     imgs:[
       {img:require('../../public/img/index/jay.jpg'),title:"我和我的祖国",subtitle:"echo回声"},
       {img:require('../../public/img/index/jay.jpg'),title:"我和我的祖国",subtitle:"echo回声"},
       {img:require('../../public/img/index/jay.jpg'),title:"我和我的祖国",subtitle:"echo回声"}
     ],
     list:[
       {singer:"周杰伦",text:"歌手 职业演唱歌手",fans:15.2},
       {singer:"周杰伦",text:"歌手 职业演唱歌手",fans:15.2},
       {singer:"周杰伦",text:"歌手 职业演唱歌手",fans:15.2}
     ]
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
    "ranking-month": RakningMonth,
    "ranking-famous": RakningFamous,
    "ranking-mv": RankingMv
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