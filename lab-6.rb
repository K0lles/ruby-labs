
def aggregate_goods(items)
  inventory = {}
  items.each do |item|
    name, count = item.split('-')
    name.strip!
    count = count.to_i
    if inventory.key?(name.to_sym)
      inventory[name.to_sym] += count
    else
      inventory[name.to_sym] = count
    end
  end
  inventory
end

def classify_students(data, max_score, upper_bound, lower_bound)
  students = data.split('\ ').map do |s|
    name, score = s.split(',')
    [name.strip, score.to_i]
  end.sort_by { |name, score| [-score, name] }

  threshold_top = max_score - (max_score * upper_bound / 100.0)
  threshold_bottom = max_score - (max_score * lower_bound / 100.0)

  result = { top: [], middle: [], bottom: [] }

  students.each do |name, score|
    if score >= threshold_top
      result[:top] << name
    elsif score >= threshold_bottom
      result[:middle] << name
    else
      result[:bottom] << name
    end
  end

  result
end


items = ['Milk - 10', 'Milk - 20', 'Sugar - 10']
puts aggregate_goods(items).inspect
puts ""
data = "Student1,70\\ Student3,86\\ Student2,95"
max_score = 100
upper_bound = 10
lower_bound = 15

puts classify_students(data, max_score, upper_bound, lower_bound).inspect
