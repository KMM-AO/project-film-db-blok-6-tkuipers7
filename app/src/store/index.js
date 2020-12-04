import { createStore } from 'vuex'
import createPersistedState from "vuex-persistedstate";

export default createStore({
  state: {
    pathToApi: 'http://localhost/school/film_db_v2/api/public/',
    movies: [],
  },
  mutations: {
    setMovies (state, movies) {
      state.movies = movies
    }
  },
  getters: {
    getMovie: state => (id) => {
      return state.movies[id]
    },
    getApiPath: state =>  {
      return state.pathToApi
    }
  },
  actions: {
  },
  modules: {
  },
  plugins: [createPersistedState()],
})
