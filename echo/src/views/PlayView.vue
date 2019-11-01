<template>
<keep-alive>
    <main v-if="$route.meta.keepAlive" id="play-view" name="fade" :style="`transform:translateX(${translateX})`">
      <!-- 播放器头部 -->
      <echo-headerv2 @back="back"></echo-headerv2>
      <!-- 左右滑动 -->
      <mt-swipe
        :continuous="false"
        :defaultIndex="1"
        :auto="0"
        style="width:100%;height:715px;margin:0 auto;"
        :showIndicators="false"
      >
        <mt-swipe-item style="height: 1000px;width: 375px;">
          <!-- 歌词页面 -->
          <audio-lyric :lyrics="songs.lyrics"></audio-lyric>
        </mt-swipe-item>
        <mt-swipe-item style="height: 715px;width: 375px;">
          <!-- 播放主页面 -->

          <component :is="'echo-audio'" :songs="songs" :channel="channel"></component>
        </mt-swipe-item>
        <mt-swipe-item>
          <!-- 评论页面 -->
          <audio-comment></audio-comment>
        </mt-swipe-item>
      </mt-swipe>
    </main>
</keep-alive>
</template>
<script>
// 引入头
import headerv2 from "../components/header/AudioHeader";
// 引入歌词
import AudioLyric from "../components/audio/Audio-lyric";
// 引入播放主页面
import audio from "../components/audio/Audio.vue";
// 引入评论页面
import AudioComment from "../components/audio/Audio-comment";
export default {
  data() {
    return {
      translateX: 0,
      innerWidth: 0,
      songs: [],
      channel: [],
      data: [],
      num:1
    };
  },
  beforeRouteEnter (to, from, next) {
    next(vm=>{
      var test=JSON.parse(sessionStorage.getItem("params"));
     console.log(test);
      vm.songs =test.data[0].songs[0]; 
      vm.channel =test.data[1].channel[0];
    })
  },
  methods: {
    back() {
      // 这个方法触发返回 和 过渡的translateX()
      this.translateX = 375 + "px";
      setTimeout(() => {
        this.$router.go(-1);
      }, 300);
    },
    onload() {
     var test=sessionStorage.getItem("params");
     console.log(test);
      this.data = this.$route.params.data;
      this.songs = this.data[0].songs[0];
      this.channel = this.data[0].songs[0];
      // console.log(this.$route.params)
      console.log("更新");
      console.log(this.$route.params.data);
      console.log(this.channel, this.songs);
    }
  },
  activated() {
    // console.log(this.data);
    //  console.log(this.$route.params);
    // console.log("触发 activated");
    // console.log(this.$route.params.data<=0);
    console.log(this.$route.params.data);
    if (this.$route.params.data) {
      console.log("雷猴");
      // this.songs = [];
      // this.channel = []; // 清空原有数据
      this.onload(); // 这是我们获取数据的函数
      // this.$ro ute.meta.isUseCache = true;
      //  this.$route.meta.isBack = false;
    }
  },
  // 详情页面的beforeRouteLeave钩子函数
  // beforeRouteLeave (to, from, next) {
  //   if (to.name == 'List') {
  //     to.meta.isUseCache = true;
  //   }
  //   next();
  // },
  created() {
  
      // sessionStorage.clear()
  },
  watch: {
    
  },
  mounted() {
   
    // sessionStorage.params="";
  },
  updated() {},
  computed: {},
  components: {
    "echo-audio": audio,
    "audio-lyric": AudioLyric,
    "audio-comment": AudioComment,
    "echo-headerv2": headerv2
  }
};
</script>
<style scoped>
#play-view {
  /* transform: translateX(100px); */
  transition: all 0.7s cubic-bezier(0.001, 0.001, 0.001, 1);
}
</style>