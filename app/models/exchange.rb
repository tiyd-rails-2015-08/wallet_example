require 'byebug'

class Exchange < ActiveRecord::Base
 validates :amount, :collecter, presence: true
  def self.trans_count
    self.count
  end

  def self.biggest_expense
    @big = []
    self.all.each do |x|
      @big << x.amount
    end
    @big.min
  end

  def self.expensive_company
    bigger = []
    self.all.each do |x|
      bigger << x.amount.to_s
    end

    @h3 = Hash[bigger.map {|amount, collecter| [amount, collecter]}]
    # companies = Hash[bigger.each { |x| [amount, collecter] }]
    # comapnies = companies.sort

    # Exchange.select("collecter(:id) as ordered_date, sum(amount) as total_amount").group("collecter(:id)")
    # Client.sum("orders_count")

  end

  def self.total_money
    self.all.inject(0) { |sum, number| sum + number.amount.to_d }
  end

  def self.broke
    self.total_money < 0 ? true : false
  end

end
