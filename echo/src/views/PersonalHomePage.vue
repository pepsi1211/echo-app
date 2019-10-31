<template>
    <div>
        <div class="parent">
            <!-- 头 -->
            <div class="top">
                <div class="topp">
                    <router-link to="/PersonalPage">
                        <img src="../../public/img/PersonalPage/back_white.png">     
                    </router-link>
                </div>
                <div class="topRight">
                    <img @click="edit" class="topRight1" src="../../public/img/PersonalPage/ic_action_more_white.png">
                    <mt-actionsheet
                    :actions="editData"
                    v-model="sheetVisible2">
                    </mt-actionsheet>
                    <img class="topRight2" src="../../public/img/PersonalPage/ic_music_details_disk_white.png">
                </div>
            </div>
            <!-- 图片 -->
            <div class="mypic">
                <img @click="addPic" :src="list.avatar">
            </div>
            <mt-actionsheet
        :actions="pic1"
        v-model="sheetVisiblepic1">
        </mt-actionsheet>
            <div class="mypicp">
                <img @click="addPic" :src="list.avatar">
                <!-- <span>{{list.uname}}</span> -->
            </div>
                <span class="nam">吃面忘了要馍</span>
        </div>
        <!-- 个人资料 -->
        <div class="pdata">
            <div>
                <img class="pdatap1" src="../../public/img/PersonalPage/ic_location_male.png">
                <span>男</span>
            </div>
            <div>
                <img class="pdatap2" src="../../public/img/PersonalPage/ic_location_black.png">
                <span>未填写</span>
            </div>
        </div>
        <!-- 关注 -->
        <div class="onfocus">
            <ul class="focus">
                <li>
                    <div>
                        <span>{{list.followed}}</span>
                        <span>被关注</span>
                    </div>
                </li>
                <li>
                    <div>
                        <span>{{list.following}}</span>
                        <span>关注</span>
                    </div>
                </li>
                <li>
                    <div>
                        <span>{{list.followed}}</span>
                        <span>好友</span>
                    </div>
                </li>
            </ul>
            <div class="compile">
                <router-link to="/PersonalSetting">
                    <span>编辑资料</span>
                </router-link>
            </div>
        </div>
        <!-- 像鸡 -->
        <div class="photo" >
            <img src="../../public/img/PersonalPage/ic_take_photo_green.png" @click="selectPic">
        </div>
        <mt-actionsheet
        :actions="data"
        v-model="sheetVisible1">
        </mt-actionsheet>
        <!-- 喜欢的回声 -->
        <div class="likeMusic">
            <div>
                <i></i>
                <span>
                    喜欢的回声
                </span>
            </div>
            <div class="all">
                <span>全部</span>
                4
            </div>
        </div>
        <!-- 获取数据 -->
        <ul>
            <li>
                <div class="songlist" v-for="(item,index) of slists" :key="index">
            <div class="songlistImg">
                <img :src="item.spic">
            </div>
            <div class="right">
                <div class="rightOfImg">
                    <span>{{item.stitle}}</span>
                    <span>{{item.singer}}</span>
                </div>
            </div>
        </div>
            </li>
        </ul>
    </div>
