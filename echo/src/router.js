import Vue from 'vue'
import Router from 'vue-router'
import Login from './views/Login.vue'
import Task from './views/Task.vue'
// 首页
import Index from './views/Index'
// 首页下的频道
import IndexChannel from './views/IndexChannel'
Vue.use(Router)

export default new Router({
  routes: [
    {path:'/login',component:Login},
    {path:'/task',component:Task},
    {path:"/Index",component:Index},
    // 首页下的频道
    {path:"/Index/channel",component: IndexChannel}
  ]
})
