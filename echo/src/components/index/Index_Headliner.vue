<template>
  <div class="container">
    <!-- 分割线 -->
    <line-division></line-division>
    <!-- 头部 -->
    <replace-title>
      瞩目艺人
    </replace-title>
    <!-- 艺人list -->
    <div class="stars-con">
      <ul>
        <li class="stars-item" v-for="(star,i) of stars" :key="i">
          <div>
            <a href="javascript:void(0);" class="stars-link">
              <img :src="star.img" style="width:100px" alt="">
              <span>{{star.name}}</span>
              <i>{{star.msg}}</i>
            </a>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
// 引入分割线
import Line from './sublevel/Line'
// 引入标题
import Replace_title from './sublevel/Replace_title'
export default {
  data() {
   return{
     stars:[
       {img:require("../../../public/img/index/stars1.jpg"),name:"陈楚生",msg:"3万关注者"},
       {img:require("../../../public/img/index/stars1.jpg"),name:"陈楚生",msg:"3万关注者"},
       {img:require("../../../public/img/index/stars1.jpg"),name:"陈楚生",msg:"3万关注者"},
       {img:require("../../../public/img/index/stars1.jpg"),name:"陈楚生",msg:"3万关注者"},
       {img:require("../../../public/img/index/stars1.jpg"),name:"陈楚生",msg:"3万关注者"},
       {img:require("../../../public/img/index/stars1.jpg"),name:"陈楚生",msg:"3万关注者"},
       
     ]
   }
  },
  methods: {
  
  },
  watch: {
  
  },
  computed: {
  
  },
  components:{
    "line-division": Line,
    "replace-title": Replace_title
  },
  created() {
  
  },
  mouted() {
  
  }
}
</script>
<style scoped lang='scss'>
  // 最外层div
  .container{
    padding: 0 8px;
    // 包裹艺列表
    .stars-con{
      margin: 0 4px;
      // ul弹性
      ul{
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        // a标签
        a{
          display: flex;
          flex-direction: column;
          color: #646464;
          // i标签字体样式
          i{
            color:#b8b6b7;
            font-style: normal;
          }
        }
      }
    }
  }
</style>