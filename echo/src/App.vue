<template>
  <div id="app">
   
      <router-view></router-view>
   
    
    <!-- <router-view v-if="!$route.meta.keepAlive"></router-view> -->
  </div>
</template>

<script>

import "./assets/demo.css"
// 引入头部


export default {

}
</script>

<style lang="scss">
body{
  margin:0;
}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  text-align: center;
  color: #2c3e50;
}
.main-center::after{
    display: table;
    height:1.75rem;
}
a{
  text-decoration: none;
}
</style>
