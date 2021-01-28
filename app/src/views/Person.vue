<template>
  <div class="container d-flex justify-content-center align-items-center vh-100 " v-if="hasdata">
    <div class="card mb-3">
      <div class="row g-0">
        <div class="col-md-4">
          <img :src="getposter" v-if="getposter.length > 0" alt="" >
          <div v-if="getposter.length === 0" class="d-flex justify-content-center h-100 align-items-center">no image found</div>
        </div>
        <div class="col-md-8 d-flex flex-column py-3">
          <div class="card-body">
            <h2 class="card-title">{{ person.name }}</h2>
            <p class="card-text"><b>Name: </b> {{ person.name }}</p>
            <p class="card-text"><b>Biography: </b> {{ getbiography }}</p>
            <p class="card-text"><b>Gender: </b> {{ person.gender }}</p>
            <p class="card-text"><b>Birthday: </b> {{ person.date_of_birth }}</p>
            <p class="card-text" v-if="person.date_of_death.length > 0"><b>date of death: </b> {{ person.date_of_death }}</p>
            <p class="card-text"><b>Born in: </b> {{ person.place_of_birth }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {mapGetters, mapActions} from 'vuex'
export default {
  name: 'Person',
  data() {
    return {
      poster: '',
    }
  },
  computed: {
    ...mapGetters(['getdata','hasdata']),
    person(){
      console.log(this.getdata[0])
      return this.getdata[0]
    },
    getposter() {
      return this.person.profile_path.length > 0 ? "https://image.tmdb.org/t/p/w342" + this.person.profile_path : this.poster
    },
    getbiography() {
      let biography = this.person.biography;
      if (biography.length > 120){
       biography = biography.slice(0,400) + '...'

      }
      return biography
    }
  },
  methods: {
    ...mapActions(['getPerson']),
    toPerson(id){
      this.$router.push(`person/${id}`)
    },
  },
  async created() {
    await this.getPerson(this.$route.params.key)
  }
}
</script>

<style scoped>
.card {
  background-color: #1A4343;
  min-width: 95%;
}
p {
  margin-bottom: 6px;
}
</style>
