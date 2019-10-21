<template>
  <main>
    <!-- 测试的播放器 -->
    <echo-audio></echo-audio>
  </main>
</template>
<script>
import audio from '../components/audio/Audio.vue'

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
    "echo-audio":audio
  }
}
</script>
<style scoped>
  
</style>