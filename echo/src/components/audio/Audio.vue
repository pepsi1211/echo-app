<template>
  <main class="audio">
    <img src="../../../public/img/audio/『3D环绕』房东的猫 「云烟成雨」.jpg" class="audio-pic">
    <audio>
      <source src="../../../public/img/audio/『3D环绕』房东的猫 「云烟成雨」.mp3" type="audio/mpeg">
    </audio>
    <div class="sound">
      <div class="progress">
        <em class="duration">{{time}}</em>
        <div class="progress-bar">
          <span style="width:0%"></span>
        </div>
        <em class="total">{{total}}</em>
      </div>
      <div class="controls">
        <em class="play-mode"></em>
        <em class="prev"></em>
        <em :class="now == false ? 'play' : 'pause' " @click="doPlay"></em>
        <em class="next"></em>
        <em class="play-list"></em>
      </div>
    </div>
  </main>
</template>
<script>
export default {
  data() {
   return{
     time:"0:00",
     total:"0:00",
     now:false,
   }
  },
  created() {
  },
  methods: {
    doPlay(){
      var audio = document.getElementsByTagName("audio")[0];
      this.time = (audio.currentTime/60).toFixed(2);
      this.total = (audio.duration/60).toFixed(2);
      if(audio.paused){
        audio.play();
        this.now = true;
      }else{
        audio.pause();
        this.now = false;
      }
    }
  },
  watch: {
    time(){
      var audio = document.getElementsByTagName("audio")[0];
      var t = setInterval(function(){
        this.time = (audio.currentTime/60).toFixed(2);
        console.log(this.time);
      },500);
    }
  },
  computed: {
  },
}
</script>
<style lang="scss">
.audio{
  .audio-pic{
    width: 100%;
  }
}

.sound{
  width:100%;
  height:5.75rem;
  position: fixed;
  bottom: 0;
  background: #f4f4f4;
  // box-shadow: 0 0 5px rgba(0,0,0,.5);
  border-top:0.0075rem solid #999;
  .progress{
    width:100%;
    height:1.75rem;
    margin:0.75rem 0;
    display: flex;
    justify-content: space-around;
    align-items: center;
    .durantion, .total{
      color: #666;
      font-size: 14px;
      font-family: "simhei";
    }
    .progress-bar{
      width:70%;
      height:0.085rem;
      background: rgba(51,51,51,0.8);
      position: relative;
      span{
        height:100%;
        background: #6ed56c;
        position: absolute;
        left:0;
        &:after{
          content: "";
          display: inline-block;
          width:0.703125rem;
          height:0.703125rem;
          background: url(../../../public/img/audio/echo_seek_thumb.png);
          background-size: 100%;
          position: absolute;
          top:-0.3rem;right:-0.255rem;
        }
      }
    }
  }
  .controls{
    width:100%;
    display: flex;
    justify-content: space-around;
    align-items: center;
    .play-mode{
      display: inline-block;
      width:  0.890625rem;
      height: 0.796875rem;
      background: url(../../../public/img/audio/mp_loop.png) no-repeat;
      background-size: cover;
      cursor: pointer;
    }
    .prev{
      width:  0.703125rem;
      height: 0.796875rem;
      display: inline-block;
      background: url(../../../public/img/audio/mp_pre.png) no-repeat;
      background-size: cover;
      cursor: pointer;
    }
    .pause{
      width:  1.03125rem;
      height: 1.265625rem;
      display: inline-block;
      background: url(../../../public/img/audio/mp_pause.png) no-repeat;
      background-size: 100%;
      cursor: pointer;
    }
    .play{
      width:  1.03125rem;
      height: 1.265625rem;
      display: inline-block;
      background: url(../../../public/img/audio/mp_play.png) no-repeat;
      background-size: 100%;
      cursor: pointer;
    }
    .next{
      width:  0.703125rem;
      height: 0.796875rem;
      display: inline-block;
      background: url(../../../public/img/audio/mp_next.png) no-repeat;
      background-size: cover;
      cursor: pointer;
    }
    .play-list{
      width:  0.890625rem;
      height: 0.796875rem;
      display: inline-block;
      background: url(../../../public/img/audio/mp_play_list.png) no-repeat;
      background-size: cover;
      cursor: pointer;
    }
  }
}

</style>