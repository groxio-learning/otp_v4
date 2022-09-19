defmodule LatamAccountantTest do
  use ExUnit.Case
  doctest Accountant

  test "10 es diez" do
    assert LatamAccountant.new("10") == 10
  end

  test "La del Diegote" do
    assert LatamAccountant.new("10")
      |> LatamAccountant.inc
      |> LatamAccountant.inc
      |> LatamAccountant.dec
      |> LatamAccountant.show == "Desde Tierra del Fuego hasta Canada: 11"
  end
end
