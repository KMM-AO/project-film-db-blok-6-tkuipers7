import axios from 'axios';
import router from "@/router";

const state = {
    user: null,
    favorites: [],
    rated: [],
};

const getters = {
    isAuthenticated: state => !!state.user,
    StateUser: state => state.user,

    hasFavorites: state => state.favorites.length > 0,
    getFavorites: state => state.favorites,

    hasRated: state => state.rated.length > 0,
    getRated: state => state.rated,
};

const actions = {
    async Register({commit}, form) {
        let res = await axios.post('user/register', new FormData(form))
        if (res.data.success) {
            await commit('setuser', {username: res.data.user_name, token: res.data.token})
            await router.push('/')
        } else {
            return res.data
        }
    },
    async LogIn({commit}, form) {
        let res = await axios.post('user/login', new FormData(form))
        if (res.data.success) {
            await commit('setuser', {username: res.data.user_name, token: res.data.token})
            await commit('setFavorites',res.data.favorites)
            await commit('setRated',res.data.rated)
            await router.push('/')
        } else {
            return res.data.errors
        }
    },
    async LogOut({state,commit}){
        let userdata = new FormData()
        userdata.append('token', state.user.token)
        await axios.post('user/logout', userdata)
        commit('logout')
        await router.push('/')
    },
    async addFavorite({commit,getters}, movie) {
        let formdata = new FormData()
        formdata.append('token',getters.StateUser.token)
        try {
            let res = await axios.post(`user/addFavorite/${movie.id}`,formdata)
            if (res.data.success) {
                await commit('addfavorite', res.data.movie)
            }
            return res.data.success
        } catch (e) {
            console.log(e)
            return false;
        }
    },
    async delFavorite({commit,getters}, movie) {
        let formdata = new FormData()
        formdata.append('token',getters.StateUser.token)
        try {
            let res = await axios.post(`user/delFavorite/${movie.id}`,formdata)
            if (res.data.success) {
                await commit('delfavorite', movie)
            }
            return res.data.success
        } catch (e) {
            console.log(e)
            return false;
        }
    },
    async addRating({commit,getters}, payload) {
        let formdata = new FormData()
        formdata.append('token',getters.StateUser.token)
        try {
            let res = await axios.post(`user/addRating/${payload.movie.id}/${payload.rating}`,formdata)
            if (res.data.success) {
                await commit('addrated', res.data.movie)
            }
            return res.data.success
        } catch (e) {
            console.log(e)
            return false;
        }
    },
    async delRating({commit,getters}, movie) {
        let formdata = new FormData()
        formdata.append('token',getters.StateUser.token)
        try {
            let res = await axios.post(`user/delRating/${movie.id}`,formdata)
            if (res.data.success) {
                await commit('delrated', movie)
            }
            return true
        } catch (e) {
            console.log(e)
            return false;
        }
    }
};

const mutations = {
    setuser(state, user) {
        state.user = user
    },
    logout(state) {
        state.user = null
        state.favorites = []
        state.rated = []
    },
    addfavorite(state, movie) {
        state.favorites.push(movie)

    },
    delfavorite(state, movie) {
        state.favorites = state.favorites.filter(obj => {
            return obj.id !== movie.id
        })
    },
    setFavorites(state, favorites) {
        state.favorites = favorites
    },

    addrated(state, movie) {
        let key
        let res = state.rated.find((obj,current_key) => {
            key = current_key
            return obj.id === movie.id
        })
        if(typeof res !== "undefined") {
            state.rated[key] = movie
        }else {
            state.rated.push(movie)
        }
    },
    delrated(state, movie) {
        state.rated = state.rated.filter(obj => obj.id !== movie.id)
    },
    setRated(state, rated) {
        state.rated = rated
    }
};

export default {
    state,
    getters,
    actions,
    mutations
};