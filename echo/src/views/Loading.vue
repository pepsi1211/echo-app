<template>
    <div>
        <Login></Login>
        <LoadingPage></LoadingPage>
    </div>
</template>
<script>
import Login from "./Login"
import LoadingPage from "./LoadingPage"
export default {
    data(){
        return{

        }
    },
    components:{
        Login,
        LoadingPage
    }
}
</script>