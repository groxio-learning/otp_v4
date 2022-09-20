defmodule Enforcer.Game.Board do
  defstruct [:answer, guesses: []]

  def new(answer) do
    %__MODULE__{answer: answer || random_answer()}
  end

  def guess(board, turn) do
    %{board | guesses: [turn | board.guesses]}
  end

  def get_status(board) do
    cond do
      won?(board) -> :won
      lost?(board) -> :lost
      true -> :playing
    end
  end

  defp won?(%{answer: a, guesses: [a | _guesses]}) do
    true
  end

  defp won?(_board), do: false

  defp lost?(board) do
    length(board.guesses) >= 10
  end

  defp random_answer() do
    1..8 |> Enum.take_random(4)
  end
end
