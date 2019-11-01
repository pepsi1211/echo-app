<template>
  <div class="container">
    <!-- 标题
    <div class="title">
      <h3>为你推荐<i class="i-right"></i></h3>
      <span><i class="i-play"></i>一键播放</span>
    </div>
    mint 轮播 
    <mt-swipe :auto="4000" style="width:359px;height:147px;margin:0 auto;" :showIndicators="false">
         <ul>
           <mt-swipe-item v-for="(item,i) of songs" :key="i" >
           <li style="height:200px">
              定宽弹性 
             <div>
               左边图片 
               <div>
                 <img :src="item.img" alt="">
               </div>
                右边标题 
               <div>
                 <span>{{item.title}}</span>
                 <span>{{item.subtitle}}</span>
               </div>
             </div>
             
           </li>
           </mt-swipe-item>
         </ul>
    </mt-swipe> -->
    <index-songs>
      <span slot="title">为你推荐</span>
      <li slot="li" v-for="(item,i) of getData" :key="i">
        
        <div class="songs" @click="jump($event)" :data-sid="item.sid">
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
    jump(e){
      var sid = e.currentTarget.dataset.sid;
      console.log(sid);
      this.$emit("jump",sid);
    } 
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
          if(arr.length==3){
            return arr;
          }
        }
      }
    }
  },
components:{
    "index-songs":Index_songs,
  },
created() {
  
  },
mouted() {
  
  }
}
</script>
<style scoped lang="scss">
// 引入scss文件
@import '../../assets/songs.scss';
  // 最外层div
  .container{
    padding: 10px 0;
    //   }
    //   // 右箭头
    //   .i-right{
    //     background: url(../../../public/img/index/right.png) no-repeat center;
    //     background-size:  100%;
    //     width: 18px;
    //     height: 18px;
    //     margin: 0 0 3px 4px;
    //   }
    //   // 播放
    //   .i-play{
    //     background: url(../../../public/img/index/play.png) no-repeat center;
    //     background-size:  100%;
    //     margin: 0 4px 3px 0;
    //   }
    // }
  }
  // // 歌曲
  // .songs{
  //   display: flex;
  //   height: 40px;
  //   // img
  //   // 右边
  //   .songs-right{
  //     display: flex;
  //     flex-direction: column;
  //     justify-content: space-between;
  //     align-items: flex-start;
  //     margin-left: 10px;
  //     // 下的span 标题
  //     span{
  //       font: "12px 微软雅黑";
  //     }
  //     // 下的subtitle
  //     small{
  //       color: #cfcfcf;
  //     }
  //   }
  // }
  // // 歌曲列表下
  // .songs-list{
  //   &>li{
  //     margin-top: 10px;
  //   }
  // }
  // // 歌曲图片
  // .songs-img{
  //   width: 40px;
  //   height: 40px;
  //   // 图片定宽
  //   img{
  //     width: 40px;
  //   }
  // }
</style>