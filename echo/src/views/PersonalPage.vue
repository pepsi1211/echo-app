<template>
    <div class="pageTabbar">
        <div class="page-scroll">
            <!-- head -->
            <!-- 3.调用子组件 -->
            <PersonalTb
            midMsg="我的" 
            :leftImg="require('../../public/img/PersonalPage/ic_circle_black.png')"
            :rightFimg="require('../../public/img/PersonalPage/search.png')"
            :rightSimg="require('../../public/img/PersonalPage/disk.png')"></PersonalTb>
            <!-- 个人信息 -->
            <div class="parent">
                <div class="pLeft">
                    <img src="../../public/img/PersonalPage/disk.png" alt="">
                    <ul class="leftInfo">
                        <li>
                            <router-link to="" class="leftInfo1">吃忘了要馍</router-link>
                            <p class="leftInfo2">11&nbsp;人访问过我的主页</p>
                            <p class="leftInfo3">echo ID: 23413445</p>  
                        </li>
                    </ul>                   
                </div>
                <div class="pRight">
                    <div>
                        <span>个人主页</span>
                    </div>
                    <div>
                        <img src="../../public/img/PersonalPage/gray_left_arrow.png">
                    </div>
                </div>
            </div>
            <!-- 喜欢关注 -->
            <ul class="like">
                <li>
                    <div>
                        <p>0</p>
                        <router-link to="" class="likecolor">我喜欢的</router-link>
                    </div>
                </li>
                <li>
                    <div>
                        <p>0</p>
                        <router-link to="" class="likecolor">离线回声</router-link>
                    </div>
                </li> 
                <li>
                    <div>
                        <p>0</p>
                        <router-link to="" class="likecolor">我关注的频道</router-link>
                    </div> 
                </li>
            </ul>
            <!-- 灰色分割线 -->
            <div class="line"></div>
            <!-- 制作 -->
            <ul class="make">
                <li>
                    <div>
                        <img src="../../public/img/PersonalPage/ic_publish_record.png">
                        <router-link to="" class="likecolor">录音制作</router-link>
                    </div>
                </li>
                <li>
                    <div>
                        <img src="../../public/img/PersonalPage/ic_publish_sound.png">
                        <router-link to="" class="likecolor">上传音频</router-link>
                    </div>
                </li>
                <li>
                    <div>
                        <img src="../../public/img/PersonalPage/ic_publish_picture.png">
                        <router-link to="" class="likecolor">发布图文</router-link>
                    </div>
                </li>
                <li>
                    <div>
                        <img src="../../public/img/PersonalPage/ic_publish_bell.png">
                        <router-link to="" class="likecolor">制作铃声</router-link>
                    </div>
                </li>
            </ul>
            <!-- 灰色分割线 -->
            <div class="line"></div>
            <!-- 功能1 -->
            <ul class="functionf" @click="change">
                <li v-for="(item,index) of list1" :key="index" :class="changec">
                    <div>
                        <!-- <img src="../../public/img/PersonalPage/ic_menu_vip.png"> -->
                        <img :src="item.img">
                        <router-link to="" class="likecolor">{{item.name}}</router-link>
                    </div>
                </li>
            </ul>
            <!-- 功能2 -->
            <ul class="functions">
                <li>
                    <div>
                        <img src="../../public/img/PersonalPage/ic_menu_coin.png">
                        <router-link to="" class="likecolor">我的金币</router-link>
                    </div>
                </li>
                <li>
                    <div>
                        <img src="../../public/img/PersonalPage/ic_menu_mall_.png">
                        <router-link to="" class="likecolor">echo商城</router-link>
                    </div>
                </li>
                <li>
                    <div>
                        <img src="../../public/img/PersonalPage/my_order.png">
                        <router-link to="" class="likecolor">我的订单</router-link>
                    </div>
                </li>
                <li>
                    <div>
                        <img src="../../public/img/PersonalPage/ic_menu_ar.png">
                        <router-link to="" class="likecolor">扫一扫</router-link>
                    </div>
                </li>
            </ul>
            <!-- 灰色分割线 -->
            <div class="line"></div>
            <!-- 关注动态 -->
            <div class="focus">
                <div>
                    <img class="focus1" src="../../public/img/PersonalPage/icon_my_center_follow.png">
                    <span>关注动态</span>
                </div>
                <div>
                    <img class="focus2" src="../../public/img/PersonalPage/gray_left_arrow.png">
                </div>
            </div>
            <!-- 灰色分割线 -->
            <div class="line"></div>
            <!-- 消息提醒 -->
            <div class="focus" style="border-bottom:1px solid #ccc;">
                <div>
                    <img class="focus1" src="../../public/img/PersonalPage/center_notification.png">
                    <span>消息提醒</span>
                </div>
                <div>
                    <img class="focus2" src="../../public/img/PersonalPage/gray_left_arrow.png">
                </div>
            </div>
            <!-- 暂无消息提醒 -->
            <div class="focus">
                <div>
                    <span>暂无新的消息提醒</span>
                </div>
            </div>
            <!-- 灰色分割线 -->
            <div class="line"></div>
            <!-- 我的乐透眼镜 -->
            <div class="focus">
                <div>
                    <img class="focus1" src="../../public/img/PersonalPage/ic_friend_circle_green.png">
                    <span>我的乐透眼镜</span>
                </div>
                <div>
                    <span>未连接</span>
                    <img class="focus2" src="../../public/img/PersonalPage/gray_left_arrow.png">
                </div>
            </div>
            <!-- 灰色分割线 -->
            <div class="line"></div>
            <!-- 我的MITC -->
            <div class="focus">
                <div>
                    <img class="focus1" src="../../public/img/PersonalPage/icon_mitc.png">
                    <span>我的MITC</span>
                </div>
                <div>
                    <span>未激活</span>
                    <img class="focus2" src="../../public/img/PersonalPage/gray_left_arrow.png">
                </div>
            </div>
            <!-- 灰色分割线 -->
            <div class="line"></div>
            <!-- 兑换券 -->
            <div class="focus">
                <div>
                    <img class="focus1" src="../../public/img/PersonalPage/ic_friend_circle_green.png">
                    <span>兑换券</span>
                </div>
                <div>
                    <img class="focus2" src="../../public/img/PersonalPage/gray_left_arrow.png">
                </div>
            </div>
            <!-- 灰色分割线 -->
            <div class="line"></div>
            <!-- 24小时客服 -->
            <div class="focus">
                <div>
                    <img class="focus1" src="../../public/img/PersonalPage/mycenter_feedback.png">
                    <span>24小时客服</span>
                </div>
            </div>
            <!-- 灰色分割线 -->
            <div class="line"></div>
            <!-- 设置 -->
            <div class="focus">
                <div>
                    <img class="focus1" src="../../public/img/PersonalPage/my_center_setting.png">
                    <span>设置</span>
                </div>
            </div>
            <div class="switch">
                <div>
                    <p>切换至旧版</p>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
