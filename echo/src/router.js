import Vue from 'vue'
import Router from 'vue-router'
import Login from './views/Login.vue'
import PersonalPage from './views/PersonalPage'
import PersonalInfo from './views/PersonalInfo'
import Task from './views/Task.vue'
import TaskPurchase from './views/Task-purchase.vue'
import TaskInvitation from './views/Task-Invitation.vue'
// 首页
import Index from './views/Index'
// 测试
import Index_songs from './components/index/Index_songs'
// 测试播放器
import Audio from './views/test-1.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {path:'/login',component:Login},
    {path:'/PersonalPage',component:PersonalPage},
    {path:'/PersonalInfo',component:PersonalInfo},
    {path:'/task',component:Task},
    {path:"/Index",component:Index},
    
    // 测试
    {path:"/taskinvitation",component:TaskInvitation},
    {path:"/taskpurchase",component:TaskPurchase},
    {path:"/Index_songs",component:Index_songs},
    {path:"/test",component:Audio},
  ]
})
