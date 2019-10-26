import Vue from 'vue'
import Router from 'vue-router'
//个人
import Login from './views/Login.vue'
import PersonalPage from './views/PersonalPage'
import PersonalTb from './views/PersonalTb'
import Myfavorite from './views/Myfavorite'
import PersonalHomePage from './views/PersonalHomePage'
import Task from './views/Task.vue'
import TaskPurchase from './views/Task-purchase.vue'
import TaskInvitation from './views/Task-Invitation.vue'
import TaskSavings from './views/Task-savings.vue'
import MyTask from './views/Task-myTask.vue'
import Record from './views/Task-record.vue'
import TaskRanking from './views/Task-Ranking.vue'
// 首页
import Index from './views/Index'
// 首页下的频道
import IndexChannel from './views/IndexChannel'
// 首页下的排行
import Ranking from './views/Ranking'
// 首页下的铃声
// 测试
// 测试播放器
import Audio from './views/test-1.vue'



Vue.use(Router)

export default new Router({
  routes: [
    {path:"/Taskranking",component:TaskRanking},
    {path:'/login',component:Login},
    {path:'/PersonalPage',component:PersonalPage},
    {path:'/PersonalTb',component:PersonalTb},
    {path:'/Myfavorite',component:Myfavorite},
    {path:'/PersonalHomePage',component:PersonalHomePage},
    {path:'/task',component:Task},
    {path:"/Index",component:Index},

    // 测试
    {path:"/TaskRecord",component:Record},
    {path:"/mytask",component:MyTask},
    {path:"/tasksavings",component:TaskSavings},
    {path:"/taskinvitation",component:TaskInvitation},
    {path:"/taskpurchase",component:TaskPurchase},
    {path:"/test",component:Audio},

    // 首页下的频道
    {path:"/Index/channel",component: IndexChannel},
    // 首页下的排行
    {path:"/Index/ranking",component:Ranking}
  ]
})
