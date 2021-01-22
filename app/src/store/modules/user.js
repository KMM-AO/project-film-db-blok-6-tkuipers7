import axios from 'axios';
import router from "@/router";

const state = {
    user: null,
    favorites: [],
};

const getters = {
    isAuthenticated: state => !!state.user,
    StateUser: state => state.user,

};

const actions = {
    async Register({commit}, form) {
        let res = await axios.post('user/register', new FormData(form))
        console.log(res.data.errors)
        if (res.data.success) {
            await commit('setuser', {username: res.data.user_name, token: res.data.token})
            await router.push('/')
        } else {
            return res.data.errors
        }
    },
    async LogIn({commit}, form) {
        let res = await axios.post('user/login', new FormData(form))
        if (res.data.success) {
            await commit('setuser', {username: res.data.user_name, token: res.data.token})
            router.push('/')
        } else {
            return res.data.errors
        }
    },
    async LogOut({state,commit}){
        let userdata = new FormData()
        userdata.append('token', state.user.token)
        await axios.post('user/logout', userdata)
        commit('logout')
    },
    async addFavorite({commit,getters}, movie) {
        await axios.post(`addFavorite/${movie.id}`, getters.StateUser)
        commit('addfavorite', movie)
    },
    async delFavorite({commit,getters}, movie) {
        await axios.post(`delFavorite/${movie.id}`, getters.StateUser)
        commit('delfavorite', movie)
    }
};

const mutations = {
    setuser(state, user){
        state.user = user
    },
    logout(state){
        state.user = null
        state.favorites = []
    },
    addfavorite(state, movie){
        state.favorites.push(movie)
    },
    delfavorite(state, movie){
        state.favorites = state.favorites.filter(obj => {
            return obj.id !== movie.id
        })
    },
};

export default {
    state,
    getters,
    actions,
    mutations
};