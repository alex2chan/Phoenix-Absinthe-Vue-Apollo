defmodule HelloWeb.Schema do
  use Absinthe.Schema

  import_types HelloWeb.Schema.UserTypes

  # def context(ctx) do
  #   loader =
  #     Dataloader.new
  #     |> Dataloader.add_source(User, User.data())
  #
  #   Map.put(ctx, :loader, loader)
  # end

  # def plugins do
  #   [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  # end
  #
  # def middleware(middleware, field, object) do
  #   middleware
  #   |> apply(:errors, field, object)
  # end
  #
  # defp apply(middleware, :errors, _field, %{identifier: :mutation}) do
  #   middleware ++ [Middleware.ChangesetErrors]
  # end
  #
  # defp apply(middleware, _, _, _) do
  #   middleware
  # end

  query do
    import_fields :user_queries
  end

  mutation do
    import_fields :user_mutation
  end

  # @desc "An error encountered trying to persist input"
  # object :input_error do
  #   field :key, non_null(:string)
  #   field :message, non_null(:string)
  # end
  #
  # @desc "Status object for deletions, etc"
  # object :status do
  #   field :status, :string
  #   field :errors, list_of(:input_error)
  # end

end
