import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

 const store=new Vuex.Store({
  state: {
    message:"菜壹零_吃面忘了要馍"
  },
  getters:{
    getMessage(state){
      return state.message
    }
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