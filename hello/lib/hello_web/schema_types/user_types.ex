defmodule HelloWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  alias HelloWeb.Resolvers
  # import Absinthe.Resolution.Helpers

  # User objects
  @desc "Root user object for user records"
  object :user do
    field :id, :id
    field :name, :string
    field :description, :string
    field :age, :integer
  end

  @desc "Input user object"
  input_object :user_input do
    field :name, :string
    field :description, :string
    field :age, :integer
  end

  object :user_queries do
    @desc "List all users"
    field :list_users, list_of(:user) do
      resolve &Resolvers.User.list_users/3
    end
  end

  object :user_mutation do
    @desc "Create user"
    field :create_user, :user do
      arg :input, non_null(:user_input)
      resolve &Resolvers.User.create_user/3
    end

    @desc "Delete user"
    field :delete_user, :user do
      arg :id, non_null(:id)
      resolve &Resolvers.User.delete_user/3
    end
  end

end
