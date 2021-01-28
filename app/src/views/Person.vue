<template>
  <div class="container d-flex justify-content-center align-items-center vh-100" v-if="hasdata">
    <div class="card mb-3">
      <div class="row g-0">
        <div class="col-md-4">
          <img :src="getposter" v-if="getposter.length > 0" alt="" >
          <div v-if="getposter.length === 0" class="d-flex justify-content-center h-100 align-items-center">no image found</div>
        </div>
        <div class="col-md-8 d-flex flex-column py-3">
          <div class="card-body">
            <h2 class="card-title">{{ movie.title }}</h2>
            <p class="card-text"><b>original title: </b> {{ movie.title }}</p>
            <p class="card-text"><b>run time: </b> {{ movie.runtime }} min</p>
            <p class="card-text"><b>description: </b> {{ movie.description}}</p>
            <p class="card-text"><b>adult: </b> {{ movie.adult === 1 }}</p>
            <p class="card-text">
              <b>genres: </b>
              <span v-for="(genre,key) in movie.genres" :key="key">
                {{ genre.name }}<span v-if="key !== movie.genres.length - 1">,</span>
              </span>
            </p>
            <p class="card-text">
              <b>actors: </b>
              <span  v-if="movie.actors.length > 0">
                <span v-for="(person,key) in movie.actors" :key="key">
                  <a class="link-primary" @click.prevent="toPerson(person.id)">{{ person.name }} as {{ person.character_name }}</a><span v-if="key !== movie.actors.length - 1">,</span>
                </span>
              </span>
              <span v-else>no actors found</span>
            </p>
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
      poster: ''
    }
  },
  computed: {
    ...mapGetters(['getdata','hasdata']),
    movie(){
      return this.getdata[0]
    },
    getposter() {
      return this.movie.poster_path.length > 0 ? "https://image.tmdb.org/t/p/w342" + this.movie.poster_path : this.poster
    },
  },
  methods: {
    ...mapActions(['getMovie']),
    toPerson(id){
      this.$router.push(`person/${id}`)
    }
  },
  async created() {
    await this.getMovie(this.$route.params.key)
  }
}
</script>

<style scoped>
.card {
  background-color: #1A4343;
}
p {
  margin-bottom: 6px;
}
</style>
