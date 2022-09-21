defmodule Accountant.Server do
  use GenServer
  alias Accountant.Core.MapCounter

  def start(input) do
    GenServer.start(__MODULE__, input)
  end

  def start_link(input) do
    GenServer.start_link(__MODULE__, input, name: __MODULE__)
  end

  def inc(server) do
    GenServer.cast(server, :inc)
  end

  def dec(server) do
    GenServer.cast(server, :dec)
  end

  def boom(server) do
    GenServer.cast(server, :boom)
  end

  def show(server) do
    GenServer.call(server, :show)
  end

  @impl GenServer
  def init(input) do
    state = MapCounter.new(input)

    {:ok, state}
  end

  @impl GenServer
  def handle_call(:show, _from, state) do
    show_value = MapCounter.show(state)

    {:reply, show_value, state}
  end

  @impl GenServer
  def handle_cast(:boom, state) do
    raise "booom!!!!"

    {:noreply, state}
  end

  @impl GenServer
  def handle_cast(:inc, state) do
    inc_value = MapCounter.inc(state)

    {:noreply, inc_value}
  end

  @impl GenServer
  def handle_cast(:dec, state) do
    dec_value = MapCounter.dec(state)

    {:noreply, dec_value}
  end
end
