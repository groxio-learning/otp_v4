defmodule Accountant.Service do
  alias Accountant.Core.MapCounter

  def start(input) do
    spawn(fn ->
      input
      |> MapCounter.new()
      |> loop
    end)
  end

  def loop(counter) do
    counter |> listen |> loop
  end

  def listen(counter) do
    receive do
      :inc ->
        MapCounter.inc(counter)

      :dec ->
        MapCounter.dec(counter)

      {:show, from} ->
        send(from, MapCounter.show(counter))
        counter
    end
  end

  def inc(server) do
    send(server, :inc)
  end

  def dec(server) do
    send(server, :dec)
  end

  def show(server) do
    send(server, {:show, self()})

    receive do
      m -> m
    end
  end
end
