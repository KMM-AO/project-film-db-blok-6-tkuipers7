<template>
  <div class="container">
    <h1 class="d-flex justify-content-center my-5" style="font-size: 50px">People</h1>
    <!--  Persons  -->
    <div v-if="hasdata" class="container d-flex flex-wrap justify-content-lg-around">
      <Personcard v-for="(person, key) in getdata"
                 :key="key"
                 :person="person"
      />
    </div>
  </div>
</template>

<script>
// import searchbar from "@/components/searchbar";
import Personcard from "@/components/Personcard.vue";
import { mapActions, mapGetters } from "vuex";
export default {
  components: {
    // searchbar,
    Personcard
  },
  computed: {
    ...mapGetters(['getdata', 'hasdata']),
  },
  methods: {
    ...mapActions(['viewMore']),
  }
}
</script>

<style scoped>

</style>