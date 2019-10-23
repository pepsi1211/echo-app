import Vue from 'vue'
import Router from 'vue-router'
import Login from './views/Login.vue'
import PersonalPage from './views/PersonalPage'
import PersonalTb from './views/PersonalTb'
import Myfavorite from './views/Myfavorite'
import Task from './views/Task.vue'
import TaskPurchase from './views/Task-purchase.vue'
import TaskInvitation from './views/Task-Invitation.vue'
import TaskSavings from './views/Task-savings.vue'
// 首页
import Index from './views/Index'

// 测试
// 测试播放器
import Audio from './views/test-1.vue'

// 首页下的频道
import IndexChannel from './views/IndexChannel'

Vue.use(Router)

export default new Router({
  routes: [
    {path:'/login',component:Login},
    {path:'/PersonalPage',component:PersonalPage},
    {path:'/PersonalTb',component:PersonalTb},
    {path:'/Myfavorite',component:Myfavorite},
    {path:'/task',component:Task},
    {path:"/Index",component:Index},

    // 测试
    {path:"/tasksavings",component:TaskSavings},
    {path:"/taskinvitation",component:TaskInvitation},
    {path:"/taskpurchase",component:TaskPurchase},
    {path:"/test",component:Audio},

    // 首页下的频道
    {path:"/Index/channel",component: IndexChannel}
  ]
})
