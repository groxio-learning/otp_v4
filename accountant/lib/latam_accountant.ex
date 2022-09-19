defmodule LatamAccountant do
  @moduledoc """
  Documentation for `Accountant`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Accountant.hello()
      :world

  """
  def new(str) do
    String.to_integer(str)
  end

  def inc(val) do
    val + 1
  end

  def dec(val) do
    val - 1
  end

  def show(numbr) do
    "Desde Tierra del Fuego hasta Canada: #{numbr}"
  end
end
