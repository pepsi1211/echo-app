<template>
    <div class="main-center100">
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
import Axios from "axios"
import qs from "qs"
export default {
    data(){
        return {
            message:"",
            city:"",
            followed:"",
            friend:"",
            following:"",
            gender:"",
            uname:"",
            xz:"",
        }
    },
    methods: {
        handleFinish(){
            var url="update"
            var obj={
                introduction:this.message,
                city:this.city,
                followed:this.followed,
                friend:this.friend,
                following:this.following,
                gender:this.gender,
                uname:this.uname,
                xz:this.xz,
                }
                console.log(obj)
            Axios.post(url,qs.stringify(obj)).then(res=>{
                console.log(res)
            })
            this.$router.push("/PersonalHomePage")
        }
    },
    created() {
        Axios.get("getPersonPage").then(res=>{
            this.message=res.data.dataUser[0].introduction
            this.city=res.data.dataUser[0].city,
            this.friend=res.data.dataUser[0].friend,
            this.followed=res.data.dataUser[0].followed,
            this.following=res.data.dataUser[0].following,
            this.gender=res.data.dataUser[0].gender,
            this.uname=res.data.dataUser[0].uname,
            this.xz=res.data.dataUser[0].xz,
            console.log(res.data.dataUser[0])
        })
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