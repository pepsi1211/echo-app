import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

 const store=new Vuex.Store({
  state: {
    message:"介绍一下自己"
  },
  mutations: {
    setIntro(message){
      
    }
  },
  actions: {

  }
})
export default store