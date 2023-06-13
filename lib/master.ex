defmodule CopyTrade.Master do
  def open_order(order) do
    # Logic to open an order
    IO.puts("Opening order: #{inspect(order)}")
  end

  def close_order(order_id) do
    # Logic to close an order
    IO.puts("Closing order: #{order_id}")
  end
end
