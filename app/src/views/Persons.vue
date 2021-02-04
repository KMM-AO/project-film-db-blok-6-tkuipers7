<template>
  <div class="container">
    <!--  title  -->
    <h1 class="d-flex justify-content-center mt-5" style="font-size: 50px">People</h1>
    <!--  search  -->
    <div class="d-flex container justify-content-end align-items-center py-4">
      <searchbar />
    </div>
    <!--  Persons  -->
    <div v-if="hasdata" class="container d-flex flex-wrap justify-content-lg-around">
      <Personcard v-for="(person, key) in getdata"
                 :key="key"
                 :person="person"
      />
    </div>
    <div class="d-flex justify-content-center py-4">
      <Viewmore />
    </div>
  </div>
</template>

<script>
import searchbar from "@/components/searchbar";
import Personcard from "@/components/Personcard.vue";
import Viewmore from "@/components/Viewmore";
import { mapActions, mapGetters } from "vuex";

export default {
  components: {
    searchbar,
    Personcard,
    Viewmore
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