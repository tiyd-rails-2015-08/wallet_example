class Exchange < ActiveRecord::Base
  def self.money
    @total_money = 100.0
  end

  def type
    # if deposit.params[]
    #   @deposit =
  end

  def self.total_money
    @total_money = deposit - withdrawal
  end
end
