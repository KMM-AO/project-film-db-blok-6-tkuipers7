import { createStore } from 'vuex'
import createPersistedState from "vuex-persistedstate";
import Cookies from 'js-cookie';

import user from './modules/user'
import data from './modules/data'

const cookies = createPersistedState({
      paths: ["user"],
      storage: {
        getItem: key => Cookies.get(key),
        setItem: (key, value) => Cookies.set(key, value, { expires: 1, secure: false }),
        removeItem: key => Cookies.remove(key)
      }
    }
);

export default createStore({
  state: {
      landings: [],
      defaultLanding: {
          landingtitle: 'Our favorite',
          backdrop: {
              background: 'url(' + require('@/assets/home_backdrop.png') + ') rgba(0,0,0,0.65)'
          },
          title: 'Six Underground',
          description: 'After his fake death, a wealthy technology pioneer recruits an international team to take down a cruel dictator on a brave and bloody mission.'
      }
  },
  mutations: {
  },
  getters: {
      getlanding (state){
          if (state.landings.length <= 0){
              state.landings.push(state.defaultLanding)
          }
          return state.landings
      },
  },
  actions: {
  },
  modules: {
    user,
    data
  },
  plugins: [cookies],
})
