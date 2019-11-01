<template>
  <main id="play-view" name="fade" :style="`transform:translateX(${translateX})`">
    <!-- 播放器头部 -->
    <echo-headerv2 @back="back"></echo-headerv2>
    <!-- 左右滑动 -->
    <mt-swipe :continuous="false" :defaultIndex="1" :auto="0" style="width:100%;height:715px;margin:0 auto;" :showIndicators="false">
      <mt-swipe-item style="height: 1000px;width: 375px;">
        <!-- 歌词页面 -->
        <audio-lyric :songs="songs"></audio-lyric>
      </mt-swipe-item>
      <mt-swipe-item style="height: 715px;width: 375px;">
        <!-- 播放主页面 -->
        <echo-audio></echo-audio>
      </mt-swipe-item>
      <mt-swipe-item >
        <!-- 评论页面 -->
        <audio-comment></audio-comment>
      </mt-swipe-item>
    </mt-swipe>
  </main>
</template>
<script>
// 引入头
import headerv2 from '../components/header/AudioHeader'
// 引入歌词
import AudioLyric from '../components/audio/Audio-lyric'
// 引入播放主页面
import audio from '../components/audio/Audio.vue'
// 引入评论页面
import AudioComment from '../components/audio/Audio-comment'
export default {
  data() {
   return{
     translateX:0,
     innerWidth:0,
     songs:[],
     channel:[]
   }
  },
  methods: {
    back(){
      // 这个方法触发返回 和 过渡的translateX()
      this.translateX = 375 + 'px';
      setTimeout(()=>{
        this.$router.go(-1);
      },300)
      
    }
  },
  watch: {
  },
  mounted(){
    var data = this.$route.params;
    this.songs = data.songs;
    this.channel = data.channel;
    // console.log(this.$route.params)
    console.log(this.songs);
  },
  computed: {
  },
  components: {
    "echo-audio":audio,
    "audio-lyric": AudioLyric,
    "audio-comment": AudioComment,
    "echo-headerv2":headerv2
  }
}
</script>
<style scoped>
  #play-view{
    /* transform: translateX(100px); */
    transition: all .7s cubic-bezier(.001,.001,.001,1);
  }
</style>