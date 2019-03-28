import Vue from 'vue'
import App from './App.vue'
import BootstrapVue from 'bootstrap-vue'
import router from './router'
import store from './store'
import { createProvider } from './vue-apollo'

Vue.config.productionTip = false

Vue.use(BootstrapVue)

new Vue({
  el: '#app',
  router,
  store,
  apolloProvider: createProvider(),
  template: '<App/>',
  components: {
    App
  }
})
