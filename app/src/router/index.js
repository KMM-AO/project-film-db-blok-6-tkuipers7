import { createRouter, createWebHistory } from 'vue-router'
import movies from '@/views/Movies'
import Store from '@/store'

const routes = [
  {
    path: '/',
    name: 'Movies',
    component: movies,
    meta: {
      movies: true,
      absolute: true
    }
  },
  {
    path: '/movie/:key',
    name: 'Movie',
    component: () => import('@/views/Movie'),
  },
  {
    path: '/persons',
    name: 'Persons',
    component: () => import('@/views/Persons'),
    meta: {
      persons: true
    }
  },
  {
    path: '/person/:key',
    name: 'Person',
    component: () => import('@/views/Person')
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import('@/views/LogIn'),
    meta: {
      guest: true
    }
  },
  {
    path: '/register',
    name: 'Register',
    component: () => import('@/views/Register'),
    meta: {
      guest: true
    }
  },
  {
    path: '/favorites',
    name: 'Favorites',
    component: () => import('@/views/Favorites'),
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/rated',
    name: 'Rated',
    component: () => import('@/views/Rated'),
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/:pathMatch(.*)*',
    name: '404',
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

router.beforeEach(( to,from,next) => {
  if (to.name === '404') {
    next('/')
  } else {
    next()
  }
})

router.beforeEach(async () => {
  await Store.commit('setData', [])
  await Store.commit('resetPage')
})

router.beforeEach((to, from, next) => {
  if (to.matched.some((record) => record.meta.requiresAuth)) {
    if (Store.getters.isAuthenticated) {
      next();
      return;
    }
    next("/login");
  } else {
    next();
  }
});

router.beforeEach((to, from, next) => {
  if (to.matched.some((record) => record.meta.guest)) {
    if (Store.getters.isAuthenticated) {
      next("/");
    }
    next();
  } else {
    next();
  }
});

router.beforeEach( async ( to,from,next) => {
  if (to.matched.some((record) => record.meta.movies)) {
   await Store.dispatch('getMovies',Store.getters.page.end)
  }
  next()
})

router.beforeEach(async ( to,from,next) => {
  if (to.matched.some((record) => record.meta.persons)) {
    await Store.dispatch('getPersons',Store.getters.page.end)
  }
  next()
})

export default router;
