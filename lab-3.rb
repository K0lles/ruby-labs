
def process_orders(n, ba, al)
  # Загальний список та загальна кількість замовлень
  all_orders = ba + al
  total_orders = all_orders.length

  # Список та кількість клієнтів, що сьогодні відвідали кафе
  unique_clients = all_orders.uniq
  total_clients = unique_clients.length

  # Кількість «безалкогольних» замовлень
  non_alcohol_orders = ba.length

  # Кількість та список клієнтів, що робили «безалкогольні» замовлення
  clients_non_alcohol = ba.uniq

  # Кількість «алкогольних» замовлень
  alcohol_orders = al.length

  # Кількість та список клієнтів, що робили «алкогольні» замовлення
  clients_alcohol = al.uniq

  # Кількість та список клієнтів, що робили обидва типи замовлень
  clients_both = clients_non_alcohol & clients_alcohol

  # Кількість та список постійних клієнтів, що сьогодні не відвідували кафе
  non_visitors = (1..n).to_a - unique_clients

  # Вивід результатів
  puts "1. Загальна кількість замовлень: #{total_orders}"
  puts "2. Кількість клієнтів, що відвідали кафе: #{total_clients}"
  puts "3. Кількість «безалкогольних» замовлень: #{non_alcohol_orders}"
  puts "4. Список клієнтів, що робили «безалкогольні» замовлення: #{clients_non_alcohol}"
  puts "5. Кількість «алкогольних» замовлень: #{alcohol_orders}"
  puts "6. Список клієнтів, що робили «алкогольні» замовлення: #{clients_alcohol}"
  puts "7. Кількість клієнтів, що робили обидва типи замовлень: #{clients_both.length}"
  puts "8. Кількість постійних клієнтів, що не відвідували кафе: #{non_visitors.length}"
end

# Вхідні дані
n = 12
ba = [3, 6, 11, 5, 6, 7, 6, 5]
al = [10, 6, 9, 5, 6, 9, 5]

# Виклик функції та вивід результатів
process_orders(n, ba, al)

puts "-----------------------------------------------------------"

# ----------------------------------------------------
def process_orders_cycles(n, ba, al)
  # Загальний список та загальна кількість замовлень
  all_orders = ba + al
  total_orders = all_orders.length

  # Список та кількість клієнтів, що сьогодні відвідали кафе
  unique_clients = all_orders.uniq
  total_clients = unique_clients.length

  # Кількість «безалкогольних» замовлень
  non_alcohol_orders = ba.length

  # Кількість та список клієнтів, що робили «безалкогольні» замовлення
  clients_non_alcohol = []
  ba.each do |client|
    clients_non_alcohol << client unless clients_non_alcohol.include?(client)
  end

  # Кількість «алкогольних» замовлень
  alcohol_orders = al.length

  # Кількість та список клієнтів, що робили «алкогольні» замовлення
  clients_alcohol = []
  al.each do |client|
    clients_alcohol << client unless clients_alcohol.include?(client)
  end

  # Кількість та список клієнтів, що робили обидва типи замовлень
  clients_both = []
  unique_clients.each do |client|
    clients_both << client if ba.include?(client) && al.include?(client)
  end

  # Кількість та список постійних клієнтів, що сьогодні не відвідували кафе
  non_visitors = []
  (1..n).each do |client|
    non_visitors << client unless unique_clients.include?(client)
  end

  # Вивід результатів
  puts "1. Загальна кількість замовлень: #{total_orders}"
  puts "2. Кількість клієнтів, що відвідали кафе: #{total_clients}"
  puts "3. Кількість «безалкогольних» замовлень: #{non_alcohol_orders}"
  puts "4. Список клієнтів, що робили «безалкогольні» замовлення: #{clients_non_alcohol}"
  puts "5. Кількість «алкогольних» замовлень: #{alcohol_orders}"
  puts "6. Список клієнтів, що робили «алкогольні» замовлення: #{clients_alcohol}"
  puts "7. Кількість клієнтів, що робили обидва типи замовлень: #{clients_both.length}"
  puts "8. Кількість постійних клієнтів, що не відвідували кафе: #{non_visitors.length}"
end

# Вхідні дані
n = 12
ba = [3, 6, 11, 5, 6, 7, 6, 5]
al = [10, 6, 9, 5, 6, 9, 5]

# Виклик функції та вивід результатів
process_orders_cycles(n, ba, al)

