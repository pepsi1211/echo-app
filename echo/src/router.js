import Vue from 'vue'
import Router from 'vue-router'
//个人
import Login from './views/Login.vue'
import PersonalPage from './views/PersonalPage'
import PersonalTb from './views/PersonalTb'
import Myfavorite from './views/Myfavorite'
import PersonalHomePage from './views/PersonalHomePage'
import Task from './views/Task.vue'
// 首页
import Index from './views/Index'
// 测试
import Index_songs from './components/index/Index_songs'

Vue.use(Router)

export default new Router({
  routes: [
    {path:'/login',component:Login},
    {path:'/PersonalPage',component:PersonalPage},
    {path:'/PersonalTb',component:PersonalTb},
    {path:'/Myfavorite',component:Myfavorite},
    {path:'/PersonalHomePage',component:PersonalHomePage},
    {path:'/task',component:Task},
    {path:"/Index",component:Index},
    // 测试
    {path:"/Index_songs",component:Index_songs},
  ]
})
