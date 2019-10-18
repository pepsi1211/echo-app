<template>
  <div class="container">
    <!-- title  -->
    <div class="title">
      <h3>T<i class="i-green"></i>DAY<i class="i-right"></i></h3>
      <span class="text">
        <i class="i-song"></i>
        音乐签
      </span>
    </div>
    <!-- 巨幕 -->
    <div class="wall">
      <div class="wall_fir">
        <img src="../../../public/img/index/imx2.jpg" alt="" width="359px">
      </div>
      <div class="wall_sec">
        <img src="../../../public/img/index/imx1.jpg" alt="" width="359px">
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
   return{}
  },
methods: {
  
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
<style scoped lang="scss">
  /* 最外层div */
  .container{
    padding: 10px 10px;
  }
  /* 标题 弹性 */
  .title{
    display: flex;
    justify-content: space-between;
    // h3 样式
    h3{
      font-size: 14px;
      color: #2c3e50;
    }
    // 设置字体
    .text{
      font-size: 12px;
      color: #cfcfcf;
      line-height: 28px;
      vertical-align: middle;
    }
  }
  .title h3{
    
    vertical-align: middle;
  }
  /* 设置背景图公共样式 */
  .container  i{
    display: inline-block;
    width: 15px;
    height: 15px;
    vertical-align: middle;
  }
  /* 小绿球 */
  .title .i-green{
    background: url(../../../public/img/index/wave_00000.png) no-repeat center;
    width: 30px;
    height: 30px;
    vertical-align: middle;
    background-size: 100%;
    margin-left: -4px;
    margin-right: -4px;
    margin-top: -2px;
  }
  /* 向右箭头 */
  .i-right{
    background: url(../../../public/img/index/right.png) no-repeat center;
    background-size: 100%;
    vertical-align: middle;
    margin: 0px 0 4px 6px;
  }
  // 音乐签
  .i-song{
    background: url(../../../public/img/index/icon1.png) no-repeat center;
    background-size: 100%;
    vertical-align: middle;
    margin-right: 6px;
  }
  // 背景部分 
  .wall{
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 545px;
  }
</style>