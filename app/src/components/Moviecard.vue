<template>
  <!-- card -->
  <div class="card text-white pointer shadow-lg" @mouseenter="overlay = true" @mouseleave="overlay = false">
    <img :src="getposter" alt="" class="card-img">
    <!--  animatie van de overlay  -->
    <transition name="fade">
      <!--  Overlay  -->
      <div v-show="overlay">

        <!--  Favorite heart  -->
          <favorite_heart class="heart" :movie="movie"/>

        <!--  rating stars  -->
        <div class="ratings">
          <h3>Personal Rating:</h3>
          <rating_system :movie="movie" :fontSize="35"/>
        </div>

        <!--  card info  -->
        <div v-show="overlay" @click="goToMovie" :class="{overlay: overlay}" class="card-img-overlay">
          <h2 class="card-title">{{ movie.title }}</h2>
          <p class="card-text"><b>original title: </b> {{ movie.original_title }}</p>
        </div>
      </div>
    </transition>
  </div>
</template>

<script>
  import favorite_heart from "@/components/favorite_heart";
  import rating_system from "@/components/rating_system";

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
    components: {
      favorite_heart,
      rating_system
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
    min-height: 590px;
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
  .heart {
    position: absolute;
    top: 0;
    right: 0;
    margin: 20px 20px;
    z-index: 20;
  }
  .ratings {
    position: absolute;
    bottom: 0;
    left: 0;
    z-index: 20;
    margin: 0 0 20px 20px;
  }
</style>
