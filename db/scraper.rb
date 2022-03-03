require "open-uri"
require "nokogiri"


def scraping(title)
  url = "https://www.allrecipes.com/search/results/?search=#{title}"
  begin
    html_file = URI.open(url).read
  rescue URI::InvalidURIError
    html_file = URI.open("https://static01.nyt.com/images/2021/01/26/well/well-foods-microbiome/well-foods-microbiome-superJumbo.jpg").read
  end
  html_doc = Nokogiri::HTML(html_file)
  image_url = html_doc.search(".lazy-image noscript > img").first.attribute("src").value
  URI.open(image_url)
end
