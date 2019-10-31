<template>
    <!-- 设置-通用 -->
    <div class="focus">
        <div>
            <span>{{msg}}</span>
        </div>
        <div>
            <img class="focus2" :src="img">
        </div>
    </div>
</template>
<script>
export default {
    props:{
        msg:"",
        img:""
    }
}
</script>
<style scoped>
.focus{
        display: flex;
        justify-content: space-between;
        padding: 10px;
        color: #000;
        border:1px solid #f1f0f0;
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
        width: 8px;
    }
</style>>
    
</style>