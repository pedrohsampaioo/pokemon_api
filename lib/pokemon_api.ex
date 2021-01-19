defmodule PokemonApi do
  alias PokemonApi.Trainer

  @moduledoc """
  PokemonApi keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defdelegate create_trainer(params), to: Trainer.Create, as: :call

  defdelegate delete_trainer(params), to: Trainer.Delete, as: :call
end
