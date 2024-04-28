
def calculate_book_cost(pages, copies)
  # Редакційні витрати
  author_fee_per_page = 24
  formatting_cost_percentage = 0.3
  typesetting_cost_per_page = 1.2

  total_editorial_costs = pages * (author_fee_per_page + typesetting_cost_per_page)
  total_editorial_costs += total_editorial_costs * formatting_cost_percentage

  editorial_costs_per_copy = total_editorial_costs / copies

  # Типографські витрати
  paper_cost_per_page = 0.16
  cover_cost = 3
  ink_cost_per_page = 0.04
  depreciation_cost_per_page = 0.08

  total_typographical_costs = pages * (paper_cost_per_page + ink_cost_per_page + depreciation_cost_per_page) + cover_cost

  # Собівартість
  cost_price = editorial_costs_per_copy + total_typographical_costs

  # Прибуток видавництва
  publisher_profit_percentage = 0.23
  publisher_profit = cost_price * publisher_profit_percentage

  # Податок
  tax_percentage = 0.30
  tax_per_copy = (cost_price + publisher_profit) * tax_percentage

  # Загальна вартість
  total_price_per_copy = cost_price + publisher_profit + tax_per_copy

  return {
    author_fee: author_fee_per_page * pages,
    cost_price: cost_price,
    publisher_profit: publisher_profit * copies,
    tax_per_copy: tax_per_copy,
    total_price_per_copy: total_price_per_copy
  }
end

pages = 50
copies = 1000

result = calculate_book_cost(pages, copies)

puts "Авторський гонорар: #{result[:author_fee]} грн."
puts "Собівартість книги: #{result[:cost_price]} грн."
puts "Прибуток видавництва від всього тиражу: #{result[:publisher_profit]} грн."
puts "Податок на один екземпляр: #{result[:tax_per_copy]} грн."
puts "Загальна вартість одного екземпляру: #{result[:total_price_per_copy]} грн."
