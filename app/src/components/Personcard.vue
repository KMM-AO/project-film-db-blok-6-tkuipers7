<template>
  <!-- card -->
  <div class="card pointer" style="width: 18rem;" @click="goToPerson">
    <img :src="getposter" class="card-img-top" alt="">
    <div class="card-body">
      <h5 class="card-title">{{ person.name }}</h5>
      <p class="card-text">{{ person.biography }}</p>
      <a href="">read more</a>
    </div>
  </div>
</template>

<script>
export default {
  name: 'personCard',
  data () {
    return {
      poster: "",
    }
  },
  props: {
    person: Object,
  },
  computed: {
    getposter() {
      if (this.person.profile_path.length > 0) {
        return "https://image.tmdb.org/t/p/w342" + this.person.profile_path
      }
      return this.poster
    },
  },
  methods: {
    goToPerson() {
      this.$router.push(`/person/${this.person.id}`)
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
  background-color: #1A4343;
}
.pointer {
  cursor: pointer;
}
</style>
