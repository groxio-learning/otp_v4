defmodule Accountant.Core.MapCounter do
  defstruct [:count]

  def new(value) do
    count = String.to_integer(value)
    %__MODULE__{count: count}
  end

  def inc(%__MODULE__{count: count} = acc) do
    %{acc | count: count + 1}
  end

  def dec(%__MODULE__{count: count} = acc) do
    %{acc | count: count - 1}
  end

  def show(%__MODULE__{count: count}) do
    "The count is: #{count}"
  end
end
