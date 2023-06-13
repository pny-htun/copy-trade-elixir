defmodule CopyTrade do
  def start_link do
    # Your code to start the application goes here
  end

  def run_example do
    master_order = %{
      symbol: "EUR/USD",
      volume: 100,
      entry_price: 1.2,
      stop_loss: 1.1,
      take_profit: 1.3
    }

    CopyTrade.Master.open_order(master_order)
    CopyTrade.Copier.create_order(master_order)

    CopyTrade.Master.close_order(123)
    CopyTrade.Copier.close_order(123)
  end
end
