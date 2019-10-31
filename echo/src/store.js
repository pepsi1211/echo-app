import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

 const store=new Vuex.Store({
  state: {
<<<<<<< HEAD
    message:"介绍一下自己"
=======
    message:"菜壹零_吃面忘了要馍"
  },
  getters:{
    getMessage(state){
      return state.message
    }
>>>>>>> lrl
  },
  mutations: {
    setMessage(state,name){
      state.message=name;
    }
  },
  actions: {
    setMessageName({commit,state},name){
      commit("setMessage,name")
    }
  }
})
export default store