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
        <!-- filter -->
<!--        <div class="d-flex">-->
<!--          <p style="font-size: 33px" class="m-0 mr-4">Sort on:</p>-->
<!--          <div class="form-check form-check-inline">-->
<!--            <input style="margin-top: 4.8px" class="form-check-input" type="checkbox" id="inlineCheckbox1" value="MostPopular">-->
<!--            <label class="form-check-label" for="inlineCheckbox1">Most Popular</label>-->
<!--          </div>-->
<!--          <div class="form-check form-check-inline">-->
<!--            <input style="margin-top: 4.8px" class="form-check-input" type="checkbox" id="inlineCheckbox2" value="MostPopular">-->
<!--            <label class="form-check-label" for="inlineCheckbox2">2</label>-->
<!--          </div> -->
<!--        </div>-->
        <!-- search -->
        <searchbar />
      </div>
      <!--  Movies  -->
      <div v-if="hasdata" class="container d-flex flex-wrap justify-content-lg-around">
        <MovieCard v-for="(movie, key) in getdata"
                   :key="key"
                   :movie="movie"
                   :id="key"
        />
      </div>
      <div v-if="hasdata" class="d-flex">
        <button @click.prevent="viewMore" class="btn btn-success mr-3">view more</button>
      </div>
      <div v-if="!hasdata">
        <h1>No movies has been found</h1>
      </div>
    </div>
  </div>
</template>

<script>
  import MovieCard from '@/components/MovieCard';
  import searchbar from "@/components/searchbar";
  import {mapActions, mapGetters} from 'vuex'

  export default {
    name: 'movies',
    data() {
      return {}
    },
    components: {
      MovieCard,
      searchbar
    },
    computed: {
      ...mapGetters(['getdata', 'hasdata', 'getlanding','page']),
    },
    methods: {
      ...mapActions(['getMovies', 'searchMovie','viewMore']),
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
.btn-success {
  border-color: #66988C;
  background-color: #66988C;
}
.btn-success:hover {
  border-color: #66988C;
  background: none;
}
</style>
