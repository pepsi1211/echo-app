<template>
  <div>
    <v-touch @panstart="panstart" @panmove="panmove" @panend="panend" class="wrapper">
      <!-- <div class="menu-container" ref="menuContainer"> -->
        <div style="text-align:left;overflow:hidden;display:flex;" :style="marginLeft">
          <img v-for="i in 3" :src="require('../../../public/img/index/magazine1.jpg')" style="width: 250px;" alt="">
        </div>
      <!-- </div> -->
    </v-touch>
  </div>
</template>
<script>
export default {
  data() {
    return{
      marginLeft:{
        marginLeft:"0px"
      },
     move:0
    }
  },
  methods: {
    // 移动开始
    panstart(e){
      console.log(e)
      this.marginLeft.marginLeft = this.marginLeft.marginLeft;
    },
    // 移动中
    panmove(e){
      console.log(e.deltaX);
      this.marginLeft.marginLeft = parseInt(e.deltaX) + this.move + 'px';
    },
    // 移动结束
    panend(e){
      console.log(e);
      this.move += e.deltaX;
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
  computed: {
  
  },
  created() {
  
  },
  mouted() {
   
  
  }
}
</script>
<style scoped lang='scss'>
  
</style>