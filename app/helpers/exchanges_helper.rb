module ExchangesHelper
  def make_money(number)
    string = ""
    string << "<span class='negative'>" if number < 0
    string << "$"
    string << number.abs.to_s
    string << "</span>" if number < 0
    string.html_safe
  end

end
