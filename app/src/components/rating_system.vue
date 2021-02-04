<template>
  <div>
    <i v-for="value in 5"
       :key="value"
       @click.prevent="rate(value)"
       :class="{
         'pointer': isAuthenticated,
         'fas fa-star': isAuthenticated && value <= getRating,
         'far fa-star': isAuthenticated && value > getRating,
         'far fa-star disabled': !isAuthenticated
       }"
       class="px-1"
       :style="{fontSize: getFontSize + 'px'}"
    />
  </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";

export default {
name: "rating_system",
  data() {
    return {
      hasrating: true,
      rating: null,
    }
  },
  props: {
    movie: Object,
    fontSize: Number,
  },
  computed: {
    ...mapGetters(['isAuthenticated','getRated']),
    getRating(){
      if (this.rating === null && this.hasrating) {
        this.setRating()
      }
      return this.rating
    },
    getFontSize() {
      return typeof this.fontSize !== "undefined" ? this.fontSize : 35
    }
  },
  methods: {
    ...mapActions(['addRating','delRating']),
    async rate(key) {
      if (this.isAuthenticated) {
        let success
        if (parseInt(key) === parseInt(this.rating)) {
          success = await this.delRating(this.movie)
          if (success) {
            key = 0
          }
        } else {
          success = await this.addRating({movie: this.movie, rating: key})
        }
        if (success) {
          this.rating = key
        }
      }
    },
    async setRating(){
      let res = await this.getRated.filter(obj => {
        return parseInt(obj.id) === parseInt(this.movie.id)
      })
      if (res.length > 0) {
        this.rating = res[0].rating
      } else  {
        this.rating = 0
        this.hasrating = false
      }
    },
  },
}
</script>

<style scoped>
.fa-star{
  color: yellow;
}
</style>