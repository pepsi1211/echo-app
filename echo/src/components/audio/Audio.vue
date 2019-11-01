<template>
 
  <main class="audio">
    <!-- <img src="../../../public/img/audio/『3D环绕』房东的猫 「云烟成雨」.jpg" class="audio-pic" /> -->
    <!-- 大背景 -->
    <div class="banner">
      <i :style="`background-image: url('${songs.song_pic}')`"></i>
    </div>
    <!-- 歌曲标题 -->
    <div class="song-name">
      <h3>{{songs.sname}}</h3>
      <div class="song-about">
        <span>
          <i></i>
          <small>喜欢{{songs.love| transform}}</small>
        </span>
        <span>
          <i></i>
          <small>离线1.3万</small>
        </span>
        <span>
          <i></i>
          <small>分享{{songs.share | transform}}</small>
        </span>
        <span>
          <i></i>
          <small>送音乐币</small>
        </span>
      </div>
    </div>
    <!-- 白线 -->
    <div class="line"></div>
    <!-- 所属频道 -->
    <div class="channer">
      <div>
        <h3>所属频道</h3>
        <span class="green">+订阅</span>
      </div>
      <div class="channer-detail">
        <i :style="`background-image: url('${channel.pic}')`"></i>
        <div>
          <h4>{{channel.cname}}</h4>
          <div class="state">
            <small>回声</small>
            <small>订阅</small>
            <small>分享</small>
            <h6>{{channel.song_count | transform}}</h6>
            <h6>{{channel.followed | transform}}</h6>
             <h6>{{channel.share | transform}}</h6>
          </div>
        </div>
      </div>
    </div>
    <div class="line"></div>
    <!-- 作者 -->
    <div class="author">
      <div class="left">
        <i :style="`background-image: url('${songs.author_pic}');`"></i>
        <span>上传者:{{songs.author}}</span>
      </div>
      <span class="green">关注</span>
    </div>
    <div class="line"></div>
    <!-- 标签 -->
    <div class="label">
      <div class="tit">
        <h4>标签</h4>
        <span class="green">添加</span>
      </div>
      <div class="btns"> 
        <button>电子<small>40886</small></button>
        <button>电子书<small>40886</small></button>
        <button>欧美<small>40886</small></button>
      </div>
      
    </div>
    <audio ref="player">
      <source :src="songs.song" type="audio/mpeg" />
    </audio>
    <div class="sound">
      <div class="progress">
        <em class="duration">{{cTime}}</em>
        <div class="progress-bar" ref="progressBar" @click="movePlay">
          <span ref="progressSpan" draggable="true">
            <em class="echo-logo"></em>
          </span>
        </div>
        <em class="total">{{dTime}}</em>
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
    }
  },
  filters:{
    transform(value){
      if(value<10000) return value;
      else{
        return value/10000 + '万';
      }
    }
  },
  props:['channel','songs'],
  mounted()   {
    let music = this.$refs.player; // 音频所在的对象
    // console.log(music);
    let progressSpan = this.$refs.progressSpan; // 颜色进度条对象
    let progressBarWidth = this.$refs.progressBar.offsetWidth; // 底部灰色进度条总宽度
    // 在加载音频的时候执行的函数
    music.addEventListener("canplay",this.durationTime);

    // 音频在播放的时候执行的函数
    music.addEventListener("timeupdate",this.currentTime);

    // 监听颜色进度条是否被触摸拖动
    progressSpan.addEventListener("touchmove", (e)=> {
      e.preventDefault();
      music.pause();
      this.now = false;
      this.isPlay()
      let tar = e.targetTouches[0].pageX-55; // 获取触摸拖动的距离
      // console.log(tar);
      progressSpan.style.width = `${(tar / progressBarWidth) * 100}%`;
      // console.log(this.now,1);
    });

    // 监听颜色进度条是否结束拖动
    progressSpan.addEventListener("touchend", function() {
      let moveDistance = progressSpan.offsetWidth / progressBarWidth; // 进度条所在的比例
      music.currentTime = music.duration * moveDistance;
      // console.log(music.currentTime);
      // console.log(this.now);
      // console.log(music);
      music.play(); // 根据计算后的时间 播放音乐
      this.now = true; // 改变播放按钮的状态
      // console.log(this.now,2);
    });

    //鼠标事件
    // progressSpan.addEventListener('drag', (e) => {
    //   const events = e.pageX;
    //   console.log(events);
    //   progressSpan.style.width = `${(events / progressBarWidth) * 100}%`
    // })
    // progressSpan.addEventListener('dragend', (e) => {
    //   const events = e.pageX
    //   progressSpan.style.width = `${(events / progressBarWidth) * 100}%`
    //   this.movePlay()
    // })
  },
  created() {},
  methods: {
    currentTime(){
      let music = this.$refs.player; // 音频所在的对象
      let progressSpan = this.$refs.progressSpan; // 颜色进度条对象
      
      let progressBarWidth = this.$refs.progressBar.offsetWidth; // 底部灰色进度条总宽度
      
      let totalTime = music.duration; // 获得总时长
      
      let playTime = music.currentTime; // 获得已播放时长
      
      progressSpan.style.width = `${(playTime / totalTime) * 100}%`; // 让带颜色的进度条宽度随着歌曲已播放时长变化
      // console.log(totalTime, playTime);
      // 下面是使得进度条左边时间跟随已播放时间一起变化
      let min = Math.floor(playTime / 60);
      let s = Math.floor(playTime % 60);
      // console.log(min, s);
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
      // console.log(this.cTime);
    },
    durationTime(){
      let music = this.$refs.player; // 音频所在的对象
      let progressSpan = this.$refs.progressSpan; // 颜色进度条对象
      let progressBarWidth = this.$refs.progressBar.offsetWidth; // 底部灰色进度条总宽度
      let totalTime = music.duration; // 获得总时长
      let min = Math.floor(totalTime / 60); // 计算总时长的分钟数
      let s = Math.ceil(totalTime % 60); // 计算总时长余下的秒数
      // console.log(min,s);
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
    },
    // 点击进度条事件
    movePlay(e) {
      let music = this.$refs.player; // 音频所在对象
      let progressBarWidth = (e.pageX-55) / this.$refs.progressBar.offsetWidth; // 计算点击位置相对父元素总宽的比例
      // console.log(progressBarWidth);
      this.$refs.progressSpan.style.width = `${progressBarWidth * 100}%`; // 进度条应所在的比例总宽
      music.currentTime = music.duration * progressBarWidth; // 计算点击时应播放所在的时间
      // console.log(music.currentTime);
      music.play(); // 播放音频
      this.now = true; // 更改播放暂停按钮为播放
    },
    // 点击播放暂停按钮时间
    doPlay () {
      // this.now = !this.now // 更改播放暂停按钮状态
      let music = this.$refs.player // 音频所在对象
      if (this.now==false) {
        music.play(); // 播放音乐
        this.now = true;
      } else {
        music.pause(); // 暂停音乐
        this.now = false;
      }
    },
    isPlay(){
      let music = this.$refs.player;
      // console.log(1);
      // console.log(music.paused);
      if(music.paused){
        this.now = true;
      }else{
        this.now = false;
      }
    }
  },
  watch: {
    'this.cTime':function(){
      this.currentTime();
    },
    'this.now':function(){
      this.isPlay();
    }
  },
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
  bottom: --5rem;
 
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
        .echo-logo {
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
// 大背景图
.banner{
  i{
    display: inline-block;
    width: 100%;
    height: 23.4375rem;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
  }
}
// 歌名
.song-name{
  h3{
    font-size: 1rem;
  }
  .song-about{
    display: flex;
    justify-content: space-around;
    align-items: flex-start;
    padding: .5rem 0;
    span{
      display: flex;
      flex-direction: column;
      align-items: center;
      // 设置字体样式
      small{
        color:#8f8f8f;
        font-size: .75rem;
        transform: scale(.9);
      }
      // 精灵图
      i{
        display: inline-block;
        width: 2.5rem;
        height: 2.5rem;
        border-radius: 50%;
      }
      // 第一个
      &:first-child i{
        background: url(../../../public/img/index/ic_list.png) -3px 0px;
        background-size: cover;
      }
      // 第二个
      &:nth-child(2) i{
        background: url(../../../public/img/index/ic_list.png) -102px 0px;
        background-size: cover;
      }
      // 第三个
      &:nth-child(3) i{
        background: url(../../../public/img/index/ic_list.png) -203px 0px;
        background-size: cover;
      }
      // 第四个
      &:nth-child(4) i{
        background: url(../../../public/img/index/ic_list.png) -303px 0px;
        background-size: cover;
      }
    }
  }
}
// 白线
.line{
  margin: .125rem .5rem;
  height: 1px;
  background:#d1d1d1;
}
// 所属频道
.channer{
  padding: .5rem 1rem;

  div::after{
    display: block;
    content:"";
    clear: both;
  }
  // 左浮
  h3{
    float:left;
  }
  span{
    float: right;
  }
  .channer-detail{
    width: 65%;
    display: flex;
    padding: .625rem 0 .25rem 0;
    // 图片
    i{
      display: inline-block;
      width: 96px;
      height: 55px;
      background: no-repeat;
      background-size: contain;
      padding-right: .5rem;
    }
    // 回声 订阅 分享
    .state{
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      // pad、ding-left: 40px;
      width: 6.25rem;
      // 设置文字宽度
      small{
        color:#a1a1a1;
        width: 33px;
        transform: scale(.8);
      }
      h6{
        transform: scale(.8);
      }
    }
  }
}
.green{
  display: inline-block;
  color: #fff;
  width: 3.625rem;
  height: 1.375rem;
  background: #77da76;
  line-height: 1.375rem;
  border-radius: 1.125rem;
}
// 作者
.author{
  line-height: 1.875rem;
  padding: 0 1rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
  .left{
    i{
      display: inline-block;
      width: 1.625rem;
      height: 1.625rem;
      background-repeat: no-repeat;
      background-size: contain;
      vertical-align: middle;
    }
    span{
      display: inline-block;
      
      transform: scale(.9);
    }
    
  }
}
// 标签
.label{
  padding: .625rem 1rem;
  .tit{
    display: flex;
    justify-content: space-between;
  }
  .btns{
    display: flex;
    width: 70%;
    justify-content: space-between;
  }
  button{
    border: 1px solid #a5a5a5;
    border-radius: 1.125rem;
    background: transparent; 
    line-height: 1.5rem;
    padding: 0 .375rem;
    small{
      display: inline-block;
      color:#9d9d9d;
      transform: scale(.9);
    }
  }
}
</style>