//1.引入子组件
import PersonalTb from "./PersonalTb"
//2.注册子组件
export default {
    data(){
        return {
            list1:[
                {img:require('../../public/img/PersonalPage/ic_menu_vip.png'),name:"会员中心"},
                {img:require('../../public/img/PersonalPage/ic_network_flux.png'),name:"听歌免流量"},
                {img:require('../../public/img/PersonalPage/echo_famous_album_income_icon.png'),name:"我的回声"},
                {img:require('../../public/img/PersonalPage/ic_menu_wallet.png'),name:"我的钱包"},
                ],
            list2:[
                {img:require('../../public/img/PersonalPage/ic_menu_coin.png'),name:"我的金币"},
                {img:require('../../public/img/PersonalPage/ic_menu_mall_.png'),name:"echo商城"},
                {img:require('../../public/img/PersonalPage/my_order.png'),name:"我的订单"},
                {img:require('../../public/img/PersonalPage/ic_menu_ar.png'),name:"扫一扫s"},
                ],
            changec:{
                cc:false
            }   
        }
    },
    components:{
        PersonalTb
    },
    methods: {
        change(event){
            if(event.target.nodeName=="LI"){
                this.c=true;
            }
            console.log(event.target)
        }
    },
}
</script>
<style scoped>
    .cc{
        background: #ccc;
        opacity: .5;

    }
    .pageTabbar{
        overflow: hidden;
    }
    .pageScroll{
        overflow: auto;
    }
    .parent{
        width:100%;
        display: flex;
        justify-content: space-between;
        background-color: #ddd;
        margin-top:50px;
        padding: 15px;
    }
    .parent .pLeft{
        display: flex;
        align-items: center;
    }
    .parent .leftInfo{
        display: flex;
        margin-left: 10px;
    }
    .parent .leftInfo .leftInfo1{
        color: #000;
        font-size: 16px;
        padding-right: 28px;
    }
    .parent .leftInfo .leftInfo3{
        color: #666;
        font-size: 12px;
        border:1px solid #666;
    }
    .parent .pRight{
        width: 23%;
        display: flex;
        margin-top: 7px;
    }
    .parent .pRight img{
        height: 15px;
        margin-left: 5px;
    }
    .like{
        display: flex;
        justify-content: space-around;
        color:#000;
    }
    .likecolor{
        color:#666;
    }
    .line{
        width: 100%;
        height: 10px;
        background: #ccc;
    }
    /* 制作 */
    .make{
        display: flex;
        justify-content: space-around;
        margin:15px;
    }
    .make li div{
        display: flex;
        flex-direction: column;
    }
    .make li div img{
        margin-bottom: 6px;
        height: 50px;
    }
    /* 功能 */
    .functionf{
        border-bottom: 1px solid #ccc;
    }
    .functionf,.functions{
        display: flex;
        justify-content: space-around;
    }
    .functionf li,.functions li{
        display: flex;
        width: 25%;
        justify-content: center;
    }
    .functionf li div,.functions li div{
        display: flex;
        flex-direction: column;
        padding: 10px;
        align-items: center;
    }
    .functionf li div img,.functions li div img{
        width: 25px;
        margin-bottom: 4px;
    }
    .functionf li:not(:first-child),.functions li:not(:first-child){
        border-left: 1px solid #ccc;
    }
    /* 通用样式 */
    .focus{
        display: flex;
        justify-content: space-between;
        padding: 10px;
        color: #000
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
    .switch{
        background:#ccc;
        padding: 20px;
    }
    .switch div{
        height:20px;
        background: rgb(240, 141, 141);
        color:#fff;
        line-height: 20px;
        padding: 10px;
        font-size: 14px;
    }
    .a{
        text-decoration: none;
    }
</style>