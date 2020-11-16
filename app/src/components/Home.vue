<template>
  <div class="m-2">
    <div class="d-flex flex-wrap">
      <div v-if="gotMovies" v-for="movie in movieList">
        <movie-card v-bind:movie="movie"></movie-card>
      </div>
    </div>
  </div>
</template>



<script>
    import MovieCard from '@/components/MovieCard.vue'

    export default {
        name: 'home',
        data () {
            return {
                msg: 'Welcome to Your Vue.js App',
                movies: this.$movies,
                gotMovies: false
            }
        },
        components: {
          MovieCard,
        },
        created() {
            fetch(this.PATHTOAPI+'getmovies')
                .then((res) => res.json())
                .then((data) => this.movies = data)
                .then((data) => console.log(data))
                .then(this.gotMovies = true)
        },
        computed: {
            movieList: function (){
                    return this.movies;
                }
        },
        methods: {
        }
    }
</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
