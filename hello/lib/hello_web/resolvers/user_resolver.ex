defmodule HelloWeb.Resolvers.User do
  alias Hello.Accounts

  def list_users(_, _, _) do
    {:ok, Accounts.list_users}
  end

  def create_user(_, %{input: params}, _) do
    Accounts.create_user(params)
  end

  def delete_user(_, %{id: user_id}, _) do
    user = Accounts.get_user!(user_id)
    {:ok, %{user: Accounts.delete_user(user)}}
  end

end
