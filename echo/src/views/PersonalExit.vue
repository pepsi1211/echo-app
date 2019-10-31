<template>
    <div class="pageTabbar">
        <div class="page-scroll">
            <!-- head -->
            <!-- 3.调用子组件 -->
            <PersonalTb
            midMsg="设置" 
            :leftImg="require('../../public/img/PersonalPage/black_arrow_back.png')"
            ></PersonalTb>
            <!-- 帐号 -->
            <div class="parent">
                <span>账号</span>
            </div>
            <!-- 帐号与绑定设置 -->
            <PersonalList msg="帐号与绑定设置" :img="require('../../public/img/PersonalPage/gray_left_arrow.png')"></PersonalList>
            <!-- 实名认证 -->
            <div class="realName">
                <div>
                    <div>
                        <span class="rnchk1">实名认证</span>
                        <img src="../../public/img/PersonalPage/ic_description_gary.png">
                    </div>
                    <div>
                        <span class="rnchk2">您需要去使命认证才可以用上传作品</span>
                    </div>
                    <div>
                        <span class="rnchk3">去认证</span>
                    </div>
                </div>
            </div>
            <!-- 隐私通知 -->
            <div class="parent1">
                <span>隐私和通知</span>
            </div>
            <!-- 动态隐私设置 -->
            <PersonalList msg="动态隐私设置" :img="require('../../public/img/PersonalPage/gray_left_arrow.png')"></PersonalList>
            <!-- 通知 -->
            <PersonalList msg="通知" :img="require('../../public/img/PersonalPage/gray_left_arrow.png')"></PersonalList>
            <!-- 系统 -->
            <div class="parent1">
                <span>系统</span>
            </div>
            <!-- 录像视频设置 -->
            <PersonalList msg="录像视频设置" :img="require('../../public/img/PersonalPage/gray_left_arrow.png')"></PersonalList>
            <!-- 清除缓存 -->
            <div class="focus">
                <div>
                    <span>清除缓存</span>
                </div>
                <div>
                    <span>0.00MB</span>
                    <img class="focus2" src="../../public/img/PersonalPage/gray_left_arrow.png">
                </div>
            </div>
            <!-- 疑问与常见问题 -->
            <PersonalList msg="疑问与常见问题" :img="require('../../public/img/PersonalPage/gray_left_arrow.png')"></PersonalList>
            <!-- 版本说明 -->
            <PersonalList msg="版本说明" :img="require('../../public/img/PersonalPage/gray_left_arrow.png')"></PersonalList>
            <!-- 关于我们 -->
            <PersonalList msg="关于我们" :img="require('../../public/img/PersonalPage/gray_left_arrow.png')"></PersonalList>
            <div class="switch">
                <div @click="logout">
                    <p>登出</p>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
//1.引入子组件
import PersonalTb from "./PersonalTb"
import PersonalList from "./PersonalList"
import Axios from "axios"
//2.注册子组件
export default {
    data(){
        return {
        }
    },
    methods: {
        logout(){
            var url="logout"
            Axios.get(url).then(res=>{
                console.log(res)
                this.$router.push("/login")
            })
        }
    },
    components:{
        PersonalTb,
        PersonalList
    },
}
</script>
<style scoped>
    .realName{
        height: 100%;
        padding: 13px;
    }
    .realName>div{
        padding: 5px;
        background: #f1f1f1;
        border-radius: 5px;
        text-align: left;
        padding-left: 20px;
    }
    .realName>div>div>img{
        width: 15px;
        margin-left: 3px;
    }
    .realName>div>div{
        padding: 5px;
    }
    .realName>div>div>.rnchk1{
        color: #000;
        font-size: 18px;
        font-weight: bold;
    }
    .realName>div>div>.rnchk2{
        color: #000;
        font-size: 14px;
    }
    .realName>div>div>.rnchk3{
        width:20%;
        display: block;
        color: #000;
        font-size: 14px;
        background:rgb(69, 206, 99);
        color:#fff;
        padding: 3px;
        padding-left: 15px;
        padding-right: 15px;
        text-align: center;
        border-radius: 3px;
    }
    .cc{
        background: #ccc;
        opacity: .5;
    }
    .pageTabbar{
        overflow: hidden;
    }
    .pageScroll{
        overflow: auto;
    }
    .parent{
        width:100%;
        display: flex;
        justify-content: space-between;
        background-color: #f1f1f1;
        margin-top:34px;
        padding: 6px;
        color: #666;
        padding-left: 10px;
    }
    .parent1{
        width:100%;
        display: flex;
        justify-content: space-between;
        background-color: #e8e8e8;
        padding: 6px;
        color: #666;
        padding-left: 10px;
    }
    /* 通用样式 */
    .focus{
        display: flex;
        justify-content: space-between;
        padding: 10px;
        color: #000;
        border:1px solid #f1f1f1;
    }
    .focus div{
        display: flex;
        align-items: center;
    }
    .focus div .focus1{
        margin-right: 8px;
        width: 20px;
    }
    .focus div .focus2{
        margin-right: 8px;
        margin-left: 8px;
        width: 8px;
    }
    .switch{
        background:#f1f1f1;
        padding: 26px;
    }
    .switch div{
        height:25px;
        background: rgb(240, 141, 141);
        color:#fff;
        line-height: 25px;
        padding: 10px;
        font-size: 14px;
    }
    a{
        text-decoration: none;
    }
</style>