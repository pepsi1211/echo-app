<template>
  <div class="container">
    <!--  -->
    <replace-title>新歌发布</replace-title>
    <!-- 新歌 list -->
    <div class="new-songs-list">
      <ul>
        <li v-for="(song,i) of getData" :key="i">
          <div class="new-songs-item">
            <a href="javascript:void(0);">
              <img :src="song.song_pic" alt="" style="width:100px;height:100px;">
              <span>{{song.sname}}</span>
              <i>{{song.author}}</i>
            </a>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
// 引入标题
import Replace_title from './sublevel/Replace_title'
export default {
  data() {
   return{
    //  songs:[
    //    {img:require("../../../public/img/index/newsongs1.jpg"),title:"King Of Cowards",subtitle:"Pits Pits Pigs Pigs"},
    //    {img:require("../../../public/img/index/newsongs1.jpg"),title:"King Of Cowards",subtitle:"Pits Pits Pigs Pigs"},
    //    {img:require("../../../public/img/index/newsongs1.jpg"),title:"King Of Cowards",subtitle:"Pits Pits Pigs Pigs"},
    //    {img:require("../../../public/img/index/newsongs1.jpg"),title:"King Of Cowards",subtitle:"Pits Pits Pigs Pigs"},
    //    {img:require("../../../public/img/index/newsongs1.jpg"),title:"King Of Cowards",subtitle:"Pits Pits Pigs Pigs"},
    //    {img:require("../../../public/img/index/newsongs1.jpg"),title:"King Of Cowards",subtitle:"Pits Pits Pigs Pigs"}
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
      default: ()=>{
        return [];
      }
    }
  },
  computed: {
    getData(){
      // 随机拿到三首歌
      var arr = [];
      for(var i=0;i<11;i++){
        // 随机选取
        var num = parseInt(Math.random()*10);
        console.log(num);
        if(arr.indexOf(this.songs[num])==-1){
          arr.push(this.songs[num]);
          if(arr.length==6){
            return arr;
          }
        }
      }
    }
  },
  components:{
    "replace-title": Replace_title
  },
  created() {
  
  },
  mouted() {
  
  }
}
</script>
<style scoped lang='scss'>
  // 最外层div
  .container{
    padding: 0 8px;
    .new-songs-list{
      margin:0 4px;
      // ul弹性
      ul{
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
      }
      li{
        .new-songs-item{
          a{
            display: flex;
            flex-direction: column;
            width:  100px;
            color: #2c3e50;
            // span的字体样式
            span{
              font-size: 12px;
              color: #646464;
            }
            // i的字体样式
            i{
              font-size:12px;
              color: #b8b6b7;
              font-style: normal;
              text-overflow: ellipsis;
              white-space: nowrap;
              overflow: hidden;
            }
          }
        }
      }
    }
  }
</style>