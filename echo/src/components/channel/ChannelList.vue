<template>
  <div>
    <!-- v-touch组件 -->
    <v-touch>
      <ul>
        <li>
          <router-link to="" active-class="active">
            订阅
          </router-link>
          <router-link to="">最热</router-link>
        </li>
      </ul>
    </v-touch>
  </div>
</template>
<script>
export default {
  data() {
   return{
     list:["订阅","最热","最新","3D听觉","原创与翻唱","音乐类型","情绪","风格","音乐场景","二次元","自然白噪","电台","影视原声","搞怪","原创","翻唱","echo星歌手"],
     
   }
  },
  methods: {
  
  },
  watch: {
  
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
  ul{
    display: flex;
    background: #f3f3f3;
    // overflow: hidden;
    li{
      white-space: nowrap;
      padding: 8px;
      a{
        color: #888;
        text-decoration: none;
        
      }
     a.active{
      
      padding: 4px 10px;
      border-radius: 15px;
      background: #fff;
      color: #8fdf8f;
      }
    }
  }
</style>