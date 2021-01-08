defmodule PokemonApiWeb.FallbackController do
  use PokemonApiWeb, :controller

  def call(conn, {:error, changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(PokemonApiWeb.ErrorView)
    |> render("unprocessable_entity.json", result: changeset)
  end
end
