# A Server-Side App with Client-Side Rendering (GraphQL-Phoenix-Vue-Apollo)

### Steps to generate a simple working application:

First install Elixir:
https://elixir-lang.org/install.html

Then install Phoenix and Node.js:
https://hexdocs.pm/phoenix/up_and_running.html

Once an application in Phoenix is up and running, install the absinthe packages required to implement GraphQL:
https://github.com/absinthe-graphql/absinthe

and make sure that the router is configured through an api that accepts json:
`  scope "/api" do
    pipe_through :api

    forward "/gql", Absinthe.Plug,
      schema: HelloWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: HelloWeb.Schema
  end`

(Optional) Install Dataloader if necessary for your project:
https://github.com/absinthe-graphql/dataloader

To integrate Vue with Phoenix, we would have to use the CORS plug:
https://github.com/mschae/cors_plug, and make sure that the plug is implemented through one of the recommended steps (in my case I put it in the endpoint.ex file.

The Vue app would reside in the assets folder, replacing all the contents that were originally there.
The recommended way to install Vue is through the node package manager (npm).
`npm install vue`

Vue CLI is also recommended if you want templates that are ready to go:
https://cli.vuejs.org/guide/installation.html

Then create a Vue application in the assets folder using Vue CLI:
`npx @vue/cli create assets`

Depending on your project requirements, you can either select the default configuration or add more features.
![Taken from https://cli.vuejs.org/guide/creating-a-project.html#vue-create](https://cli.vuejs.org/cli-select-features.png)

If you are using a Runtime + Compiler, make sure that you create a vue.config.js file with runtimeCompiler set to true:
`const path = require('path');

module.exports = {
  publicPath: './',
  runtimeCompiler: true,
  outputDir: path.resolve(__dirname, '../priv/static')
}`

Then install Vue Apollo into your Vue application:
`cd assets`
`vue add apollo`
or by manual installation:
https://vue-apollo.netlify.com/guide/installation.html

Configure the httpEndpoint in vue-apollo.js to match the route to the GraphQL server in Phoenix:
`const httpEndpoint = process.env.VUE_APP_GRAPHQL_HTTP || 'http://localhost:4000/api/gql'`

When running the Vue app with the Pheonix server, the websocket handshake might fail. In that case, use the default process in the defaultOptions:
`const defaultOptions = {
  wsEndpoint: process.env.VUE_APP_GRAPHQL_WS`
  
Then run the Phoenix server in the development environment to see if things work:
`cd my-project`
`mix phx.server`

And run the Vue application in the assets folder (you might want to use another terminal):
`cd assets`
`npm run serve`

I hope that should work.
