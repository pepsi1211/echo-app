<template>
  <main id="play-view" name="fade" :style="`transform:translateX(${translateX})`">
    <!-- 播放器头部 -->
    <echo-headerv2 @back="back"></echo-headerv2>
    <!-- 歌词页面 -->
    <audio-lyric></audio-lyric>
    <!-- 播放主页面 -->
    <echo-audio></echo-audio>
    <!-- 评论页面 -->
    <audio-comment></audio-comment>
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
     innerWidth:0
   }
  },
  methods: {
    back(){
      // 这个方法触发返回 和 过渡的translateX()
      this.translateX = 375 + 'px';
      this.$router.go(-1);
    }
  },
  watch: {
  },
  monted(){
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
    transition: all .2s ;
  }
</style>