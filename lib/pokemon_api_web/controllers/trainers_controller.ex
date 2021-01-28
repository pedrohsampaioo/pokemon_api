defmodule PokemonApiWeb.TrainersController do
  use PokemonApiWeb, :controller

  action_fallback PokemonApiWeb.FallbackController

  def show(conn, %{"id" => uuid}) do
    uuid
    |> PokemonApi.get_trainer()
    |> handle_response(conn, :ok, "get_trainer.json")
  end

  def create(conn, params) do
    params
    |> PokemonApi.create_trainer()
    |> handle_response(conn, :created, "create_trainer.json")
  end

  def update(conn, params) do
    params
    |> PokemonApi.update_trainer()
    |> handle_response(conn, :ok, "update_trainer.json")
  end

  def delete(conn, %{"id" => uuid}) do
    uuid
    |> PokemonApi.delete_trainer()
    |> handle_delete_response(conn)
  end

  defp handle_response({:ok, trainer}, conn, status, render_name) do
    conn
    |> put_status(status)
    |> render(render_name, trainer: trainer)
  end

  defp handle_response({:error, _changeset_or_reason} = error, _conn, _status, _render_name),
    do: error

  defp handle_delete_response({:ok, _trainer}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete_response({:error, _reason} = error, _conn), do: error
end
