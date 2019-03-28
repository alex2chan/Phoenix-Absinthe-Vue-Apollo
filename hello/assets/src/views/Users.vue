<template>
  <div>
    <b-table striped hover :items="listUsers" :fields="fields">
    </b-table>
  </div>
</template>

<script>
import Vue from 'vue'
import { ClientTable } from 'vue-tables-2'
import gql from 'graphql-tag'

Vue.use(ClientTable)

const listUserQuery = gql`query {
  listUsers{
    name
    description
    age
    id
  }
}`

export default {
  name: 'User',
  components: {
    ClientTable,
    Event
  },
  apollo: {
    listUsers: {
      query: listUserQuery
    }
  },
  data () {
    return {
      listUsers: [],
      fields: [
        { key: 'id', label: 'ID', sortable: true, class: 'text-center'},
        { key: 'name', label: 'Name', sortable: true, class: 'text-center' },
        { key: 'description', label: 'Description', sortable: true, class: 'text-center'},
        { key: 'age', label: 'Age', sortable: true, class: 'text-center'}
      ]
    }
  },
  mounted () {
    this.$apollo.queries.listUsers.refetch()
  }
}
</script>

<style lang="scss">
</style>
