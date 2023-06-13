defmodule CopyTradeTest do
  use ExUnit.Case

  test "Copier creates order with same volume and same direction" do
    master_order = %CopyTrade.Order{
      id: "#123",
      symbol: "EUR/USD",
      volume: 0.5
    }
    mode = :same_volume_same_direction

    assert_capture_io "Placing order: %CopyTrade.Order{id: \"#111\", symbol: \"EUR/USD\", volume: 0.5}" do
      CopyTrade.Copier.create_order(master_order, mode)
    end
  end

  test "Copier creates order with same volume and reverse direction" do
    master_order = %CopyTrade.Order{
      id: "#123",
      symbol: "EUR/USD",
      volume: 0.5
    }
    mode = :same_volume_reverse_direction

    assert_capture_io "Placing order: %CopyTrade.Order{id: \"#111\", symbol: \"EUR/USD\", volume: -0.5}" do
      CopyTrade.Copier.create_order(master_order, mode)
    end
  end

  test "Copier checks for sufficient funds before creating an order" do
    master_order = %CopyTrade.Order{
      id: "#123",
      symbol: "EUR/USD",
      volume: 1.0
    }
    mode = :same_volume_same_direction

    assert_capture_io "Insufficient funds. Cannot open order." do
      CopyTrade.Copier.create_order(master_order, mode)
    end
  end

  test "Copier closes order by ID" do
    copied_order = %CopyTrade.Order{
      id: "#111",
      symbol: "EUR/USD",
      volume: 0.5
    }

    assert_capture_io "Closing order: #111" do
      CopyTrade.Copier.close_order(copied_order)
    end
  end

  test "Master opens an order" do
    master_order = %CopyTrade.Order{
      id: "#123",
      symbol: "EUR/USD",
      volume: 0.5
    }

    assert_capture_io "Opening order: %CopyTrade.Order{id: \"#123\", symbol: \"EUR/USD\", volume: 0.5}" do
      CopyTrade.Master.open_order(master_order)
    end
  end

  test "Master closes an order" do
    master_order = %CopyTrade.Order{
      id: "#123",
      symbol: "EUR/USD",
      volume: 0.5
    }

    assert_capture_io "Closing order: %CopyTrade.Order{id: \"#123\", symbol: \"EUR/USD\", volume: 0.5}" do
      CopyTrade.Master.close_order(master_order)
    end
  end
end
