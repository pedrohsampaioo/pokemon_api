defmodule PokemonApiWeb.TrainersView do
  use PokemonApiWeb, :view

  def render("create.json", %{trainer: %{name: name, id: id, inserted_at: inserted_at}}) do
    %{
      message: "Trainer created",
      data: %{
        trainer: %{
          name: name,
          id: id,
          inserted_at: inserted_at
        }
      }
    }
  end
end
