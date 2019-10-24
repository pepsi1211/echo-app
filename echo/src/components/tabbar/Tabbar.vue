<template>
  <main class="main-footer">
    <footer class="footerv1">
      <div class="footer-left">
        <router-link to="/index" class="footer-home" active-class="on">
          <!-- <em class="footer-home"></em> -->
        </router-link>
      </div>
      <div class="footer-center">
        <em class="footer-task"></em>
      </div>
      <div class="footer-right">
        <router-link to="/PersonalPage" class="footer-me" active-class="on">
          <!-- <em class="footer-me"></em> -->
        </router-link>
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
      padding: .5rem;
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
      // text-align: center;
      line-height: 3rem;
      &::after{
        content:"";
        display: inline-block;
        width:1.125rem;
        height:1.125rem;
        background-image: url(../../../public/img/tabbar/ic_main_tab_echo.png);
        background-repeat: no-repeat;
        background-size: 100%;
      }
    }
    .footer-right{
      padding: .5rem;
      .footer-me{
        width:.875rem;
        height:.9375rem;
        display: inline-block;
        background: url(../../../public/img/tabbar/ic_main_tab_me_normal.png) no-repeat;
        background-size: 100%;
      }
      .footer-me.on{
        background: url(../../../public/img/tabbar/ic_main_tab_me_selected.png) no-repeat;
        background-size: 100%;
      }
    }
  }
</style>