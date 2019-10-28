<template>
  <div>
    <!-- 列表 -->
    <div class="list">
      <!-- 左 -->
      <div class="item" v-for="(item,i) of list" :key="i">
        <div class="list-left">
        <i :style="`backgroundImage:url(${item.img})`"></i>
      </div>
      <!-- 右  -->
      <div class="list-right">
        <div class="con">
          <span class="float-left" v-if="!i">
          <i></i>
          TOP&nbsp;1
        </span>
        <span v-else class="float-left" style="color: #333132;">0{{i+1}}</span>
        <span class="float-right">
          <span>{{item.text}}</span>
          <i :style="`backgroundImage:url(${item.textIcon})`"></i>
        </span>
        </div>
        <p>{{item.title}}</p>
      </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
   return{}
  },
  methods: {
    
  },
  watch: {
    
  },
  components: {
    
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
    padding: .5rem .5rem .25rem .75rem;
    .item{
      border-bottom: .125rem solid #e5e5e5;
      display: flex;
      justify-content: space-between;
    }
    .list-left{
      i{
        display: inline-block;
        width:5rem;
        height:5rem;
        background-repeat:no-repeat;
        background-size: contain;
      }
    }
    .list-right{
      width: 76%;
      .con{
        &::after{
        display: block;
        content:"";
        clear:both;
        }
        .float-left{
          float:left;
          color: #e56070;
          i{
            display: inline-block;
            width:1.125rem;
            height:1.125rem;
            background: url(../../../public/img/index/crown.jpg) no-repeat;
            background-repeat:no-repeat;
            background-size: contain;
            vertical-align: middle;
          }
        }
        .float-right{
        float:right;
        span{
          color:#333132;
        }
        i{
          display: inline-block;
            width:18px;
            height:18px;
            background-repeat:no-repeat;
            background-size: contain;
            vertical-align: middle;
            margin-left: .25rem;
        }
        }
      }
      p{
        padding: .5rem 0 0;
        text-align: left;
      } 
    }
  }
</style>