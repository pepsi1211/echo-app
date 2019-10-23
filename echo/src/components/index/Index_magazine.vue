<template>
  <div class="container">
    <!-- 标题 -->
    <replace-title>音乐杂志</replace-title>
    <v-touch @panstart="panstart" @panmove="panmove" @panend="panend" class="wrapper">
      <!-- <div class="menu-container" ref="menuContainer"> -->
        <div style="text-align:left;overflow:hidden;display:flex;" :style="marginLeft">
          <img v-for="i in 10" :key="i" :src="require('../../../public/img/index/magazine1.jpg')" style="width: 250px;" alt="">
        </div>
      <!-- </div> -->
    </v-touch>
  </div>
</template>
<script>
// 引入
import Replace_title from './sublevel/Replace_title'
export default {
  data() {
    return{
      marginLeft:{
        marginLeft:"0px"
      },
     move:0,
     screenWidth: document.body.clientWidth,
    }
  },
  methods: {
    // 移动开始
    panstart(e){
      
    console.log(this.screenWidth);
    },
    // 移动中
    panmove(e){
      // 移动距离
      var move = parseInt(e.deltaX) + this.move;
      // 左边不能超出范围
      move>0&&(move=0); 
      // 右边不能超出范围
      move<-(250*10-367+80)&&(move=-(250*10-367+80));
      console.log(move);
      // console.log(e.deltaX);
      // console.log(move);
      this.marginLeft.marginLeft = move + 'px';
      console.log("移动中");
    },
    // 移动结束
    panend(e){
      this.move += e.deltaX;
      // 判断移动结束时，超出范围，自动校正
      this.move>0&&(this.move=0);
      this.move<-(250*10-367+80)&&(this.move=-(250*10-367+80));
      console.log("移动结束");
    },
    //  panleft(e){
    //  // 左移时加上右移的距离
    //  var right = this.right;
    //  // 将左移的距离放到变量
    //  // 判断left是否为0(如果为0就是第一次，用当前移动距离替代marginLeft)
    //  if(!(this.left)){
    //    this.marginLeft.marginLeft = e.deltaX + right + 'px';
    //  }else{
    //    // 否则不是0，移动距离加上存储的距离
    //    this.marginLeft.marginLeft = e.deltaX + right  + 'px';
    //  }
    //  this.left = e.deltaX;
    //  this.right = 0;
    // },
    // panright(e){
    //  // 右移时获取左移距离
    //  var left = parseInt(this.left);
    //  this.right = e.deltaX + 'px';
    //  // 加上right
    //  this.marginLeft.marginLeft = e.deltaX + left + 'px';
    //  this.left = "0px";
    // }
  },
  watch: {
  
  },
  components:{
    "replace-title": Replace_title
  },
  computed: {
  
  },
  created() {
  
  },
  mounted() {
    // 自动获取宽度
    const that = this;
    window.onresize = () => {
      return (() => {
        window.screenWidth = document.body.clientWidth;
        that.screenWidth = window.screenWidth
      })();
    }
  }
}
</script>
<style scoped lang='scss'>
  // 最外层div
  .container{
    padding: 0 0 8px 8px;
    img{
      padding-left: 8px;
    }
  }
  // 修改引入组件样式
  .replace-title{
    padding-left: 8px;
  }
  // 隐藏span
  .replace-title >>>.icon {
    display: none;
  }
</style>