require 'test_helper'

class ExchangeTest < ActiveSupport::TestCase
  test "current month transaction count" do
    assert_equal 2, Exchange.count_this_month
    Exchange.create!(collector: "AMason", amount: -200)
    assert_equal 3, Exchange.count_this_month
  end
end
