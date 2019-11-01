<template>
    <div>
        <mt-search v-model="value">
            <mt-cell autofocus="true" :value="value"></mt-cell>
        </mt-search>
    </div>
</template>
<script>
export default {
    data(){
        return {
            value:""
        }
    },

}
</script>
<style scoped>
    .mint-searchbar{
        background-color:#fff !important;
    }
    .mint-searchbar-cancel{
        color: aquamarine !important;
    }
</style>