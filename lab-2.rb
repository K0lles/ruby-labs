class Apartment
  attr_accessor :area, :material, :floor, :district, :style, :category

  MATERIAL_INDEX = {'бетон' => 300, 'цегла' => 500, 'композит' => 800}
  FLOOR_COEFFICIENT = {1 => 1.1, 2 => 1.1, 3 => 1.4, 4 => 1.4, 5 => 1.4, 6 => 1.4, 7 => 1.4, 8 => 1.1, 9 => 1.1}
  DISTRICT_COEFFICIENT = {'центр' => 1.7, 'спальний' => 1.4, 'приміський' => 1.15}
  STYLE_COEFFICIENT = {'хайтех' => 2, 'ексклюзів' => 1.7, 'індивідуал' => 1.5, 'стандарт' => 1.05}
  CATEGORY_COEFFICIENT = {'елітна' => 1.75, 'бюджетна' => 1.5, 'пільгова' => 1.07}

  def initialize(area, material, floor, district, style, category)
    @area = area
    @material = material
    @floor = floor
    @district = district
    @style = style
    @category = category
  end

  def cost_price
    @area * MATERIAL_INDEX[@material]
  end

  def location_price
    cost_price * FLOOR_COEFFICIENT[@floor] * DISTRICT_COEFFICIENT[@district]
  end

  def developer_price
    location_price * STYLE_COEFFICIENT[@style]
  end

  def total_price
    developer_price * CATEGORY_COEFFICIENT[@category]
  end
end

apartment = Apartment.new(100, 'цегла', 5, 'спальний', 'хайтех', 'бюджетна')
puts "Собівартість (СВ): #{apartment.cost_price}"
puts "Вартість забудовника (ПК): #{apartment.developer_price}"
puts "Загальна вартість (ПВ): #{apartment.total_price}"

# def calculate_apartment_cost(area, materials, floor, district, style, category)
#   # Собівартість
#   material_index = case materials
#                    when 'бетон' then 300
#                    when 'цегла' then 500
#                    when 'композит' then 800
#                    end
#   cost_price = area * material_index
#
#   # Розміщення
#   floor_coefficient = if [1, 2, 8, 9].include?(floor)
#                         1.1
#                       elsif (3..7).include?(floor)
#                         1.4
#                       else
#                         1
#                       end
#   district_coefficient = case district
#                          when 'центр' then 1.7
#                          when 'спальний' then 1.4
#                          when 'приміський' then 1.15
#                          end
#   location_price = cost_price * floor_coefficient * district_coefficient
#
#   # Ціна фірми-забудовника
#   style_coefficient = case style
#                       when 'хайтех' then 2
#                       when 'ексклюзів' then 1.7
#                       when 'індивідуал' then 1.5
#                       when 'стандарт' then 1.05
#                       end
#   developer_price = location_price * style_coefficient
#
#   # Вартість квартири з податком
#   category_coefficient = case category
#                          when 'елітна' then 1.75
#                          when 'бюджетна' then 1.5
#                          when 'пільгова' then 1.07
#                          end
#   total_price = developer_price * category_coefficient
#
#   puts "Собівартість (СВ): #{cost_price}"
#   puts "Вартість забудовника (ПК): #{developer_price}"
#   puts "Загальна вартість (ПВ): #{total_price}"
# end
#
# calculate_apartment_cost(100, 'цегла', 5, 'спальний', 'хайтех', 'бюджетна')
