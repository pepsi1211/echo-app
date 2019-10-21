import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

// 引入 mint-ui
import Mint from 'mint-ui'
// 引入mint-ui样式
import "mint-ui/lib/style.css"
// 引入 vue-touch 插件
import VueTouch from 'vue-touch'
// 使用mint-ui
Vue.use(Mint);
// 使用vue-touch插件
Vue.use(VueTouch,{name:'v-touch'});
// 设置手指滑动距离
VueTouch.config.swipe = {
  threshold: 10
}
// //引入axios模块
// import axios from "axios"
// //设置服务器基础路径
// axios.defaults.baseURL="http://127.0.0.1:8080/"
// //设置保存session信息
// axios.defaults.withCredentials=true;
// //注册axios
// Vue.prototype.axios=axios;

Vue.config.productionTip = false
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
