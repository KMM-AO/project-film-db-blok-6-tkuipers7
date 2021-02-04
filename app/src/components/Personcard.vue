<template>
  <!-- card -->
  <div class="card pointer" style="width: 18rem;" @click.prevent="goToPerson" :style="getStyling">
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
      defaultStyling: {
      'min-width': '342px',
      'min-height': '695px',
    }
    }
  },
  props: {
    person: Object,
    styling: Object
  },
  computed: {
    getposter() {
      if (this.person.profile_path.length > 0) {
        return "https://image.tmdb.org/t/p/w185" + this.person.profile_path
      }
      return this.poster
    },
    getStyling() {
      return typeof this.styling !== "undefined" ? this.styling : this.defaultStyling
    },
    getid() {
      return this.person.id
    }
  },
  methods: {
    goToPerson() {
      console.log(this.getid)
      this.$router.push({path:`/person/${this.getid}`})
    },
  },
}
</script>

<style scoped>
.card {
  flex: 0 31%;
  margin-bottom:2%;
  background-color: #1A4343;
  border: none;
}
.pointer {
  cursor: pointer;
}
</style>
