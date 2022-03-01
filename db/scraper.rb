require "open-uri"
require "nokogiri"

@foods = ["Pho", "Cauliflower Penne", "Fettuccine Alfredo", "Mushroom Risotto", "Scotch Eggs", "Caprese Salad", "Chicken Milanese", "Lasagne", "Katsu Curry", "Barbecue Ribs", "Chicken Fajitas", "Arepas", "Chili con Carne", "Tuna Sashimi", "Fish and Chips", "Pork Sausage Roll", "Hummus", "Poutine", "California Maki", "Linguine with Clams", "French Fries with Sausages", "Bruschette with Tomato", "Pork Belly Buns", "French Toas", "Souvlaki", "Pierogi", "Pasta and Beans", "Salmon Nigiri", "Bunny Chow", "Peking Duck", "Pizza", "Kebab", "Cheeseburger", "Ebiten maki", "Tiramisu", "Tacos", "Stinky Tofu", "Chicken Parm", "Meatballs with Sauce", "Fried Eggs", "Sushi", "Cauliflower Penne", "Pasta with Tomato and Basil", "Massaman Curry", "Pizza", "Fish and Chips", "Katsu Curry", "Chocolate Cookies", "Belgian Waffles", "Cinnamon French Roast Casserole", "Meatloaf"]
def scraping(recipe)
  url = "https://www.allrecipes.com/search/results/?search=#{recipe.title}"
  begin
    html_file = URI.open(url).read
  rescue URI::InvalidURIError
    html_file = URI.open("https://static01.nyt.com/images/2021/01/26/well/well-foods-microbiome/well-foods-microbiome-superJumbo.jpg").read
  end
  html_doc = Nokogiri::HTML(html_file)
  image_url = html_doc.search(".lazy-image noscript > img").first.attribute("src").value
  URI.open(image_url)
end
