<template>
  <div class="container">
    <div class="left">
      <a href="javascript:void(0);">
        <img :src="require('../../../public/img/index/03.jpg')" alt="" height="126px">
      </a>
    </div>
    <div class="right">
      <div>
        <router-link to="/Index/channel">
          <img :src="require('../../../public/img/index/02.png')" alt="" height="62px" width="200px">
        </router-link>
      </div>
      <div class="right-bottom">
        <router-link href="javascript:void(0);" to="/Index/ranking">
          <img :src="require('../../../public/img/index/04.png')" alt="" height="56px">
        </router-link>
        <router-link href="javascript:void(0);" to="Index/bells">
          <img :src="require('../../../public/img/index/01.png')" alt="" height="56px">
        </router-link>
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
<style scoped>
  /* 最外层div */
  .container{
    padding: 10px 8px;
    display: flex;
    justify-content: space-between;
  }
  /* 右边弹性布局 */
  .container>.right{
    display: flex;
    width: 200px;
    justify-content: space-between;
    flex-direction: column;
  }
  /* 右下弹性 */
  .container>.right>.right-bottom{
    display: flex;
    justify-content: space-between;
  }
  
  img{
    vertical-align: middle;
  }
</style>