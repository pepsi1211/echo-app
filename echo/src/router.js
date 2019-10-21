import Vue from 'vue'
import Router from 'vue-router'
import Login from './views/Login.vue'
import Task from './views/Task.vue'
import TaskPurchase from './views/Task-purchase.vue'
import TaskInvitation from './views/Task-Invitation.vue'
import TaskSavings from './views/Task-savings.vue'
// 首页
import Index from './views/Index'
// 测试
import Index_songs from './components/index/Index_songs'

Vue.use(Router)

export default new Router({
  routes: [
    {path:'/login',component:Login},
    {path:'/task',component:Task},
    {path:"/Index",component:Index},
    
    // 测试
    {path:"/tasksavings",component:TaskSavings},
    {path:"/taskinvitation",component:TaskInvitation},
    {path:"/taskpurchase",component:TaskPurchase},
    {path:"/Index_songs",component:Index_songs},
  ]
})
