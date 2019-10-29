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
                <img @click="addPic" src="../../public/img/PersonalPage/mypic.jpg">
            </div>
            <mt-actionsheet
        :actions="pic1"
        v-model="sheetVisiblepic1">
        </mt-actionsheet>
            <div class="mypicp">
                <img @click="addPic" src="../../public/img/PersonalPage/mypic.jpg">
                <span>吃面忘了要馍</span>
            </div>
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
                        <span>0</span>
                        <span>被关注</span>
                    </div>
                </li>
                <li>
                    <div>
                        <span>0</span>
                        <span>关注</span>
                    </div>
                </li>
                <li>
                    <div>
                        <span>0</span>
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
    </div>
</template>
<script>
export default {
    data(){
        return {
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
                {name:"添加封面影月音乐",method:""}
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
}
</script>
<style scoped>
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
    .mypicp span{
        position: absolute;
        color: #fff;
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
        width: 15px;
    }
    .top .topRight{
        width:27%;
        display: flex;
        align-items: center;
        justify-content: space-around;
        margin-right: 15px;
    }
    .top .topRight .topRight1{
        height: 5px;
    }
    .top .topRight .topRight2{
        height: 30px;
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