</template>
<script>
import Axios from 'axios'
export default {
    data(){
        return {
            slists:[
                {
                spic:require('../../public/img/index/song3.png'),
                singer:"播放9w+",
                stitle:"有了你 波尔卡圆点粉色小屋才完整「Little Pink House」"
                },
                {
                spic:require('../../public/img/index/song4.png'),
                singer:"播放9w+",
                stitle:"陪伴是最长情的告白 正确把霉方式 Enchanted"
                },
                {
                spic:require('../../public/img/index/song2.png'),
                singer:"播放8w+",
                stitle:"「前奏控」一秒好心情的霓虹流行 Funky J-Pop サンキュー!!"
                },
                {
                spic:require('../../public/img/index/song1.png'),
                singer:"播放10w+",
                stitle:"10秒钟征服耳朵系列 霓虹美式R&B"
                },
            ],
            list:[],
            data:[
                {name:"拍照",method:this.getCamera},
                {name:"从相册中选择",method:this.getAlbum}
            ],
            editData:[
                {name:"编辑资料",method:this.getData},
                {name:"分享",method:this.getShare}
            ],
            pic1:[
                {name:"添加封面图片",method:""},
                {name:"添加封面音乐",method:""}
            ],
            sheetVisible1:false,
            sheetVisible2:false,
            sheetVisiblepic1:false,
        }
    },
    methods: {
        getData(){
          this.$router.push("/PersonalSetting")  
        },
        selectPic(){
            this.sheetVisible1=true
        },
        edit(){
            this.sheetVisible2=true
        },
        addPic(){
            this.sheetVisiblepic1=true
        }
    },
    created() {
        var url="getMe"
        Axios.get(url).then(res=>{
            this.list=res.data.data1[0]
            console.log(res.data)
        })
    },
}
</script>
<style scoped>
    .songlist{
        display:flex;
        height: 70px;;
        border-bottom:1px solid rgb(231, 229, 229);
    }
    .songlist .songlistImg{
        width: 60px;
        padding: 10px;

    }
    .songlist .extra{
        display: flex;
        align-self: center;
        font-size: 20px;
        margin-right: 20px;
    }
    .songlist span{
        width:290px;
        display: flex;
        display: block;
        font-size: 14px;
        overflow:hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        text-align: left;
    }
    .songlist img{
        width:100%;
    }
    .songlist .right{
        width:100%;
        display: flex;
        justify-content: space-between;
    }
    .songlist .rightOfImg{
        width:100%;
        display:flex;
        flex-direction: column;
        justify-content: center;
    }
    .likeMusic{
        display: flex;
        justify-content: space-between;
    }
    .likeMusic>div>i{
        display: inline-block;
        width: 25px;
        height: 30px;
        background: url(../../public/img/PersonalPage/channel_detail_disk.png) no-repeat;
        background-size: 100%;
    }
    .likeMusic div{
        display: flex;
        align-items: center;
        margin-left: 10px;
        margin-right: 10px;
        margin: 10px;
        font-size: 14px;
    }
    .likeMusic .all{
        color: rgb(83, 192, 156);
    }
    .likeMusic div span{
        margin-left: 8px;
        margin-right: 8px;
    }
    .photo{
        display: flex;
        border-bottom: 1px solid #ccc;
        padding-bottom: 20px;
    }
    .photo img{
        width:40px;
        margin-left: 8px;
        padding: 18px;
        background: #e8e8e8;
    }
    .compile{
        width:70px;
        height:30px;
        line-height: 30px;
        /* border: 1px solid #ccc; */
        border-top-left-radius: 14px;
        border-top-right-radius: 14px;
        border-bottom-left-radius: 14px;
        border-bottom-right-radius: 14px;
        background: #e8e8e8;
        margin-top: -12px;
        margin-right:15px;
    }
    .onfocus{
        display: flex;
        height: 80px;
        align-items: center;
        justify-content: space-between;
    }
    .focus{
        height: 50px;
        width:58%;
        display:flex;
        justify-content: space-between;
        align-items: center;
    }
    .focus li{
        height:30px;
         display: flex;
        flex-direction: column;
    }
    .focus li div{
        height: 20px;
        display: flex;
        padding-left: 26px;
        flex-direction: column;
        justify-content: center;
    }
     .focus li div:first-child{
        border-left: 1px solid #ccc;
     }
    .pdata{
        width: 100%;
        height: 60px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 14px;
        border-bottom: 1px solid #ccc;
    }
    .pdata>div{
        margin-top: 15px;
        margin-left: 15px;
        margin-right: 13px;
    }
    .pdata .pdatap1{
        width :15px;
        margin-right: 5px;
    }
    .pdata .pdatap2{
        width :10px;
        margin-right:6px; 
    }
    .parent{
        width: 100%;
        height:200px;
    }
    .mypic{
        position: relative;
        width: 100%;
        height: 200px;
        filter: blur(18px);
        overflow: hidden;
    }
    .mypic img{
        width :100%;
        height: 200px;
        
    }
    .mypicp{
     height: 100px;
     width: 100px;
     position: absolute;
     left: 50%;
     margin-left: -50px;
     top: 8%;
     border-radius: 50%;
     overflow: hidden;
     border:2px solid #fff;
    }
    .mypicp img{
        width: 100%;
        background-color: #fff;
    }
    .nam{
        position: absolute;
        top: 170px;
        left: 148px;
        color: #fff;
        font-size: 14px;
    }
    .top{
        width:100%;
        position: fixed;
        z-index: 100;
        display: flex;
        padding: 10px;
        justify-content: space-between;
    }
    .top .topp img{
        width: 10px;
    }
    .top .topRight{
        width:27%;
        display: flex;
        align-items: center;
        justify-content: space-around;
        margin-right: 15px;
    }
    .top .topRight .topRight1{
        height: 3px;
    }
    .top .topRight .topRight2{
        height: 20px;
    }
    .topmid{
        width:100%;
        display: flex;
        justify-content: center;
        font-size: 16px;
        color: #000;
        padding-right: 10px;
    }
    .tlbtn{
        padding-top: 3px;
        background: transparent;
        border:0;
        outline: none;
    }
    a{
        color:#666;
    }
</style>