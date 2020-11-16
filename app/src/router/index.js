import Vue from 'vue'
import Router from 'vue-router'
import home from '../components/Home.vue'
import show_movie from "../components/ShowMovie";

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/',
      name: 'home',
      component: home
    },
    {
      path: '/movie/:id',
      name: 'movie',
      component: show_movie
    }
  ]
})
