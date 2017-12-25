<template>
  <div class="select" :class="{'is-loading': loading}">
    <select v-model="selected_role" @change="changeRole">
      <option v-for="(option, index) in options" :key="index" :value="option[1]">{{ option[0] }}</option>
    </select>
  </div>
</template>

<script>
export default {
  props: {
    userId: { required: true },
    role: { required: true, type: String },
    options: { default: () => [] },
  },

  data() {
    return {
      selected_role: null,
      previous_role: null,
      loading: false,
    }
  },

  created() {
    this.selected_role = this.role
    this.previous_role = this.role
  },

  methods: {
    changeRole() {
      this.loading = true
      this.$http.put(this.$route.api_user_change_role_path(this.userId), { role: this.selected_role })
        .then(this.onChangeSuccess.bind(this), this.onChangeFailed.bind(this))
    },

    onChangeSuccess() {
      this.loading = false
      this.$toaster.success({ message: 'Perfil alterado com sucesso' })
    },

    onChangeFailed(error) {
      this.loading = false
      this.selected_role = this.previous_role
    }
  }
}
</script>

<style lang="sass">
.select-role
  color: red
</style>
