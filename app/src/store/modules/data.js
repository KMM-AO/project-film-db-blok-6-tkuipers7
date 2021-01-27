import axios from 'axios';
import router from '@/router'

const state = {
    data: [],
    page: {
        step: 6,
        end: 6,
    },
    lastCall: '',
};

const getters = {
    getdata: state => state.data,
    hasdata: state => state.data.length > 0,
    getlastCall: state => state.lastCall,
    page: state => state.page,
};

const actions = {
    async axiosGET({commit},url) {
        try {
            let res = await axios.get(url)
            await commit('setLastCall',url)
            if (res.data.status.success) {
                commit('setData',res.data.response)
            } else {
                commit('setData', [])
            }
        } catch (e) {
            console.log('error: ',e)
        }
    },

    getMovies({dispatch},total) {
        dispatch('axiosGET',`movies/${total}`)
    },

    getMovie({dispatch}, key) {
        dispatch('axiosGET',`movie/${key}`)
    },

    getPersons({dispatch},total) {
        dispatch('axiosGET', `persons/${total}`)
    },

    getPerson({dispatch}, key) {
        dispatch('axiosGET', `person/${key}`)
    },

    async search({dispatch,getters,commit}, input){
        await commit('resetPage')
        let currentRoute = router.currentRoute.value.name.toLowerCase()
        if (input.input.length > 0) {
            if (typeof input.selected !== "undefined") {
                await dispatch('axiosGET', `${input.page}/search/${input.selected}/${input.input}/${getters.page.end}`)
            }
            else {
                await dispatch('axiosGET', `${input.page}/search/${input.input}`)
            }
        } else if (currentRoute === 'movies') {
            dispatch('getMovies', getters.page.step)
        } else if (currentRoute === 'persons') {
            dispatch('getPersons',getters.page.step)
        }
    },

    async viewMore({getters, dispatch}) {
        if (getters.getlastCall.length > 0 && getters.page.end <= getters.getdata.length) {
            getters.page.end += getters.page.step
            let url = await getters.getlastCall.replace(/\/[0-9]+$/, "/") + getters.page.end;
            await dispatch('axiosGET', url)
        }
    }
};

const mutations = {
    setData(state, data) {
        state.data = data
    },
    setLastCall(state, url) {
        state.lastCall = url
    },
    resetPage: state => state.page.end = state.page.step,
};

export default {
    state,
    getters,
    actions,
    mutations
};