<template>
  <div class="container">
    <!-- <ranking-tit>今日热门回声</ranking-tit> -->
    <!-- 滑动事件 -->
    <v-touch class="touch wrapper" @panstart="panstart" @panmove="panmove" style="position:relative;" @panend="panend" >
      <div class="menu-container" ref="menuContainer" :style="{marginLeft:left+'px'}" >    
        <!-- 这个是内容 -->  
        <div class="touch-item" v-for="i in 10" :key="i">
          <i :style="{background:`url(${imgs.img})`,backgroundSize:'contain',backgroundRepeat:'no-reapeat'}"></i>
          <b>{{imgs.title}}</b>
          <span>{{imgs.subtitle}}</span>
        </div>
	    </div>
    </v-touch>
    <!--  -->
    <line-division></line-division>
  </div>
</template>
<script>
// 头部
import RankingTit from './Ranking-tit'
// line
import Line from '../index/sublevel/Line'
export default {
  data() {
   return{
     left:0,
     move:0,
     
   }
  },
  methods: {
    panstart(e){
      
    },
    panmove(e){
      var move = e.deltaX + this.move;
      // 判断，不能出左边
      move>0&&(move=0);
      // 不能超过右边
      move<-693&&(move=-693);
      this.left = move;
      // console.log(this.left); 
    },  
    panend(e){
      this.move += e.deltaX;
      // 不能超过左边
      this.move>0&&(this.move=0);
      // 不能超过右边
      this.move<-693&&(this.move=-693);
    }
  },
  watch: {
    
  },
  components: {
    "ranking-tit": RankingTit,
    "line-division": Line
  },
  props: ['imgs'],
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
  // .container{
  //   padding: .25rem .5rem 0;
  // }
  .menu-container{
    // padding: .3125rem .5rem;
    // width: 65.8125rem;
    display: flex;
    overflow: hidden;
    justify-content: space-between;
    // 滑动列表
    .touch-item{
      padding: 0 .175rem;
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      text-align: left;
      // 设置图片
      i{
        display: inline-block;
        width: 6.25rem;
        height:6.25rem;
        
      }
      // 标题
      b{
        font-weight: normal;
      }
      // 子标题
      span{
        color: #b8b8b8;
        font-size: .75rem;
        transform: scale(.8);
        margin-left: -0.75rem;
      }
    }
  }
  .line{
    height: .125rem;
  }
</style>