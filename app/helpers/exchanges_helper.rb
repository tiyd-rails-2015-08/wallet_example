module ExchangesHelper
  def make_money(number)
    string = ""
    string << "<span class='negative'>" if number < 0
    string << "$"
    string << number.abs.to_s
    string << "</span>" if number < 0
    string.html_safe
  end

  def phone_numberize(number)
    string = number.to_s
    string.first(3) + "-" + string.last(4)
    # string.insert(3, "-")
  end
end
