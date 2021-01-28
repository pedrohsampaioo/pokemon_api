defmodule PokemonApiWeb.FallbackController do
  use PokemonApiWeb, :controller
  import Ecto.Changeset, only: [traverse_errors: 2]

  def call(conn, {:error, %Ecto.Changeset{valid?: false} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(PokemonApiWeb.ErrorView)
    |> render("simple_message.json", message: format_changeset_error_message(changeset))
  end

  def call(conn, {:error, "Trainer not found" = message}) do
    conn
    |> put_status(:not_found)
    |> put_view(PokemonApiWeb.ErrorView)
    |> render("simple_message.json", message: message)
  end

  def call(conn, {:error, "It's not a valid UUID" = message}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(PokemonApiWeb.ErrorView)
    |> render("simple_message.json", message: message)
  end

  defp format_changeset_error_message(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
