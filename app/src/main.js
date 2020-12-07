import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

createApp(App).use(store).use(router).mount('#app')

fetch( store.getters.getApiPath+'movie')
    .then((res) => res.json())
    .then((data) => {
        console.log(data);
        store.commit('setMovies', data.movies)
    })