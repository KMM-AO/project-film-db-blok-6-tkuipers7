<template>
  <div>
    <!--  jumbotron  -->
    <div :style="landing.backdrop" class="jumbotron d-flex flex-column justify-content-center top-0 w-100" style="background-repeat: no-repeat" v-for="(landing, key) in getlanding" :key="key" >
      <h1 style="font-size: 80px">{{landing.landingtitle}}</h1>
      <div class="pl-4">
        <h3 style="font-size: 33px">{{landing.title}}</h3>
        <p style="font-size: 20px" class="description">{{landing.description}}</p>
        <button class="readmorebtn btn btn-outline-primary btn-lg">Read more</button>
      </div>
    </div>
    <div class="container d-flex flex-column align-items-center py-4">
      <h1 style="font-size: 76px">Discover our movies</h1>
      <p style="font-size: 20px;" class="mb-0">Discover our movies or search for your favorites.</p>
      <p style="font-size: 20px;" class="mb-0">Tip: click on a movie to get more information about the movie</p>
      <!--  filter & search -->
      <div class="d-flex container justify-content-end align-items-center py-4">
        <!-- search -->
        <searchbar />
      </div>
      <!--  Movies  -->
      <div v-if="hasdata" class="container d-flex flex-wrap justify-content-around">
        <MovieCard v-for="(movie, key) in getdata"
                   :key="key"
                   :movie="movie"
        />
      </div>
      <div v-else>
        <h1>No movies has been found</h1>
      </div>
      <viewmore />
    </div>
  </div>
</template>

<script>
  import MovieCard from '@/components/Moviecard';
  import searchbar from "@/components/searchbar";
  import viewmore from "@/components/Viewmore"
  import {mapActions, mapGetters} from 'vuex'

  export default {
    name: 'movies',
    data() {
      return {}
    },
    components: {
      MovieCard,
      searchbar,
      viewmore
    },
    computed: {
      ...mapGetters(['getdata', 'hasdata', 'getlanding']),
    },
    methods: {
      ...mapActions(['viewMore']),
    }
  }
</script>

<style scoped>

.jumbotron {
  height: 100vh;
  background-size: cover;
  background-blend-mode: multiply;
  padding-left: 5rem;
}
.readmorebtn {
  width: 10rem;
  border-color: #66988C;
  color:#66988C;
}
.readmorebtn:hover {
  background-color: #66988C;
  color: white;
}
.description {
  width: 50%;
  /*padding-right: 70rem;*/
}
.form-check-label {
  font-size: 27px;
}
</style>
