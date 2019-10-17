<template>
  <div class="carousel">
    <mt-swipe :auto="4000" style="width:359px;height:147px;margin:0 auto;" :showIndicators="false">
      <mt-swipe-item v-for="(item,i) of imgs" :key="i">
         <a href="javascript:void(0);" class="carousel-item"  :data-i="imgIndex[i]">
        <img :src="item" alt="" width="359px" >
      </a>
      </mt-swipe-item>
    </mt-swipe>
  </div>
</template>
<script>
export default {
  data() {
   return{
     imgs:[
       require("../../../public/img/index/carousel1.jpg"),
       require("../../../public/img/index/carousel2.jpg"),
       require("../../../public/img/index/carousel3.jpg"),
       require("../../../public/img/index/carousel4.jpg"),
       require("../../../public/img/index/carousel5.jpg"),
       require("../../../public/img/index/carousel6.jpg"),
     ],
    imgIndex:[0,1,2,3,4,5]
   }
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
  .carousel{
    padding:0 8px;
  }
</style>