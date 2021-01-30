<template>
  <div class="main">
    <Nav />
    <router-view/>
  </div>
</template>

<script>
import Nav from '@/components/Nav'
  export default {
    name: 'App',
    components: {
      Nav
    },
  }
</script>

<style>
.main {
  background-color: #1A2A2F;
  min-height: 100vh;
  color: white;
}
.pointer {
  cursor: pointer;
}
i.disabled {
  color: rgba(191, 191, 191, .5) !important;
}
</style>
