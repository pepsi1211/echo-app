<template>
  <main>
    <!-- 头部组件 -->
    <echo-header></echo-header>
    <!-- 测试的播放器 -->
    <echo-audio></echo-audio>
  </main>
</template>
<script>
import audio from '../components/audio/Audio.vue'
import header from '../components/header/Header.vue'

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
  components: {
    "echo-audio":audio,
    "echo-header":header
  }
}
</script>
<style scoped>
  
</style>