<template>
  <div :style="`backgroundImage:linear-gradient(to right,${color})`" class="banner">
    <slot></slot>
    <router-link to="">进入榜单</router-link>
  </div>
</template>
<script>
export default {
  data() {
   return{
     
   }
  },
  methods: {
    
  },
  watch: {
    
  },
  components: {
    
  },
  props: ['color'],
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
  .banner{
    height: 2.5rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color:#fff;
    span{
      padding-left: .625rem;
      
      font-size: .875rem;
      line-height: 2.5rem;
    }
    a{
      text-decoration: none;
      margin-right: .625rem;
      text-align: center;
      line-height: 1.25rem;
      padding: 0 .625rem;
      border-radius: 1.125rem;
      border: .0625rem solid #fff;
      height: 20px;
      color:#fff;
      font-size: .75rem;
      transform: scale(.8);
    }
  }
</style>