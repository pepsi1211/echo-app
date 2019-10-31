<template>
  <div>
    <!--  -->
    <ranking-tit>1小时热门回声</ranking-tit>
    <!-- 排行 -->
    <div class="rank" v-for="i in 2" :key="i">
      <!-- 左 序号加图片 -->
      <div class="rank-left">
        <small>01</small>
        <i></i>
      </div>
      <!-- 右 标题加图片加标题 -->
      <div class="rank-right">
        <small>初恋</small>
        <span class="bottom">
          <i></i>
          <small>陈一电台</small> 
          <!-- 线 -->
          <div class="line"></div>
        </span>
      </div>
    </div>
    <div class="rank">
      <!-- 左 序号加图片 -->
      <div class="rank-left">
        <small>01</small>
        <i></i>
      </div>
      <!-- 右 标题加图片加标题 -->
      <div class="rank-right">
        <small>初恋</small>
        <span class="bottom">
          <i></i>
          <small>陈一电台</small> 
          <!-- 线 -->
          <!-- <div class="line"></div> -->
        </span>
       
      </div>
       
    </div>
    <div class="line"></div>
  </div>
</template>
<script>
// 引入公共标题
import RankingTit from './Ranking-tit'
export default {
  
  data() {
   return{}
  },
  methods: {
    
  },
  watch: {
    
  },
  components: {
    "ranking-tit": RankingTit
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
  .rank{
    padding: .375rem 0.625rem;
    display: flex;
    justify-content: space-between;
    // 左边
    .rank-left{
      width: 22%;
      display: flex;
      justify-content: space-between;
      align-items: center;
      // 文字样式
      small{
        color: #e53000;
        font-size: .8125rem;
      }
      // 图片
      i{
        display: inline-block;
        width: 3.4375rem;
        height: 3.4375rem;
        background: url(../../../public/img/index/renk1.jpg) no-repeat;
        background-size: contain;
      }
    }
    // 右边
    .rank-right{
      width: 75%;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      text-align: left;
      small{
        color:#252525;
        // font-size: .8125rem;
        font-weight: 500;
      }
      .line{
        height:.125rem;
      }
      // 下部分
      .bottom{
        i{
          display: inline-block;
          width: .9375rem;
          height: .9375rem;
          background: url(../../../public/img/index/radio1.jpg) no-repeat;
          background-size: contain;
          vertical-align: middle;
        }
        small{
          color: #8e8e8e;
          display: inline-block;
          font-size: .75rem;
          transform: scale(.73);
          margin-bottom: .3125rem;
        }
      }
    }
  }
  .line{
    height: .125rem;
  }
</style>