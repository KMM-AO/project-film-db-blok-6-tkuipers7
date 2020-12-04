<template>
  <div class="m-2">
    <div class="d-flex flex-wrap">
<!--      <div v-for="movie in movieList">-->
<!--        <movie-card v-bind:movie="movie"></movie-card>-->
<!--      </div>-->
<!--      <MovieCard></MovieCard>-->
    </div>
  </div>
</template>

<script>
  // import MovieCard from '@/components/MovieCard.vue'

  export default {
    name: 'home',
    data () {
      return {
      }
    },
    components: {
      // MovieCard,
    },
    computed: {
      movieList: function (){
        return this.state.movies;
      }
    },
    methods: {
    }
  }
</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
