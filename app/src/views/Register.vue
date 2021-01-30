<template>
  <div class="vh-100 d-flex justify-content-center align-items-center">
    <form @submit.prevent="submit" class="card p-5 " ref="register" style="max-width: 25%">
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
        <input type="text" class="form-control" :class="{'is-invalid': isValid('form')}" id="email" name="email" placeholder="email">
        <div v-if="isValid('form')" class="invalid-feedback">
          {{ errors.form }}
        </div>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Password </label>
        <div v-if="hasrequirements" class="d-flex invalid-feedback">
          {{ getrequirements }}
        </div>
        <input type="password" class="form-control" :class="{'is-invalid': isValid('form')}" id="password" name="password" placeholder="password">
        <div v-if="isValid('form')" class="invalid-feedback">
          {{ errors.form }}
        </div>
      </div>
      <div class="mb-3">
        <label for="password2" class="form-label">Re-password</label>
        <input type="password" class="form-control" :class="{'is-invalid': isValid('form')}" id="password2" name="password2" placeholder="password">
        <div v-if="isValid('form')" class="invalid-feedback">
          {{ errors.form }}
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
        errors: null,
        requirements: '',
      };
    },
    computed: {
      getrequirements() {
        return this.requirements
      },
      hasrequirements () {
        return this.requirements.length > 0
      },
    },
    methods: {
      ...mapActions(["Register"]),
      async submit() {
        try {
          console.log(this.$refs.register)
          let res = await this.Register(this.$refs.register);
          if (typeof res !== 'undefined') {
            this.errors = res.errors
            if (this.requirements.length === 0){
              this.requirements = res.password_requirements
            }
          } else {
            this.errors = null
          }
        } catch (error) {
          console.log(error)
        }
      },
      isValid(key) {
        if (this.errors !== null) {
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