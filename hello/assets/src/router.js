import Vue from 'vue'
import Router from 'vue-router'
import DefaultContainer from './containers/DefaultContainer.vue'
import Home from './views/Home.vue'
import About from './views/About.vue'
import Users from './views/Users.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      component: DefaultContainer,
      children: [
        {
          path: 'home',
          name: 'Home',
          component: Home
        },
        {
          path: 'about',
          name: 'About',
          component: About
        },
        {
          path: 'user',
          name: 'User',
          component: Users
        }
      ]
    }
  ]
})
