<template>
  <div class="vh-100 d-flex justify-content-center align-items-center">
    <form class="card p-5 " @submit.prevent="submit" ref="login">
      <h1 class="card-title d-flex justify-content-center">Login</h1>
      <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="text" class="form-control" :class="{'is-invalid': isValid('email')}" id="email" name="email" placeholder="email">
        <div v-if="isValid('email')" class="invalid-feedback">
          {{ errors.email }}
        </div>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" :class="{'is-invalid': isValid('password')}" id="password" name="password" placeholder="password">
        <div v-if="isValid('password')" class="invalid-feedback">
          {{ errors.password }}
        </div>
      </div>
      <router-link to="/register" class="mb-3">don't have an account? create one here</router-link>
      <button type="submit" class="btn btn-success">Login</button>
    </form>
  </div>
</template>

<script>
  import { mapActions } from "vuex";
  export default {
    name: 'Login',
    data() {
      return {
        errors: null
      };
    },
    methods: {
      ...mapActions(["LogIn"]),
      async submit() {
        try {
          let res = await this.LogIn(this.$refs.login);
          if (typeof res !== 'undefined') {
            this.errors = res
          } else this.errors = null
        } catch (error) {
          console.log(error)
        }
      },
      isValid(key) {
        if (this.errors !== null) {
          console.log(this.errors[key])
          return typeof this.errors[key] !== 'undefined'
        }
      },
    },
  }
</script>

<style scoped>
  .card {
    background-color: #1A4343;
    border: none;
    border-radius: 5%;
  }
</style>