<template>
  <!-- card -->
  <div class="card text-white pointer shadow-lg" @click="goToMovie" @mouseenter="overlay = true" @mouseleave="overlay = false">
    <img :src="getposter" alt="" class="card-img">
    <transition name="fade">
      <div v-show="overlay" :class="{overlay: overlay}" class="card-img-overlay">
        <h2 class="card-title">{{ movie.title }}</h2>
      </div>
    </transition>
  </div>
</template>

<script>
    export default {
      name: 'MovieCard',
      data () {
          return {
            poster: "",
            overlay: false,
          }
      },
      props: {
        movie: Object,
      },
      computed: {
        getposter() {
          return this.movie.poster_path.length > 0 ? "https://image.tmdb.org/t/p/w342" + this.movie.poster_path : this.poster
        },
      },
      methods: {
        goToMovie() {
          this.$router.push({path:`/movie/${this.movie.id}`})
        },
      },
    }
</script>

<style scoped>
  .card {
    min-width: 342px;
    flex: 0 31%;
    margin-bottom: 2%;
    border: none;
  }
  .overlay {
    background: rgba(0,0,0,.65);
  }
  .fade-enter-active,
  .fade-leave-active{
    transition: opacity 0.5s ease;
  }
  .fade-enter-from,
  .fade-leave-to {
    opacity: 0;
  }
</style>
