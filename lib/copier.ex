defmodule CopyTrade.Copier do
  def create_order(order) do
    if has_sufficient_funds?(order) do
      copied_order = copy_order(order)
      IO.puts("Created order: #{inspect(copied_order)}")
    else
      IO.puts("Insufficient funds to create order: #{inspect(order)}")
    end
  end

  def close_order(order_id) do
    # Logic to close the corresponding Copier's order
    IO.puts("Closing Copier's order: #{order_id}")
  end

  defp has_sufficient_funds?(order) do
    # Logic to check if the Copier has sufficient funds
    # Return true if funds are sufficient, false otherwise
    true
  end

  defp copy_order(order) do
    # Logic to copy the Master's order and assign a unique ID
    %{
      id: generate_order_id(),
      symbol: order.symbol,
      volume: order.volume,
      entry_price: order.entry_price,
      stop_loss: order.stop_loss,
      take_profit: order.take_profit
    }
  end

  defp generate_order_id do
    UUID.uuid4() |> to_string()
  end
end
