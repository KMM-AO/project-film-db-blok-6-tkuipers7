<template>
  <!-- card -->
  <div class="card pointer" style="width: 18rem;" @click.prevent="goToPerson">
    <img :src="getposter" class="card-img-top" alt="">
    <div class="card-body d-flex flex-column align-items-start justify-content-end">
      <h5 class="card-title">{{ person.name }}</h5>
      <p class="card-text">{{ person.biography }}</p>
      <a class="link-primary" @click.prevent="goToPerson">read more</a>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Personcard',
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
  min-height: 695px;
  flex: 0 31%;
  margin-bottom: 2%;
  border: none;
  background-color: #1A4343;
}
.pointer {
  cursor: pointer;
}
</style>
