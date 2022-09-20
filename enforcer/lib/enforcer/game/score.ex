defmodule Enforcer.Game.Score do
  defstruct red: 0, white: 0

  def new(answer, guess) do
    answer = Enum.with_index(answer)
    guess = Enum.with_index(guess)

    answer_diff = answer -- guess
    guess_diff = guess -- answer

    simp_answer = Enum.map(answer_diff, fn {val, _idx} -> val end)

    simp_guess =
      Enum.map(guess_diff, fn {val, _idx} -> val end)
      |> Enum.uniq()

    new_diff = simp_answer -- simp_guess

    reds = length(answer) - length(answer_diff)
    whites = length(answer) - reds - length(new_diff)
    %__MODULE__{red: reds, white: whites}
  end

  def show(score) do
    String.duplicate("R", score.red) <> String.duplicate("W", score.white)
  end

  def check(answer, guess) do
    answer |> new(guess) |> show
  end
end
