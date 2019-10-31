<template>
    <div>
        <mt-header title="简介" style="color:#666;">
            <div class="line"></div>
            <router-link to="/PersonalSetting" slot="left">
                <mt-button icon="back"></mt-button>
            </router-link>
            <mt-button slot="right" @click="handleFinish()">完成</mt-button>
        </mt-header>
        <mt-field placeholder="请输入简介" type="textarea" rows="7" v-model="message"></mt-field>
    </div>
</template>
<script>
export default {
    data(){
        return {
        }
    },
    methods: {
        handleFinish(){
            this.$router.push("/PersonalHomePage")
        }
    },
    computed: {
        message:{
            get(){
                return this.$store.state.message
            },
            set(){
                this.$store.state.message=this.message
            }
        }
    },
}
</script>
<style scoped>
        .mint-header{
        background-color: #fff;
    }
    a{
        text-decoration: none;
    }
    .mint-header{
        height: 50px;
        border-bottom: .75rem solid #e8e8e8;
    }
</style>