<template>
    <div>
        <div class="top">
            <div class="topp">
                <img src="../../public/img/PersonalPage/back_white.png">     
            </div>
            <div class="topRight">
                <img class="topRight1" src="../../public/img/PersonalPage/ic_action_more_white.png">
                <img class="topRight2" src="../../public/img/PersonalPage/ic_music_details_disk_white.png">
            </div>
        </div>
    </div>
</template>
<script>
export default {
    
}
</script>
<style scoped>
    .top{
        display: flex;
        padding: 10px;
        background: #000;
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