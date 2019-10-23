<template>
    <div class="container">
        <div class="top">
            <div class="topp">
                <img src="../../public/img/PersonalPage/back_gray.png" alt="">
            </div>
            <div class="topmid">
                <span>我喜欢的</span>
            </div>
        </div>
        <ul class="topbar">
            <li>
                <router-link to="">回声</router-link>
            </li>
            <li>
                <router-link to="">活动内容</router-link>
            </li>
            <li>
                <router-link to="">专题</router-link>
            </li>
        </ul>
        <div class="topbar2">
            <img src="../../public/img/PersonalPage/short_play_like_red.png">
            <div class="randomplay">
                <img src="../../public/img/PersonalPage/mp_ramdom.png">
                <span>随机播放</span>
            </div>
        </div>
        <div>
            <img src="../../public/img/index/song1.png">
            <div class="rightOfImg">
                <span>Thinking 'Bout You</span>
                <span>Ms_-A</span>
            </div>
            <span>
                ...
            </span>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            selected:"1",
            list:[
                name="回声"
            ]
        }
    }
}
</script>
<style scoped>
    .top{
        display: flex;
        padding: 10px;
    }
    .top img{
        width: 10px;
    }
    .topmid{
        width:100%;
        display: flex;
        justify-content: center;
        font-size: 14px;
        color: #000;
    }
    .topbar{
        height: 40px;
        display: flex;
        justify-content: space-around;
        align-items: center;
        background: #ccc;
    }
    .topbar li a{
        color: #666;
        text-decoration: none;
    }
    .topbar li a:hover{
        color: #000;
    }
    .topbar2{
        height: 40px;
        display: flex;  
        justify-content:space-between;
        align-items: center;
        border:1px solid #ccc;
    }
    .topbar2>img{
        margin-left: 40px;
        width:15px;
    }
    .randomplay{
        padding-top: 3px;
        width: 35%;
        height:20px;
        border: 1px solid #ccc;
        border-top-left-radius: 10px;
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
        border-top-right-radius: 10px;
        margin-right: 20px;
    }
    .randomplay img{
        width: 20px;
        height: 10px;
    }
    .randomplay span{
        color: #ccc;
        margin-left: 2px;
    }
</style>