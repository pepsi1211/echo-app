<template>
<main class="main-center">
  <header class="headerv1">
    <div class="header-chat">
      <router-link to="/">
        <em class="pic"></em>
      </router-link>
    </div>
    <div class="header-logo">
      <router-link :to="{path:'index'}"> 
          <em class="pic-logo"></em>
      </router-link>
    </div>
    <div class="header-right">
      <em class="pic search"></em>
      <em class="pic audio" @click="goto()"></em>
    </div>
  </header>
</main>
</template>
<script>
// import line from '../index/sublevel/Line.vue'
export default {
  data() {
   return{
     isBack:false,
   }
  },
  methods: {
      goto(){
        this.$router.push('/Index/songs');
      }
    },
  watch: {
    },
  computed: {
    },
  components:{
  }
}
</script>
<style lang="scss" scoped>
.main-center::after{
    content: "";
    display: table;
    height:1.75rem;
}
.headerv1{
  width: 100%;
  height: 1.75rem;
  position: fixed;
  top:0;
  background: #fff;
  border-bottom: 1px solid #e8e8e8;
  z-index: 10;
  display: flex;
  justify-content: space-between;
  align-items: center;
  .header-chat{
    padding: .5rem;
    .pic{
      width: 1.21875rem;
      height: 1.015625rem;
      display: inline-block;
      background: url(../../../public/img/header/ic_circle_black.png) no-repeat;
      background-size: 100%;
    }
  }
  .header-logo{
    margin-left: 1.9rem;
    .pic-logo{
      width: 2.203125rem;
      height: .84375rem;
      display: inline-block;
      background: url(../../../public/img/header/ic_main_title_icon.png) no-repeat;
      background-size: 100%;
    }
  }
  .header-right{
    padding: .5rem;
    width: 20%;
    display: flex;
    justify-content: space-between;
    .pic{
      display: inline-block;
    }
    .search{
      width: 1.0625rem;
      height: 1.078125rem;
      background: url(../../../public/img/header/ic_search_black.png) no-repeat;
      background-size: 100%;
    }
    .audio{
      width: 1.21875rem;
      height: 1.21875rem;
      background: url(../../../public/img/header/disk.png) no-repeat;
      background-size: 100%;
    }
  }
}
</style>