<template>
    <div class="card mb-3 mr-3 col-md-8" style="max-width: 540px; background-color: #1A4343;">
      <div class="row no-gutters p-2">
        <div class="col-md-3">
          <img :src=getMovieURL class="card-img"  alt="">
        </div>
        <div class="col-md-8">
          <div class="card-body">
            <h5 class="card-title">{{ movie.title }}</h5>
            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
          </div>
        </div>
      </div>
    </div>
</template>

<script>
    export default {
        name: 'MovieCard',
        data () {
            return {
                movieURL: 'http://creapiscine.be/wp-content/plugins/photonic/include/images/placeholder-Sm.png'
            }
        },
        props: {
            movie: Object,
        },
        created() {
            if (this.movie.poster_path !== null) {
                this.movieURL = "https://image.tmdb.org/t/p/w500" + this.movie.poster_path
            }

        },
        computed: {
          getMovieURL: function () {
              return this.movieURL
          }
        }
    }
</script>

<style scoped>

</style>
