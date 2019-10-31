<template>
<main class="main-center">
  <header class="headerv2" ref="headerv2">
    <div class="header-back" @click="back">
      <em class="pic-back-white" ref="back"></em>
    </div>
    <div class="header-details">
      <em class="pic lyrics"></em>
      <em class="pic song"></em>
      <em class="pic comment"></em>
    </div>
    <div class="header-more">
      <em class="pic-white" ref="more"></em>
    </div>
  </header>
</main>
</template>
<script>
export default {
  data() {
   return{}
  },
  mounted() {
    let headerv2 = this.$refs.headerv2;
    let back = this.$refs.back;
    let more = this.$refs.more;
    window.addEventListener('scroll',function () {
      console.log(document.documentElement.scrollTop);
      let t = document.documentElement.scrollTop;
      if(t>300){
        headerv2.style.background = '#fff';
        back.classList.remove("pic-back-white");
        more.classList.remove("pic-white");
        back.classList.add("pic-back-gray");
        more.classList.add("pic-gray");
      }else{
        headerv2.style.background = 'transparent';
        back.classList.remove("pic-back-gray");
        more.classList.remove("pic-gray");
        back.classList.add("pic-back-white");
        more.classList.add("pic-white");
      }
    })
  },
methods: {
    back(){
      this.$emit("back");
    }
  },
watch: {
  },
  props:{
    
  },
computed: {
  },
}
</script>
<style lang="scss">

.main-center::after{
    display: table;
}
  .headerv2{
    width: 100%;
    height: 1.75rem;
    position: fixed;
    top:0;
    z-index: 10;
    // background: transparent;
    // background: #fff;
    display: flex;
    justify-content: space-between;
    align-items: center;
    .header-back{
      margin-top: .225rem;
      padding: .5rem;
      .pic-back-gray{
        display: inline-block;
        width:.5rem;
        height:.90625rem;
        // padding: .5rem;
        background: url(../../../public/img/header/back_gray.png) no-repeat;
        background-size: 100%;
      }
      .pic-back-white{
        display: inline-block;
        width:.5rem;
        height:.90625rem;
        // padding: .5rem;
        background: url(../../../public/img/header/back_white.png) no-repeat;
        background-size: 100%;
      }
    }
    .header-details{
      width:43%;
      display: flex;
      justify-content: space-between;
      .pic{
        display: inline-block;
      }
      .pic.lyrics{
        margin-top: .025rem;
        width:.984375rem;
        height:1.03125rem;
        background: url(../../../public/img/header/ic_music_details_info_gray.png) no-repeat;
        background-size: 100%;
      }
      .pic.song{
        width:1.203125rem;
        height:1.203125rem;
        border-radius: 50%;
        background: url(../../../public/img/header/ic_main_tab_echo_normal.png) no-repeat;
        background-size: 100%;
      }
      .pic.comment{
        margin-top: .025rem;
        width:.984375rem;
        height: .9375rem;
        background: url(../../../public/img/header/ic_music_details_comment_gray.png) no-repeat;
        background-size: 100%;
      }
    }
    .header-more{
      margin-top: .225rem;
      padding: .5rem;
      .pic-gray{
        display: inline-block;
        width:.925rem;
        height: .1375rem;
        background: url(../../../public/img/header/ic_action_more_gray.png) no-repeat;
        background-size: 100%;
      }
      .pic-white{
        display: inline-block;
        width:.925rem;
        height: .1375rem;
        background: url(../../../public/img/header/ic_action_more_white.png) no-repeat;
        background-size: 100%;
      }
    }
  }
</style>