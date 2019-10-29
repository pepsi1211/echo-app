<template>
    <div>
        <mt-header title="个人信息" style="color:#666;width:100%;">
            <router-link to="" slot="left" >
                <mt-button icon="back" @click="settingConfirm"></mt-button>
            </router-link>
            <mt-button slot="right" @click="handleFinish">完成</mt-button>
        </mt-header>
        <ul class="introduce">
            <li @click="getPic">
                <div class="item">
                    <img src="../../public/img/PersonalPage/img_loading_placeholder_round.png">
                    <p>编辑头像</p>
                    <mt-actionsheet
                    :actions="data"
                    v-model="sheetVisible3">
                    </mt-actionsheet>
                </div>
                <div class="chose">   
                    <img src="../../public/img/PersonalPage/gray_left_arrow.png">
                </div>
            </li>
            <li>
                <div class="item">
                    <span>昵称</span>
                    <input type="text" v-model="uname">
                </div>
            </li>
            <li>
                <div class="item">
                    <span>性别</span>
                    <input type="text" v-model="sex">
                </div>
            </li>
            <li>
                <div class="item">
                    <span>城市</span>
                    <input type="text" v-model="city">
                </div>
            </li>
            <li>
                <div class="item">
                    <span>星座</span>
                    <input type="text" v-model="constellation">
                </div>
            </li>
            <li @click="setIntroduce">
                <div class="item">
                    <p>
                        <span>简介</span>
                    {{message}}
                    </p>
                </div>
            </li>
        </ul>
    </div>
</template>
<script>
export default {
    data(){
        return {
            uname:"16620654352",
            sex:"未知",
            city:"",
            constellation:"",
            sheetVisible3:false,
            data:[
                {name:"拍照",method:this.getPic},
                {name:"从相册中选择",method:this.getAlbum},
                ]
        }
    },
    methods:{
        getPic(){
            this.sheetVisible3=true;
        },
        handleFinish(){ 
            this.$router.push("/PersonalHomePage")
        },
        setIntroduce(){
            this.$router.push("/PersonalIntroduce")
        },
        settingConfirm(){
            this.$messagebox.confirm("",{
                title:"提示",
                message:"是否保存编辑信息",
                showCanclButton:true,
                confirmButtonText:"确认",
                cancelButtonText:"取消",
            }).then(action=>{
                if(action=="confirm"){
                    this.$router.push("/PersonalHomePage")
                }
            }).catch(err=>{
                if(err=="cancel"){
                    this.$router.push("/PersonalHomePage")
                }
            })
        }
    },
    computed: {
        message(){
            return this.$store.state.message
        }
    },
}
</script>
<style scoped>
    .introduce{
        height: 100% !important;
        display: flex;
        flex-direction: column;
        justify-content: center;
        width: 100%;
        height: 3rem;
        text-align: left;
        font-size: 1rem;
        color: #666;
        }
    .introduce li{
        display: flex;
        align-items: center;
        padding: 15px;
        justify-content: space-between;
        border-bottom: 1px solid #f3f1f1;
    }
    .introduce li .item{
        margin-left: 30px;
        display: flex;
        align-items: center;
    }
    .introduce li .item p span{
        margin-right:25px;
    }
    .introduce li .chose img{
        width: 10px !important;
    }
    .introduce input{
        margin-left: 30px;
        border: none;
        outline: none;
    }
    .introduce img{
        width: 45px;
        margin-right: 10px;
    }
    .introduce a{
        color: #2c3e50;
    } 
    .mint-header{
        background-color: #fff;
    }
    a{
        text-decoration: none;
    }
</style>