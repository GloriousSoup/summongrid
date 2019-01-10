import Vue from 'vue/dist/vue.js'
import VueRouter from 'vue-router'

//Start up Vue
const routes = [
    { path: '/' }
]

const router = new VueRouter({
    routes // short for routes: routes
})
  
  //temporarily pass dummy data in, but we can actually get away with {}. Actually should make sure fayetransit loads first.
window.vue_app = new Vue({
    router,
    el: '#app',
    data: {
        message: 'Hello Vue!'
    }
}) //The #app div contains <router-view></router-view> which triggers everything
  