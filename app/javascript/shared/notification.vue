<template>
  <div class="notification"></div>
</template>

<script>
export default {
  props: {
    title: { default: 'Notice', type: String },
    message: { required: true, type: String },
    type: { default: 'show', type: String }
  },

  mounted() {
    this.$toaster[this.type]({ title: this.title, message: this.message })
  }
}
</script>

<style lang="sass" scoped>
.notification
  display: none
</style>
