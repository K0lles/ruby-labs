def create_hash(array)
  hash = {}
  array.each do |item|
    goods, count = item.split('-')
    count = count.to_i
    if hash[goods]
      hash[goods] += count
    else
      hash[goods] = count
    end
  end
  hash
end

array = ['Milk-10', 'Milk-20', 'Sugar-10', "Sugar-25"]
puts create_hash(array)



def student_performance(csv, max, upper_bound, lower_bound)
  students = csv.split("\\").map do |student|
    name, score = student.split(',')
    [name, score.to_i]
  end

  students.sort_by! { |name, score| [-score, name] }

  top_score = max - upper_bound
  min_score = max - lower_bound

  top_students = []
  middle_students = []
  bottom_students = []

  students.each do |name, score|
    if score >= top_score
      top_students << name
    elsif score >= min_score
      middle_students << name
    else
      bottom_students << name
    end
  end

  puts "Top: #{top_students}"
  puts "Middle: #{middle_students}"
  puts "Bottom: #{bottom_students}"
end

csv = "Student1,70\\ Student3,80\\ Student2,80"
max = 100
upper_bound = 10
lower_bound = 15

student_performance(csv, max, upper_bound, lower_bound)


