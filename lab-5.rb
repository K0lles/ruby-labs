def process_text(text)
  # Визначити розмір рядка
  size = text.size
  puts "Розмір рядка: #{size}"

  # Визначити кількість заголовних букв, прописних букв та цифр у суцільному рядку
  uppercase_letters = text.count('A-Z')
  puts "Кількість заголовних букв: #{uppercase_letters}"

  lowercase_letters = text.count('a-z')
  puts "Кількість прописних букв: #{lowercase_letters}"

  digits = text.count('0-9')
  puts "Кількість цифр: #{digits}"

  # Розбити текст на масив слів
  words = text.split

  # Впорядкувати масив слів за зростанням довжини
  sorted_words = words.sort_by(&:length)
  puts "Впорядковані слова: #{sorted_words}"

  # Перетворити кожне слово у заголовне
  capitalized_words = words.map(&:capitalize)
  puts "Слова з першою заголовною буквою: #{capitalized_words}"

  # Відобразити слова, підозрілі на абревіатуру
  suspicious_words = words.select { |word| word =~ /[a-zA-Z]+[0-9]+|[0-9]+[a-zA-Z]+/ }
  puts "Підозрілі на абревіатуру слова: #{suspicious_words}"

  # Створити новий текст, в якому слова першого тексту розміщені у порядку спадання довжини
  new_text = words.sort_by(&:length).reverse.join(' ')
  puts "Новий текст: #{new_text}"
end

text = "Hello World 123 12sd"
process_text(text)
