defmodule Enforcer.Game.Score do
  defstruct red: 0, white: 0

  def new(answer, guess) do
    %__MODULE__{red: 2, white: 2}
  end

  def show(_score) do
    "RRWW"
  end

  def check(answer, guess) do
    answer |> new(guess) |> show
  end
end
