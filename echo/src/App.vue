<template>
  <div id="app">
    <router-view/>
    
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
</style>
