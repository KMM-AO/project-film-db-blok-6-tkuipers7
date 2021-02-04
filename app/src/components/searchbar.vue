<template>
  <form class="d-flex" @submit.prevent="beforeSearch">
    <input type="text" class="form-control" placeholder="Search"  aria-label="Text input" v-model="form.input">
    <select class="form-select w-50" aria-label="Default select example" ref="select" v-model="form.selected" >
      <option value="movies" :hidden="hideMovie">Movie</option>
      <option value="actor">Actor</option>
      <option value="director">Director</option>
    </select>
    <button type="submit" class="form-btn btn btn-success">Search</button>
  </form>
</template>

<script>
import {mapActions} from 'vuex'
export default {
  name: 'search',
  data(){
    return {
      form: {
        selected: '',
        input: '',
        page: this.$route.name.toLowerCase()
      }
    }
  },
  computed: {
    hideMovie (){
      return this.form.page !== 'movies'
    },
  },
  methods: {
    ...mapActions(['search']),
    async beforeSearch(){
        this.form.selected = this.form.selected === "undefined" ? 'movies' : this.form.selected
      await this.search(this.form)
    }
  },
  async created(){
    await this.$refs
    let select = this.$refs.select
    let match = this.$route.name
    if (this.$route.name.toLowerCase() === 'persons') {
      match = 'actor'
    }
    select.options.forEach((record, key) => {
      if (record.value.toLowerCase() === match.toLowerCase()) {
        select.selectedIndex = key
      }
    })
    if (select.selectedIndex === -1) {
      select.selectedIndex = 0
    }
    this.form.selected = select.options[select.selectedIndex].value
  },
}
</script>

<style scoped>
.form-control{
  border-top-right-radius: 0 !important;
  border-bottom-right-radius: 0 !important;
}
.form-select {
  border-right: none;
  border-radius: 0;
}
.form-btn {
  border-bottom-left-radius: 0 !important;
  border-top-left-radius: 0 !important;
  border: #66988C;
  background-color: #66988C;
}
</style>
