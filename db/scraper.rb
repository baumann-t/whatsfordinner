require "open-uri"
require "nokogiri"

def scraping(recipe)
  url = "https://www.allrecipes.com/search/results/?search=#{recipe.title}"
  # url = "https://www.allrecipes.com/search/results/?search=#{recipe}"

  begin
    html_file = URI.open(url).read
  rescue URI::InvalidURIError
    html_file = URI.open("https://static01.nyt.com/images/2021/01/26/well/well-foods-microbiome/well-foods-microbiome-superJumbo.jpg").read
  end
  # # do a begin rescue
  begin
    html_file = URI.open(url).read
  rescue Errno::ENOENT
    html_file = URI.open("https://static01.nyt.com/images/2021/01/26/well/well-foods-microbiome/well-foods-microbiome-superJumbo.jpg").read
  end
  html_doc = Nokogiri::HTML(html_file)
  image_url = html_doc.search(".card__recipe .component").first.attribute("data-src").value#.first.attribute("src").value
  URI.open(image_url)
end
# scraping("Ebiten maki")
