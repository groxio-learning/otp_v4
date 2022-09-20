defmodule Enforcer.Game.Board do
  alias Enforcer.Game.Score
  defstruct [:answer, guesses: []]

  def new(answer) do
    %__MODULE__{answer: answer || random_answer()}
  end

  def guess(board, turn) do
    %{board | guesses: [turn | board.guesses]}
  end

  def get_status(board) do
    cond do
      won?(board) -> "WON"
      lost?(board) -> "LOST"
      true -> "PLAYING"
    end
  end

  defp won?(%{answer: a, guesses: [a | _guesses]}) do
    true
  end

  defp won?(_board), do: false

  defp lost?(board) do
    length(board.guesses) >= 10
  end

  defp show_row(answer, guess) do
    "#{Enum.join(guess, " ")} | #{Score.check(answer, guess)}"
  end

  defp show_rows(board) do
    Enum.join(Enum.map(board.guesses, &show_row(board.answer, &1)), "\n")
  end

  def show(board) do
    """
      #{show_rows(board)}

      Status: #{get_status(board)}
    """
  end

  defp random_answer() do
    1..8 |> Enum.take_random(4)
  end
end
