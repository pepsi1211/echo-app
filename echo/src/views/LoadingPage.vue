<template>
    <div class="parent">
                
        <transition mode="out-in" name="fade" >
            <div v-if="show"><img appear src="../../public/img/login/echo_loading_default.png"></div>
        </transition>
            <!-- <button @click="xiu">點擊</button> -->
    </div>
</template>
<script>
export default {
    data(){
        return {
            show:true
        }
    },
    methods: {
        loading(){
            setTimeout(() => {
                this.show=false
                // setTimeout(() => {
                    // this.$router.push("/login")
                // }, 1000);
            }, 1900);
        }
    },
    created() {
        this.loading();
    },
}
</script>
<style scoped>
    .parent img{
        height: 100%;
        width: 100%;
    }
    .fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
</style>>