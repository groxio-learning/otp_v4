defmodule Accountant.Core.MapCounterTest do
  use ExUnit.Case
  alias Accountant.Core.MapCounter

  test "modifies the count" do
    assert %{count: 43} =
             MapCounter.new("42")
             |> MapCounter.inc()
             |> MapCounter.inc()
             |> MapCounter.dec()
  end
end
