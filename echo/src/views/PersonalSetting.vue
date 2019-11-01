<template>
    <div>
        <mt-header title="个人信息" style="color:#666;width:100%;">
            <router-link to="" slot="left" >
                <mt-button icon="back" @click="settingConfirm"></mt-button>
            </router-link>
            <mt-button slot="right" @click="handleFinish">提交</mt-button>
        </mt-header>
        <ul class="introduce">
            <li @click="getPic">
                <div class="item">
                    <img src="../../public/img/PersonalPage/img_loading_placeholder_round.png">
                    <p class="avatar-text">编辑头像</p>
                </div>
                <div class="chose">   
                    <!-- <img src="../../public/img/PersonalPage/gray_left_arrow.png"> -->
                    <em></em>
                </div>                    
            </li>
            <mt-actionsheet
            :actions="data"
            v-model="sheetVisible3">
            </mt-actionsheet>
            <li>
                <div class="item">
                    <span>昵称</span>
                    <input type="text" v-model="uname">
                </div>
            </li>
            <li @click="setSex">
                <div class="item">
                    <p>
                        <span>性别</span><span class="msgColor">{{sex}}</span>
                    </p>
                </div>
                 <vuePickers :data="pickData1"
                @cancel="cancel1"
                @confirm="confirm1"
                :showToolbar="true"
                :maskClick="true"
                :visible.sync="pickerVisible1"
                />
            </li>
            <li>
                <div class="item">
                    <span>城市</span>
                    <input type="text" v-model="city">
                </div>
            </li>
            <li @click="setXz">
                <div class="item">
                    <p>
                        <span>星座</span><span class="msgColor">{{xz}}</span>
                    </p>
                </div>
                <!-- 3.调用 -->
                <vuePickers :data="pickData"
                @cancel="cancel"
                @confirm="confirm"
                :showToolbar="true"
                :maskClick="true"
                :visible.sync="pickerVisible"
                />
            </li>
            <li @click="setIntroduce">
                <div class="item">
                    <p>
                        <span>简介</span>{{message}}
                    </p>
                </div>
            </li>
        </ul>  
    </div>
</template>
<script>
//1.引入
import Axios from "axios"
import vuePickers from "vue-pickers"
import qs from "qs"
export default {
    //2.注册
    components: { vuePickers },
    data(){
        let tdata = []
        let list =["天蝎座","天秤座","水瓶座","双子座","天蝎座","摩羯座","处女座","白羊座","金牛座","射手座","双鱼座","狮子座"]
        for (let i = 0; i < list.length; i++) {
            tdata.push({
            label: `${list[i]}`,
            value: list[i]
            })
        }
        let tdata1 = []
        let list1 =["男","女"]
        for (let i = 0; i < list1.length; i++) {
            tdata1.push({
            label: `${list1[i]}`,
            value: list1[i]
            })
        }
        return {
            pickerVisible: false,
            pickData: [ tdata ],
            pickerVisible1: false,
            pickData1: [ tdata1 ],
            result: '',
            gender:"",
            message:"",
            uname:"",
            sex:"",
            city:'',
            xz:"",
            avatar:"",
            data:[
                {name:"拍照",method:this.getPic},
                {name:"从相册中选择",method:this.getAlbum},
                ],
            sheetVisible3:false,
            files:""
        }
    },
    methods:{
        setXz(){
            this.pickerVisible=true;
        },
        setSex(){
            this.pickerVisible1=true;
        },
        //性别
        cancel1 () {
            console.log('cancel')
            this.result = 'click cancel result: null'
        },
        confirm1 (res1) {  
            this.sex=res1[0].label
            console.log(res1[0].label)
        },
        //星座
        cancel () {
            console.log('cancel')
            this.result = 'click cancel result: null'
        },
        confirm (res) {  
            this.xz=res[0].label
            console.log(res[0].label)
        },
        getPic(){
            this.sheetVisible3=true;
        },
        handleFinish(){
            // this.commit();
            this.$router.push("/PersonalHomePage")
        },
        setIntroduce(){
            this.$router.push("/PersonalIntroduce")
        },
        //封装的ajax更新请求
        commit:function(){
            var url="update";
                    var obj={
                        uname:this.uname,
                        gender:this.sex=="男"?1:0,
                        city:this.city,
                        xz:this.xz,
                        introduction:this.message
                    }
                    console.log(qs.stringify(obj))
                    Axios.post(url,qs.stringify(obj)).then(res=>{
                        console.log(res)
                    })
                    this.$router.push("/PersonalHomePage")
        },
        //返回是否保存数据
        settingConfirm(){
            this.$messagebox.confirm("",{
                title:"提示",
                message:"是否保存编辑信息",
                showCanclButton:true,
                confirmButtonText:"确认",
                cancelButtonText:"取消",
            }).then(action=>{
                if(action=="confirm"){
                    this.commit()
                }
            }).catch(err=>{
                if(err=="cancel"){
                    this.$router.push("/PersonalHomePage")
                }
            })
        }
    },
    created() {
        //获取数据
        var url="getPersonPage"
        Axios.get(url).then(res=>{
            var {uname,avatar,xz,gender,city,friend,followed,following,introduction}=res.data.dataUser[0]
            this.uname=uname
            this.xz=xz
            this.sex=gender==1?"男":"女"
            this.city=city
            this.message=introduction
        })
    },
}
</script>
<style scoped>
    .msgColor{
        color:#585858;
    }
    .introduce{
        height: 100% !important;
        display: flex;
        flex-direction: column;
        justify-content: center;
        width: 100%;
        height: 3rem;
        text-align: left;
        font-size: .75rem;
        color: #c6c6c6;
        }
    .introduce li{
        display: flex;
        align-items: center;
        padding: .55rem .55rem .55rem .5rem;
        justify-content: space-between;
        border-bottom: 1px solid #f3f1f1;
    }
    .introduce li .item{
        /* margin-left: 30px; */
        /* border-bottom: 1px solid #ccc; */
        display: flex;
        align-items: center;
    }
    .introduce li .item .avatar-text{
        margin-left: 0.95rem;
    }
    .introduce li .item p span{
        margin-right:3.025rem;
    }
    .introduce li .chose em{
        /* width: 10px !important; */
        width:.5rem;
        height:.875rem;
        display: inline-block;
        background: url(../../public/img/PersonalPage/gray_left_arrow.png) no-repeat;
        background-size: 100%
    }
    .introduce input{
        caret-color:#6ed56c;
        margin-left: 3.125rem;
        border: none;
        outline: none;
    }
    .introduce img{
        width: 50px;
        margin-left: 1.25rem;
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