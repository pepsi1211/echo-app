<template>
  <main class="audio">
    <img src="../../../public/img/audio/『3D环绕』房东的猫 「云烟成雨」.jpg" class="audio-pic" />
    <audio ref="player">
      <source src="../../../public/img/audio/『3D环绕』房东的猫 「云烟成雨」.mp3" type="audio/mpeg" />
    </audio>
    <div class="sound">
      <div class="progress">
        <em class="duration">{{dTime}}</em>
        <div class="progress-bar" ref="progressBar" @click="movePlay">
          <span ref="progressSpan" draggable="true"></span>
        </div>
        <em class="total">{{cTime}}</em>
      </div>
      <div class="controls">
        <em class="play-mode"></em>
        <em class="prev"></em>
        <em :class="now==false ? 'play' : 'pause' " @click="doPlay"></em>
        <em class="next"></em>
        <em class="play-list"></em>
      </div>
    </div>
  </main>
</template>
<script>
export default {
  data() {
    return {
      dTime: "00:00",
      cTime: "00:00",
      now: false
    };
  },
  mounted() {
    let music = this.$refs.player; // 音频所在的对象
    // console.log(music);
    let progressSpan = this.$refs.progressSpan; // 颜色进度条对象
    let progressBarWidth = this.$refs.progressBar.offsetWidth; // 底部灰色进度条总宽度

    // 在加载音频的时候执行的函数
    music.addEventListener("canplay", function() {
      let totalTime = music.duration; // 获得总时长
      let min = Math.floor(totalTime / 60); // 计算总时长的分钟数
      let s = Math.ceil(totalTime % 60); // 计算总时长余下的秒数
      // 以四种方式来决定显示的总时长
      if (min < 10 && s < 10) {
        this.dTime = `0${min}:0${s}`;
      } else if (min < 10) {
        this.dTime = `0${min}:${s}`;
      } else if (s < 10) {
        this.dTime = `${min}:0${s}`;
      } else {
        this.dTime = `${min}:${s}`;
      }
    });

    // 音频在播放的时候执行的函数
    music.addEventListener("timeupdate", function() {
      let totalTime = music.duration; // 获得总时长
      let playTime = music.currentTime; // 获得已播放时长
      progressSpan.style.width = `${(playTime / totalTime) * 100}%`; // 让带颜色的进度条宽度随着歌曲已播放时长变化
      console.log(totalTime, playTime);
      // 下面是使得进度条左边时间跟随已播放时间一起变化
      let min = Math.floor(playTime / 60);
      let s = Math.floor(playTime % 60);
      console.log(min, s);
      // 以四种方式来决定显示的已播放时长
      if (min < 10 && s < 10) {
        this.cTime = `0${min}:0${s}`;
      } else if (min < 10) {
        this.cTime = `0${min}:${s}`;
      } else if (s < 10) {
        this.cTime = `${min}:0${s}`;
      } else {
        this.cTime = `${min}:${s}`;
      }
    });

    // 监听颜色进度条是否被触摸拖动
    progressSpan.addEventListener("touchmove", function(e) {
      let tar = e.targetTouches[0].pageX; // 获取触摸拖动的距离
      console.log(tar);
      progressSpan.style.width = `${(tar / progressBarWidth) * 100}%`;
    });

    // 监听颜色进度条是否结束拖动
    progressSpan.addEventListener("touchend", function() {
      let moveDistance = progressSpan.offsetWidth / progressBarWidth; // 进度条所在的比例
      music.currentTime = music.duration * moveDistance;
      console.log(music.currentTime);
      music.play(); // 根据计算后的时间 播放音乐
      this.now = true; // 改变播放按钮的状态
    });
  },
  created() {},
  methods: {
    // 点击进度条事件
    movePlay(e) {
      let music = this.$refs.player; // 音频所在对象
      let progressBarWidth = e.pageX / this.$refs.progressBar.offsetWidth; // 计算点击位置相对父元素总宽的比例
      this.$refs.progressSpan.style.width = `${progressBarWidth * 100}%`; // 进度条应所在的比例总宽
      music.currentTime = music.duration * progressBarWidth; // 计算点击时应播放所在的时间
      music.play(); // 播放音频
      this.now = true; // 更改播放暂停按钮为播放
    },
    // 点击播放暂停按钮时间
    doPlay () {
      this.now = !this.now // 更改播放暂停按钮状态
      let music = this.$refs.player // 音频所在对象
      if (this.now==false) {
        music.play() // 播放音乐
      } else {
        music.pause() // 暂停音乐
      }
    },
  },
  watch: {},
  computed: {}
};
</script>
<style lang="scss">
.audio {
  .audio-pic {
    width: 100%;
  }
}

.sound {
  width: 100%;
  height: 5.75rem;
  position: fixed;
  bottom: 0;
  background: #f4f4f4;
  // box-shadow: 0 0 5px rgba(0,0,0,.5);
  border-top: 0.0075rem solid #999;
  .progress {
    width: 100%;
    height: 1.75rem;
    margin: 0.75rem 0;
    display: flex;
    justify-content: space-around;
    align-items: center;
    .durantion,
    .total {
      color: #666;
      font-size: 14px;
      font-family: "simhei";
    }
    .progress-bar {
      width: 70%;
      height: 0.085rem;
      background: rgba(51, 51, 51, 0.8);
      position: relative;
      span {
        height: 100%;
        background: #6ed56c;
        position: absolute;
        left: 0;
        &:after {
          content: "";
          display: inline-block;
          width: 0.703125rem;
          height: 0.703125rem;
          background: url(../../../public/img/audio/echo_seek_thumb.png);
          background-size: 100%;
          position: absolute;
          top: -0.3rem;
          right: -0.255rem;
        }
      }
    }
  }
  .controls {
    width: 100%;
    display: flex;
    justify-content: space-around;
    align-items: center;
    .play-mode {
      display: inline-block;
      width: 0.890625rem;
      height: 0.796875rem;
      background: url(../../../public/img/audio/mp_loop.png) no-repeat;
      background-size: cover;
      cursor: pointer;
    }
    .prev {
      width: 0.703125rem;
      height: 0.796875rem;
      display: inline-block;
      background: url(../../../public/img/audio/mp_pre.png) no-repeat;
      background-size: cover;
      cursor: pointer;
    }
    .pause {
      width: 1.03125rem;
      height: 1.265625rem;
      display: inline-block;
      background: url(../../../public/img/audio/mp_pause.png) no-repeat;
      background-size: 100%;
      cursor: pointer;
    }
    .play {
      width: 1.03125rem;
      height: 1.265625rem;
      display: inline-block;
      background: url(../../../public/img/audio/mp_play.png) no-repeat;
      background-size: 100%;
      cursor: pointer;
    }
    .next {
      width: 0.703125rem;
      height: 0.796875rem;
      display: inline-block;
      background: url(../../../public/img/audio/mp_next.png) no-repeat;
      background-size: cover;
      cursor: pointer;
    }
    .play-list {
      width: 0.890625rem;
      height: 0.796875rem;
      display: inline-block;
      background: url(../../../public/img/audio/mp_play_list.png) no-repeat;
      background-size: cover;
      cursor: pointer;
    }
  }
}
</style>