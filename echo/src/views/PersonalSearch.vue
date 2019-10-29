<template>
    <div>
        <mt-search
  v-model="value"
  cancel-text="取消"
  placeholder="搜索">
        </mt-search>
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
    .mint-searchbar{
        background-color:#fff !important;
    }
    .mint-searchbar-cancel{
        color: aquamarine !important;
    }
</style>