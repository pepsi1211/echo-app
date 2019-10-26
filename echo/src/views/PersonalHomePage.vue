<template>
    <div>
        <div class="parent">
            <!-- 头 -->
            <div class="top">
                <div class="topp">
                    <img src="../../public/img/PersonalPage/back_white.png">     
                </div>
                <div class="topRight">
                    <img class="topRight1" src="../../public/img/PersonalPage/ic_action_more_white.png">
                    <img class="topRight2" src="../../public/img/PersonalPage/ic_music_details_disk_white.png">
                </div>
            </div>
            <!-- 图片 -->
            <div class="mypic">
                <img src="../../public/img/PersonalPage/mypic.jpg">
            </div>
            <div class="mypicp">
                <img src="../../public/img/PersonalPage/mypic.jpg">
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
                <span>编辑资料</span>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {

        }
    }
}
</script>
<style scoped>
    .compile{
        width:70px;
        height:30px;
        line-height: 30px;
        /* border: 1px solid #ccc; */
        border-top-left-radius: 14px;
        border-top-right-radius: 14px;
        border-bottom-left-radius: 14px;
        border-bottom-right-radius: 14px;
        background: rgb(224, 223, 223);
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
</style>