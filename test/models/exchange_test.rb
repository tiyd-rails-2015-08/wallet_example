require 'test_helper'

class ExchangeTest < ActiveSupport::TestCase
  test "current month transaction count" do
    assert_difference("Exchange.count_this_month") do
      Exchange.create!(collector: "AMason", amount: -200)
    end
    assert_no_difference("Exchange.count_this_month") do
      Exchange.create!(collector: "AMason", amount: -200, created_at: Time.now - 1.month)
    end
  end

  test "expensive company" do
    expensive = "Steam"

    assert_equal expensive, Exchange.expensive_company
  end
end
