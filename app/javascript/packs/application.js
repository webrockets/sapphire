/* eslint no-console:0 */
// third party libraries
import Vue from 'vue/dist/vue.esm'
import axios from 'axios'
import Toaster from '../services/toaster'

// Application components
import SelectRole from '../users/SelectRole'
import Notification from '../shared/notification'

// Add application components here
const components = {
  SelectRole,
  Notification
}

const loadVue = () => {
  const header = document.getElementsByName('csrf-token')[0].getAttribute('content')
  axios.defaults.headers.common = {
    'X-CSRF-TOKEN': header,
    'X-Requested-With': 'XMLHttpRequest'
  };

  axios.interceptors.response.use(null, (error) => {
    console.error('HTTP ERROR:', error);
    if (error.response) {
      const response = error.response

      if (response.data && response.data.message) {
        const toaster = new Toaster()
        const message = response.data.message
        toaster.error({ message })
      }

      return Promise.reject(response)
    }
    return Promise.reject(error)
  })

  Vue.prototype.$route = Routes
  Vue.prototype.$http = axios
  Vue.prototype.$toaster = new Toaster
  Vue.prototype.$current_user = null

  const app = new Vue({
    el: '#app',
    components,
    created() {
      this.$http.get(this.$route.api_current_user_path()).then(
        response => {
          this.$current_user = response.data
        }
      )
    }
  })
}

document.addEventListener('turbolinks:load', loadVue)
// document.addEventListener('DOMContentLoaded', loadVue)
