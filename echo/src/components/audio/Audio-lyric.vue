<template>
  <div class="container">
    <h3>歌曲信息</h3>
    <div class="line"></div>
    <!-- 歌词 -->
    <div class="lyric" v-html="lyrics">
    </div>
  </div>
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
  components: {
    
  },
  props: {
    lyrics:{
      type:String
    }
  },
  computed: {
    getLyrics(){
      return this.songs[0].lyrics;
    }
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
  .container{
    padding: 0 1rem;
    margin-top: 30px;
    h3{
      text-align: left;
      font-size: .875rem;
    }
    .line{
      margin: .375rem 0;
    }
    // 歌词
    .lyric{
      text-align: left;
    }
  }
</style>