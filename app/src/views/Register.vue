<template>
  <div class="vh-100 d-flex justify-content-center align-items-center">
    <form @submit.prevent="submit" class="card p-5" ref="register">
      <h1 class="card-title d-flex justify-content-center">Register</h1>
      <div class="mb-3">
        <label for="username" class="form-label">Username</label>
        <input type="text" class="form-control" :class="{'is-invalid': isValid('username')}" id="username" name="username" placeholder="username">
        <div v-if="isValid('username')" class="invalid-feedback">
          {{ errors.username }}
        </div>
      </div>
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
      <div class="mb-3">
        <label for="password2" class="form-label">Re-password</label>
        <input type="password" class="form-control" :class="{'is-invalid': isValid('password2')}" id="password2" name="password2" placeholder="password">
        <div v-if="isValid('password2')" class="invalid-feedback">
          {{ errors.password2 }}
        </div>
      </div>
      <router-link to="/login" class="mb-3">Already have an account? Login here</router-link>
      <button class="btn btn-success">Register</button>
    </form>
  </div>
</template>

<script>
  import { mapActions } from "vuex";
  export default {
    name: 'Register',
    data() {
      return {
        errors: null
      };
    },
    methods: {
      ...mapActions(["Register"]),
      async submit() {
        try {
          console.log(this.$refs.register)
          let res = await this.Register(this.$refs.register);
          console.log('res',res)
          if (typeof res !== 'undefined') {
            this.errors = res
            console.log(this.errors)
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