<template>
  <div>
    <!-- 分割线 -->
    <line-division></line-division>
    <index-songs>
      <span slot="title">跟着节奏晃动身体</span>
      <li slot="li" v-for="(item,i) of getData" :key="i">
        <div class="songs">
          <div class="songs-img">
             <img :src="item.song_pic" alt="" slot="img">
          </div>
          <div class="songs-right">
            <span slot="songs-title">{{item.sname}}</span>
            <small slot="songs-subtitle">{{item.author}}</small>
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
    //  songs:[
    //    {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
    //    {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
    //    {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
    //    {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
    //    {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
    //    {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
    //    {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
    //    {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"},
    //    {img:require("../../../public/img/index/song1.png"),title:"[浪费]深情女声翻唱",subtitle:"毓毓毓然呀"}
    //  ]
   }
  },
  methods: {
  
  },
  watch: {
  
  },
  props:{
    songs:{
      type:Array,
      default:()=>{
        return [];
      }
    }
  },
  components:{
    "index-songs": Index_songs,
    "line-division": Line
  },
  computed: {
    getData(){
     // 随机拿到三首歌
      var arr = [];
      for(var i=0;i<11;i++){
        // 随机选取
        var num = parseInt(Math.random()*10);
        // console.log(num);
        if(arr.indexOf(this.songs[num])==-1){
          arr.push(this.songs[num]);
          if(arr.length==3){
            return arr;
          }
        }
      }
    }
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