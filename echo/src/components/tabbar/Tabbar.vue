<template>
  <main class="main-footer">
    <footer class="footerv1">
      <div class="footer-left">
        <em class="footer-home"></em>
      </div>
      <div class="footer-center">
        <em class="footer-task"></em>
      </div>
      <div class="footer-right">
        <em class="footer-me"></em>
      </div>
    </footer>
  </main>
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
}
</script>
<style lang="scss">
  .main-footer::before{
    content:"";
    display: table;
    height:2.25rem;
  }
  .footerv1{
    width:100%;
    height: 2.25rem;
    position: fixed;
    bottom: 0;
    background: #fff;
    border-top: 1px solid #e8e8e8;
    display: flex;
    justify-content: space-around;
    align-items: center;
    .footer-left{
      .footer-home{
        width: .9375rem;
        height: .9375rem;
        display: inline-block;
        background: url(../../../public/img/tabbar/ic_main_music_coin_home.png) no-repeat;
        background-size: 100%;
      }
      .footer-home.on{
        background: url(../../../public/img/tabbar/ic_main_music_coin_home_sel.png) no-repeat;
        background-size: 100%;
      }
    }
    .footer-center{
      width:20%;
      height:2.25rem;
      background: #6ed56c;
      text-align: center;
      line-height: 2.25rem;
      &::after{
        content:"";
        display: block;
        width:1.125rem;
        height:1.125rem;
        background-image: url(../../../public/img/tabbar/ic_main_tab_echo.png);
        background-repeat: no-repeat;
        background-size: 100%;
      }
    }
  }
</style>