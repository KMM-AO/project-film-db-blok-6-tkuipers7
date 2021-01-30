<template>
  <div>
    <i @click.prevent="changeFav"
       :class="{
          'pointer': isAuthenticated,
          'fas fa-heart': isAuthenticated && getFav,
          'far fa-heart': isAuthenticated && !getFav,
          'far fa-heart disabled': !isAuthenticated
       }"
       :style="{
          fontSize: getFontSize + 'px'
       }"
    />
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";

export default {
name: "favorite_heart",
  data(){
    return {
      fav: null,
    }
  },
  props: {
    movie: Object,
    fontSize: Number,
  },
  computed: {
    ...mapGetters(['isAuthenticated','getFavorites']),
    getFav(){
      if (this.fav === null) {
        this.setFav()
      }
      return this.fav
    },
    getFontSize() {
      return typeof this.fontSize !== "undefined" ? this.fontSize : 35
    },
  },
  methods: {
    ...mapActions(['addFavorite','delFavorite']),
    async setFav(){
      this.fav = await this.getFavorites.some(obj => {
        return parseInt(obj.id) === parseInt(this.movie.id)
      })
    },
    async changeFav() {
      if (this.isAuthenticated) {
        let success
        if (this.fav) {
          success = await this.delFavorite(this.movie)
        } else {
          success = await this.addFavorite(this.movie)
        }
        if (success) {
          this.fav = !this.fav
        }
      }
    }
  }
}
</script>

<style scoped>
i.fa-heart{
  color: pink;
}
i.disabled {
  color: rgba(191, 191, 191, .5) !important;
}
</style>