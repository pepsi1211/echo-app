<template>
  <div>
    <!-- 回声 -->
    <banner :color="color">
      <span>名人</span>
    </banner>
    <!-- 列表 -->
    <div class="list">
      <div class="item" v-for="(item,i) of list" :key="i">
        <!-- 左 -->
        <i class="icon"></i>
        <!-- 右 -->
        <div class="item-right">
          <div class="singer-msg">
            <!-- 第一 -->
            <span class="first" v-if="!i">
              <i></i>
              <small>TOP&nbsp;1</small>
            </span>
            <!-- 其它 -->
            <span class="second" v-else>0{{i+1}}</span>
            <!-- 名字 -->
            <span class="singer">{{item.singer}}</span>
            <small class="text">{{item.text}}</small>
          </div>
          <div class="fans">
            <span>{{item.fans}}万</span>
            <small>关注者</small>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
// 引入banner
import Banner from './Banner'
export default {
  data() {
   return{
     color:"#76da7e,#8fe799",
   }
  },
  methods: {
    
  },
  watch: {
    
  },
  components: {
    "banner": Banner,
  },
  props: ['list'],
  computed: {
    
  },
  created() {
    
  },
  mounted() {
    
  },
  updated() {
    
  },
  destroyed() {
    
  }
}
</script>
<style scoped lang='scss'>
  .list{
    padding: .375rem .5rem 1.5625rem 1.125rem;
    .item{
      display: flex;
      justify-content: space-between;
      height: 5.3125rem;
      .icon{
        display: inline-block;
        width:5rem;
        height:5rem;
        background: url(../../../public/img/index/jay.jpg);
        background-repeat:no-repeat;
        background-size: contain;
        vertical-align: middle;
      }
      // 右边部分
      .item-right{
        width: 76%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        // 歌手信息
        .singer-msg{
          display: flex;
          flex-direction: column;
          align-items: flex-start;
          justify-content: space-between;
          height:3.75rem;
          // 第一的样式
          .first{
            i{
              display: inline-block;
              width:1.125rem;
              height:1.125rem;
              background: url(../../../public/img/index/crown.jpg);
              background-repeat:no-repeat;
              background-size: contain;
              vertical-align: middle;
            }
            // top1的颜色
            small{
              margin-left: .125rem;
              color: #4bcc4c;
            }
          }
          // 其它样式
          .second{
            color:#585657;
          }
          .singer{
            font-weight: 700;
          }
          .text{
            color: #817f80;
          }
        }
        // 粉丝
        .fans{
          display: flex;
          flex-direction: column;
          padding-right: .375rem;
          span{
            color: #78cb78;
          }
          small{
            color:#d0d0d0;
          }
        }
      }
    }
  }
</style>