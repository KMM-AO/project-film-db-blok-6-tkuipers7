<template>
  <div class="vh-100 d-flex justify-content-center align-items-center">
    <form class="card p-5 " @submit.prevent="submit" ref="login">
      <h1 class="card-title d-flex justify-content-center">Login</h1>
      <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="text" class="form-control" :class="{'is-invalid': isValid}" id="email" name="email" placeholder="email">
        <div v-if="isValid" class="invalid-feedback">
          {{ errors.form }}
        </div>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" :class="{'is-invalid': isValid}" id="password" name="password" placeholder="password">
        <div v-if="isValid" class="invalid-feedback">
          {{ errors.form }}
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
        errors: false
      };
    },
    computed: {
      isValid() {
        return typeof this.errors['form'] !== 'undefined'
      },
    },
    methods: {
      ...mapActions(["LogIn"]),
      async submit() {
        try {
          let res = await this.LogIn(this.$refs.login);
          if (typeof res !== 'undefined') {
            this.errors = res
          } else this.errors = false
        } catch (error) {
          console.log(error)
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