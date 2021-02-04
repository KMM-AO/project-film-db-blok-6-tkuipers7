<template>
  <div>
    <div class="container d-flex flex-column align-items-center py-4">
      <h1 style="font-size: 60px">Rated</h1>
    </div>
    <!--  Movies  -->
    <div v-if="hasRated" class="container d-flex flex-wrap justify-content-lg-around">
      <Moviecard v-for="(movie, key) in getRated"
                 :key="key"
                 :movie="movie"
      />
    </div>
  </div>
</template>

<script>
import Moviecard from "@/components/Moviecard";
import {mapGetters} from 'vuex'
export default {
  name: 'Rated',
  components: {
    Moviecard
  },
  computed: {
    ...mapGetters(['hasRated', 'getRated'])
  }
}
</script>

<style scoped>

</style>