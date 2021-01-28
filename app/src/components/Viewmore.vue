<template>
  <div v-if="hasdata" class="d-flex">
    <button @click.prevent="viewmore" class="btn btn-success mr-3" :disabled="disabled">view more</button>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
export default {
  name: "ViewmoreBTN",
  computed: {
    ...mapGetters(['hasdata','getdata','page']),
    disabled() {
      return this.page.end > this.getdata.length
    }
  },
  methods: {
    ...mapActions(['viewmore'])
  }
}
</script>

<style scoped>
.btn-success {
  border-color: #66988C;
  background-color: #66988C;
}
.btn-success:hover {
  border-color: #66988C;
  background: none;
}
</style>