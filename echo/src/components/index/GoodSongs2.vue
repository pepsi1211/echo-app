<template>
  <div>
    <!-- 分割线 -->
    <line-division></line-division>
    <index-songs>
      <span slot="title">跟着节奏晃动身体</span>
      <li slot="li" v-for="(item,i) of songs" :key="i">
        <div class="songs">
          <div class="songs-img">
             <img :src="item.img" alt="" slot="img">
          </div>
          <div class="songs-right">
            <span slot="songs-title">{{item.title}}</span>
            <small slot="songs-subtitle">{{item.subtitle}}</small>
          </div>
        </div>
      </li>
    </index-songs>
  </div>
</template>
<script>
// 引入 Index_songs
import Index_songs from './Index_songs'
// 引入分割线
import Line from './sublevel/Line'
export default {
  data() {
   return{
     songs:[
       {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
       {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
       {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
       {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
       {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
       {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
       {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
       {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
       {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"}
     ]
   }
  },
  methods: {
  
  },
  watch: {
  
  },
  components:{
    "index-songs": Index_songs,
    "line-division": Line
  },
  computed: {
  
  },
  created() {
  
  },
  mouted() {
  
  }
}
</script>
<style scoped lang='scss'>
  // 引入scss文件
  @import '../../assets/songs.scss';
</style>