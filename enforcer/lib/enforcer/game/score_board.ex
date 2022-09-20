defmodule Enforcer.Game.ScoreBoard do
  alias Enforcer.Game.Score

  defp show_row(answer, guess) do
    "#{Enum.join(guess, " ")} | #{Score.check(answer, guess)}"
  end

  defp show_rows(board) do
    Enum.join(Enum.map(board.guesses, &show_row(board.answer, &1)), "\n")
  end

  def show(board, status) do
    """
      #{show_rows(board)}

      Status: #{status}
    """
    |> IO.puts()
  end
end
