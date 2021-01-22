<template>
  <nav class="navbar navbar-expand-lg px-3 py-0 w-100" :class="{absolute: $route.meta.absolute}">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto">
          <li class="nav-item px-2">
            <router-link class="nav-link px-2" to="/">Home</router-link>
          </li>
          <li class="nav-item px-2">
            <router-link class="nav-link px-2" to="/persons">People</router-link>
          </li>
          <li v-if="isLoggedIn" class="nav-item px-2">
            <router-link class="nav-link px-2" to="/favorites">My Favorites</router-link>
          </li>
          <li v-if="isLoggedIn" class="nav-item px-2">
            <router-link class="nav-link px-2" to="/rated">My Rated</router-link>
          </li>
        </ul>

        <div v-if="isLoggedIn" class="btn-group d-flex justify-content-end">
          <span class="account-name d-flex align-items-center mr-5">
            {{ getUser.username }}
          </span>
          <img class="account-img" :src="require('@/assets/account_icon.jpg')" alt="" data-bs-toggle="dropdown" aria-expanded="false">
          <ul class="dropdown-menu dropdown-menu-end">
            <li><router-link to="/favorites" class="dropdown-item text-white">My favorite movies</router-link></li>
            <li><router-link to="/rated" class="dropdown-item text-white">My rated movies</router-link></li>
            <li class="dropdown-divider"></li>
            <li><button class="dropdown-item text-white" @click="logout" type="button">Logout</button></li>
          </ul>
        </div>
        <div v-else>
          <ul class="navbar-nav">
            <li class="nav-item px-2"><router-link class="nav-link" to="/login">Log in</router-link></li>
            <li class="nav-item px-2"><router-link class="nav-link" to="/register">Register</router-link></li>
          </ul>
        </div>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: 'Nav',
  computed: {
    isLoggedIn(){
      return this.$store.getters.isAuthenticated
    },
    getUser(){
      return this.$store.getters.StateUser
    },
  },
  methods: {
    async logout (){
      await this.$store.dispatch('LogOut')
    }
  }
}
</script>

<style scoped>
  .navbar {
    background-color: #1A2A2F
  }
  .nav-link {
    color: #66988C;
    font-size: 27px;
    cursor: pointer;
  }
  .nav-link:hover {
    background-color: #66988C;
    color: white;
  }

  .dropdown-menu {
    background-color: #1A4343;
  }
  .dropdown-divider {
    background-color: #66988C;
  }
  .dropdown-item:hover {
    background-color: #66988C;
  }
  .absolute {
    position: absolute;
  }

  .account-img {
    width: 3.5%;
    cursor: pointer;
  }
  .account-name {
    color: #66988C;
    margin-right: 20px;
    font-size: 20px;
  }
</style>