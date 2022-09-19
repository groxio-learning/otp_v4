defmodule Accountant.Core.MapCounter do
  def new(value) do
    count = String.to_integer(value)
    %{count: count}
  end

  def inc(%{count: count} = acc) do
    %{acc | count: count + 1}
  end

  def dec(%{count: count} = acc) do
    %{acc | count: count - 1}
  end

  def show(%{count: count}) do
    "The count is: #{count}"
  end
end
