import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

 const store=new Vuex.Store({
  state: {
<<<<<<< HEAD
    message:"菜壹零_吃面忘了要馍"
=======
    // message:"菜壹零_吃面忘了要馍"
>>>>>>> lrl
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