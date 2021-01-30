<template>
  <div class="container py-5" v-if="hasdata">
    <div class="card mb-3">
      <div class="row g-0">
        <div class="col-md-4">
          <favorite_heart class="heart" :movie="movie"/>
          <img :src="getposter" v-if="getposter.length > 0" alt="" >
          <div v-if="getposter.length === 0" class="d-flex justify-content-center align-items-center">no image found</div>
        </div>
        <div class="col-md-8 d-flex flex-column py-3">
          <div class="card-body">
            <h2 class="card-title">{{ movie.title }} </h2>
            <p class="card-text"><b>original title: </b> {{ movie.original_title }}</p>
            <p class="card-text"><b>run time: </b> {{ movie.runtime }} min</p>
            <p class="card-text"><b>description: </b> {{ getdescripion}}</p>
            <p class="card-text"><b>adult: </b> {{ movie.adult === 1 }}</p>
            <p class="card-text">
              <b>genres: </b>
              <span v-for="(genre,key) in movie.genres" :key="key">
                {{ genre.name }}<span v-if="key !== movie.genres.length - 1">, </span>
              </span>
            </p>
          </div>
          <div class="d-flex">
            <rating_system :movie="movie"/>
            <div v-if="!isAuthenticated" class="text-muted ps-2">
              Login in to rate or favor the movie
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="d-flex flex-column align-self-start">
      <h1>actors: </h1>
      <span class="d-flex persons" v-if="movie.actors.length > 0">
        <Personcard
            :person="person"
            v-for="(person,key) in movie.actors"
            :styling="personStyling"
            :key="key"
            class="mx-2 person"
        />
      </span>
      <span v-else>no actors found</span>
    </div>
  </div>
</template>

<script>
import {mapGetters, mapActions} from 'vuex'
import favorite_heart from "@/components/favorite_heart";
import rating_system from "@/components/rating_system";
import Personcard from "@/components/Personcard";

    export default {
      name: 'ShowMovie',
      data() {
        return {
          poster: '',
          personStyling: {
            'min-width': '200px',
          }
        }
      },
      components: {
        favorite_heart,
        rating_system,
        Personcard
      },
      computed: {
        ...mapGetters(['getdata','hasdata','isAuthenticated']),
        movie(){
          return this.getdata[0]
        },
        getposter() {
          return this.movie.poster_path.length > 0 ? "https://image.tmdb.org/t/p/w342" + this.movie.poster_path : this.poster
        },
        getdescripion() {
          let description = this.movie.description;
          if (description.length > 120){
            description = description.slice(0,400) + '...'
          }
          return description
        }
      },
      methods: {
        ...mapActions(['getMovie'])
      },
      async created() {
        await this.getMovie(this.$route.params.key)
      },
    }
</script>

<style scoped>
.card {
  background-color: #1A4343;
}
p {
  margin-bottom: 6px;
}
.heart {
  position: absolute;
  top: 0;
  right: 0;
  margin: 20px 20px;
}
.persons {
  overflow-x: scroll;
}
</style>
