# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Setting up categories
bar_category = Category.create(name: "bar")
pizzeria_category = Category.create(name: "pizzeria")
cafe_category = Category.create(name: "cafe")
mexican_category = Category.create(name: "mexican")
italian_category = Category.create(name: "italian")
japanese_category = Category.create(name: "japanese")
american_category = Category.create(name: "american")
chinese_category = Category.create(name: "chinese")
asian_category = Category.create(name: "asian")
indian_category = Category.create(name: "indian")
arabic_category = Category.create(name: "arabic")
south_american_category = Category.create(name: "south_american")
barbecue_category = Category.create(name: "barbecue")

# Setting up keywords
bar_keywords = ['dine out', 'drinking', 'bar', 'pub', 'have a great night', 'party', 'partying', 'wine', 'beer', 'booze', 'get wasted', 'get high', 'fun night', 'happy hour', 'get drunk', 'cocktails', 'corona', 'budweiser', 'vodka', 'karaoke', 'shots']

bar_keywords.each do |bar_keyword|
  Keyword.create(word: bar_keyword, category_id: bar_category.id)
end


pizzeria_keywords = ['like food', 'try cuisine', 'dine out', 'hungry', 'dinner', 'lunch', 'great food', 'have a great night', 'pizzeria', 'pizza', 'love pizza', 'want pizza', 'eat pizza', 'brick oven', 'pie', 'Italian', 'pizza hut', 'papa john', 'dominos pizza', 'wine']

pizzeria_keywords.each do |pizzeria_keyword|
  Keyword.create(word: pizzeria_keyword, category_id: pizzeria_category.id)
end


cafe_keywords = ['coffee', 'americano', 'cafe', 'tea', 'sandwiches', 'snacks', 'java', 'caffeine', 'cappuccino', 'brew decaf', 'mocha', 'mocktails', 'cakes pastries', 'donuts', 'costa', 'starbucks', 'tim hortons', 'espresso']

cafe_keywords.each do |cafe_keyword|
  Keyword.create(word: cafe_keyword, category_id: cafe_category.id)
end


mexican_keywords = ['mexican food', 'mexican cuisine', 'burrito', 'chimichangas', 'Tex-Mex', 'empanadas', 'enchillada', 'quesadillas', 'tacos', 'ceviche', 'guacamole', 'nachos', 'salsa', 'tortillas', 'like food', 'tequila', 'dinner', 'brunch', 'chipotle', 'taco bell']

mexican_keywords.each do |mexican_keyword|
  Keyword.create(word: mexican_keyword, category_id: mexican_category.id)
end


italian_keywords = ['Italian Food', 'Italian Cuisine', 'Pizza', 'Ziti', 'Lasagna', 'Penne', 'Polenta', 'Spaghetti', 'Frittata', 'Alfredo Sauce', 'Bolognese Sauce', 'Calzone', 'Italian Bread', 'Tiramisu', 'Biscotti', 'Pasta', 'Fusili', 'wine', 'lunch', 'dinner']

italian_keywords.each do |italian_keyword|
  Keyword.create(word: italian_keyword, category_id: italian_category.id)
end

japanese_keywords = ['Japanese food', 'Japanese cuisine', 'Hiabchi', 'Teppanyaki', 'Sushi', 'Ramen', 'Donburi', 'Onigiri', 'Nabe', 'Tempura', 'Yaki', 'Udon', 'California Roll', 'Maki', 'Miso, Gyoza', 'Yakitori', 'sake', 'have a great night']

japanese_keywords.each do |japanese_keyword|
  Keyword.create(word: japanese_keyword, category_id: japanese_category.id)
end

american_keywords = ["Fries", "Mashed Potatoes", "Burgers", "Hot Dogs", "Chicken Tenders", "Chicken Wings", "Steak", "Chicken Wings", "Ribs", "Fried Chicken", "Pork Roast", "comfort food", "applebee", 'burger king', 'KFC', 'Wendy', 'Hardee', 'White Castle', 'like food', 'lunch', 'dinner', 'brunch']

american_keywords.each do |american_keyword|
  Keyword.create(word: american_keyword, category_id: american_category.id)
end


chinese_keywords = ["chinese food", "chinese cuisine", "wonton", "fried rice", " noodles", " dumplings", "dimsum", "kung pao", "chow mein", "spring rolls", "peking duck", "like food", "try cuisine", "lunch", "brunch", "dinner", "have a great night", "eat", "hungry", "dine out"]

chinese_keywords.each do |chinese_keyword|
  Keyword.create(word: chinese_keyword, category_id: chinese_category.id)
end

asian_keywords = ["Asian food", "vietnamese food", "thai food", "korean food", "vietnamese cuisine", "thai cuisine", "korean cuisine", "pad thai", "som tam", "kao phad", "soji", "like food", "try cuisine", "hungry", "karaoke", "dine out", "lunch", "dinner", "brunch", "dining"]
asian_keywords.each do |asian_keyword|
  Keyword.create(word: asian_keyword, category_id: asian_category.id)
end

indian_keywords = ["Indian food", "Indian cuisine", "biriyani", "biryani", "curry", "butter chicken", "tandoor", "tikka", "chaat", "naan", "dosa", "masala", "korma", "vindaloo", "like food", "try cuisine", "hungry", "eat", "dinner", "lunch", "brunch"]
indian_keywords.each do |indian_keyword|
  Keyword.create(word: indian_keyword, category_id: indian_category.id)
end

arabic_keywords = ["arabic food", "arabic cuisine", "hummus", "manakeesh", "falafel", "tabouleh", "baba ghanoush", "shawarma", "kofta", "kebab", "baklava", "iranian food", "iranian cuisine", "like food", "try cuisine", "dining", "dine out", "dinner", "lunch", "gyro", "brunch", "hungry"]
arabic_keywords.each do |arabic_keyword|
  Keyword.create(word: arabic_keyword, category_id: arabic_category.id)
end

south_american_keywords = ["Caipirinha", "sangria", "brazilian food", "peruvian food", "brazilian cuisine", "peruvian cuisine", "rodizio", "churrascaria", "asado", "churrasco", "empanadas", "arepas", "chimichurri", "like food", "try cuisine", "dining", "dine out", "tequila", "brunch", "guacamole", "lunch", "dinner"]

south_american_keywords.each do |south_american_keyword|
  Keyword.create(word: south_american_keyword, category_id: south_american_category.id)
end

barbecue_keywords = ["Barbecue", "steak", "beefsteak", "rib eye", "sirlion", "skirt", "T-bone", "Fish steaks", "new york strip", "beef tenderloin", "bbq", "steakhouse", "Texas roadhouse", "Outback", "Ruth Chris", "Mortons steakhouse", "dinner", "brunch", "wine", "date night"]

barbecue_keywords.each do |barbecue_keyword|
  Keyword.create(word: barbecue_keyword, category_id: barbecue_category.id)
end



City.create(city_name: 'New York', city_code: 'NYC', latitude: 40.715000, longitude: -74.010962)
City.create(city_name: 'Chicago', city_code: 'Chicago', latitude: 41.873626, longitude: -87.620919)
City.create(city_name: 'Los Angeles', city_code: 'LA', latitude: 34.052363, longitude: -118.263417)
City.create(city_name: 'San Francisco', city_code: 'SFO', latitude: 37.774527, longitude: -122.423867)
