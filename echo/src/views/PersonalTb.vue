<template>
    <div class="headPage">
        <div class="headLeft">
            <img :src="leftImg">
        </div>
        <span>{{midMsg}}</span>
        <div class="headRight">
            <router-link to="/PersonalSearch">
                <img :src="rightFimg">
            </router-link>
            <img :src="rightSimg">
        </div>
    </div>
</template>
<script>
export default {
    name:"TitleBar",
    props:{
        midMsg:"",
        leftImg:"",
        rightFimg:"",
        rightSimg:""
    }
}
</script>
<style scoped>
    .headPage{
        width: 100%;
        height: 28px;
        display: flex;
        position: fixed;
        top:0;
        justify-content: space-between;
        z-index: 999;
        align-items: center;
        font-size: 16px;
        padding:7px;
        background-color: #fff;
        border: none;
        color: #000;
    }
    .headPage span{
        margin-top: 5px;
    }
    .headPage .headLeft{
        height: 28px;
        width: 25%;
    }
    .headPage .headLeft img{
        height: 28px;
        display: flex;
        flex-direction: column;
    }
    .headPage .headRight{
        display: flex;
        justify-content: space-around;
        width: 25%;
        height: 28px;
        padding-right: 7px;
    }
    .headPage .headRight img{
        height: 28px;
    }
</style>