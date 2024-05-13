
def sum
  values = [4, 0, -12]
  total = 0
  values.each do |value|
    total += yield(value)
  end
  total
end

result = sum do |value|
  if value < 0
    value ** 2
  else
    value
  end
end

puts "Result of sum: #{result}"


def check_password(username, password)
  Proc.new { |u, p| u == username && p == password }
end

admin = check_password("u1", "p1")
puts admin.call("p1", "u1")
puts admin.call("p1", "u1")
