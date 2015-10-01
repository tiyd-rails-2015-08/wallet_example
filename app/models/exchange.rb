class Exchange < ActiveRecord::Base
  validates :amount, :collector, presence: true

  def self.count_this_month
    self.where("created_at BETWEEN ? AND ?",
        Time.now.beginning_of_month, Time.now.end_of_month).count
  end

  def self.trans_count
    self.count
  end

  def self.biggest_expense
    self.all.map { |x| x.amount }.min
  end

  def self.expensive_company
    # # RUBY
    # debits = self.all.select {|e| e.amount < 0}
    #
    # collectors = Hash.new(0)
    # debits.each do |d|
    #   collectors[d.collector] += d.amount
    # end
    #
    # least_collector = nil
    # least_amount = 0
    # collectors.each do |k, v|
    #   if v < least_amount
    #     least_amount = v
    #     least_collector = k
    #   end
    # end
    # least_collector

    # SQL-heavy
    self.where("amount < 0").group("collector").order("sum(amount)").select("collector").first.collector
  end

  def self.total_money
    self.all.inject(0) { |sum, number| sum + number.amount.to_d }
  end

  def self.broke
    self.total_money < 0 ? true : false
  end

end
