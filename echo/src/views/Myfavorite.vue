<template>
    <div class="container">
        <div class="top">
            <div class="topp">
                <button class="tlbtn" @click="back">
                    <img src="../../public/img/PersonalPage/back_gray.png" alt="">
                </button>         
            </div>
            <div class="topmid">
                <span>我喜欢的</span>
            </div>
        </div>
        <ul class="topbar" @click="change">
            <li>
                <mt-button :class="active=='tap1'?'show':''" data-i="tap1">回声</mt-button>
            </li>
            <li>
                <mt-button :class="active=='tap2'?'show':''" data-i="tap2">活动内容</mt-button>
            </li>
            <li>
                <mt-button :class="active=='tap3'?'show':''" data-i="tap3">专题</mt-button>
            </li>
        </ul>
        <!-- <div class="topbar2">
            <img src="../../public/img/PersonalPage/short_play_like_red.png">
            <div class="randomplay">
                <img src="../../public/img/PersonalPage/mp_ramdom.png">
                <span>随机播放</span>
            </div>
        </div>
        <div class="songlist" v-for="(item,index) of slists" :key="index">
            <div class="songlistImg">
                <img :src="item.spic">
            </div>
            <div class="right">
                <div class="rightOfImg">
                    <span>{{item.stitle}}</span>
                    <span>{{item.singer}}</span>
                </div>
                <span class="extra">...</span>
            </div>
        </div> -->
        <mt-tab-container v-model="active">
        <mt-tab-container-item id="tap1">
        <div class="topbar2">
            <img src="../../public/img/PersonalPage/short_play_like_red.png">
            <div class="randomplay">
                <img src="../../public/img/PersonalPage/mp_ramdom.png">
                <span>随机播放</span>
            </div>
        </div>
        <div class="songlist" v-for="(item,index) of slists" :key="index">
            <div class="songlistImg">
                <img :src="item.spic">
            </div>
            <div class="right">
                <div class="rightOfImg">
                    <span>{{item.stitle}}</span>
                    <span>{{item.singer}}</span>
                </div>
                <span class="extra">...</span>
            </div>
        </div>
        </mt-tab-container-item>
        <mt-tab-container-item id="tap2">
            <div class="topbar2">
            <img src="../../public/img/PersonalPage/short_play_like_red.png">        
        </div>
        </mt-tab-container-item>
        <mt-tab-container-item id="tap3">
            <div class="topbar2">
            <img src="../../public/img/PersonalPage/short_play_like_red.png">
        </div>
        </mt-tab-container-item>
        </mt-tab-container>
    </div>
</template>
<script>
export default {
    data(){
        return {
            slists:[
                {
                spic:require('../../public/img/index/song1.png'),
                singer:"阳台哪个唱歌的詹哈哈",
                stitle:"雨和钢琴的相遇是天意"
                },
                {
                spic:require('../../public/img/index/song1.png'),
                singer:"阳台哪个唱歌的詹哈哈",
                stitle:"雨和钢琴的相遇是天意"
                },
            ],
            fcolor:{show:false},
            active:"tap1"
        }
    },
    methods: {
        back(){
            this.$router.push('/PersonalPage')
        },
        change(e){
            var i=e.target.dataset.i
            console.log(e.target.nodeName) 
            if(e.target.nodeName=='BUTTON'){
                if(i){
                    this.active=i
                }           
            }
        }
    },
}
</script>
<style scoped>
    .tlbtn{
        padding-top: 3px;
        background: transparent;
        border:0;
        outline: none;
    }
    .show{
        color: #000 !important;
    }
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
        font-size: 16px;
        color: #000;
        padding-right: 10px;
    }
    .topbar{
        height: 40px;
        display: flex;
        justify-content: space-around;
        align-items: center;
        background: #ccc;
    }
    .topbar li{
        width: 100%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .topbar li a{
        width:60px;
        color: #666;
        text-decoration: none;
    }
    /* .topbar li a:hover{
        color: #000;
    } */
    .topbar2{
        height: 40px;
        display: flex;  
        justify-content:space-between;
        align-items: center;
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
    .songlist{
        display:flex;
        height: 70px;;
    }
    .songlist .songlistImg{
        width: 50px;
        padding: 10px;
    }
    .songlist .extra{
        display: flex;
        align-self: center;
        font-size: 20px;
        margin-right: 20px;
    }
    .songlist span{
        display: flex;
        font-size: 16px;
    }
    .songlist img{
        width:100%;
    }
    .songlist .right{
        width:78%;
        display: flex;
        justify-content: space-between;
        border-bottom:1px solid #ccc;
    }
    .songlist .rightOfImg{
        width:100%;
        display:flex;
        flex-direction: column;
        justify-content: center;
    }
    .mint-button--normal{
        width:100%;
        font-size: 14px;
        background: transparent;
    }
    .mint-button:not(.is-disabled):active::after{
        opacity: 0;
    }
</style>