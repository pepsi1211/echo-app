<template>
  <div>
    <!-- 头部导航栏 -->
    <nav-bar>
      <h3 slot="h3">频道</h3>
      <!-- 搜索加音乐 -->
      <div class="right" slot="div">
        <i></i>
        <i></i>
      </div>
    </nav-bar>
    <!-- v-touch组件 -->
    <v-touch @panstart="panstart" @panmove="panmove" @panend="panend" >
      <ul style="overflow:hidden;" :style="marginLeft">
          <transition name="tag" v-for="(item,i) of list" :key="i" >
           
              <li @click="clickTag(i)" :data-active="i">
              <router-link to="" :class="active==i?'active':''">
              {{item}}
            </router-link>
            </li>
            
        </transition>
      </ul>
    </v-touch>
    <!-- 1.订阅 -->
    <!-- <channel-take></channel-take> -->
    <!-- 2.最热 -->
    <!-- <channel-hot></channel-hot> -->
    <!-- 3.最新 -->
    <!-- <channel-new></channel-new> -->
    <component :is="componentId[active]"></component>
  </div>
</template>
<script>
// 引入头部导航栏
import NavBar from '../index/NavBar'
// 1.引入订阅
import ChannelTake from './channel/Channel-take'
// 2.引入最热
import ChannelHot from './channel/Channel-hot'
// 3.引入最新
import ChannelNew from './channel/Channel-new'

export default {
  data() {
   return{
     list:["订阅","最热","最新","3D听觉","原创与翻唱","音乐类型","情绪","风格","音乐场景","二次元","自然白噪","电台","影视原声","搞怪","原创","翻唱","echo星歌手"],
     active:0,
     move:0,
     marginLeft:{marginLeft:0},
    // 保存当前访问组件
    componentId:["channel-take","channel-hot","channel-new"],
    
   }
  },
  methods: {
    // 切换菜单
    changeTan(i){
      this.curIndex = i;
    },
    clickTag(i){
      // 改变样式
      this.active = i;
      // 改变选择组件
    },
    // 移动开始
    panstart(e){
      
    console.log(this.screenWidth);
    },
    // 移动中
    panmove(e){
      // 移动距离
      var move = parseInt(e.deltaX) + this.move;
      // 左边不能超出范围
      move>0&&(move=0); 
      // 右边不能超出范围
      move<-(1217-375)&&(move=-(1217-375));
      console.log(move);
      // console.log(e.deltaX);
      // console.log(move);
      this.marginLeft.marginLeft = move + 'px';
      console.log("移动中");
    },
    // 移动结束
    panend(e){
      this.move += e.deltaX;
      // 判断移动结束时，超出范围，自动校正
      this.move>0&&(this.move=0);
      this.move<-(1217-375)&&(this.move=-(1217-375));
      console.log("移动结束");
    },
  },
  watch: {
  
  },
  computed: {
  
  },
  components: {
    "channel-take":ChannelTake,
    "channel-hot": ChannelHot,
    "channel-new": ChannelNew,
    "nav-bar": NavBar,
    
  },
  created() {
  
  },
  mouted() {
  
  }
}
</script>
<style scoped lang='scss'>
  ul{
    display: flex;
    
    // overflow: hidden;
    li{
      white-space: nowrap;
      padding: 8px;
      background: #f3f3f3;;
      a{
        color: #888;
        text-decoration: none;
        padding: .25rem .625rem;
      }
     a.active{
      border-radius: .9375rem;
      background: #fff;
      color: #8fdf8f;
      }
    }
  }
  // 动画:点击标签时，背景短暂变色，然后恢复
  // .tag-enter-active{
  //   animation: fade-in .8s;
  // }
  // // 声明动画
  // @keyframes fade-in{
  //   0%{background:red}
  //   100%{background:#fff}
  // }
</style>