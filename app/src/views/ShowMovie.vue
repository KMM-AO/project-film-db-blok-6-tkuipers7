<template>
    <div>
        <h1>movie page</h1>
        <p>param id: {{ this.$route.params.id }}</p>
        <img src="../assets/logo.png" alt="">
    </div>
</template>

<script>
    export default {
        name: 'show_movie',
        data () {
            return {
            }
        },
        created() {
            fetch(this.PATHTOAPI+'getmovies')
                .then((res) => res.json())
                .then((data) => {
                    this.movies = data
                    console.log(data)
                })
        },
        computed: {

        },
        methods: {
        }
    }


</script>

<style scoped>

</style>
