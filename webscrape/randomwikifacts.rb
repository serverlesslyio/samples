gem 'nokogiri'
require 'nokogiri'
require 'open-uri'

def random
  doc = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/' + DateTime.now.strftime('%B_%e')))
  sortedFacts = {}
  allLI = doc.css('h2 + ul > li').to_a.shuffle.take(10)

  allLI.each { |f|
    factType = f.parent.previous.previous.child.content
    if !(sortedFacts["#{factType}"].nil?)
      sortedFacts["#{factType}"] << f.content
    else
      sortedFacts["#{factType}"] = []
      sortedFacts["#{factType}"] << f.content
    end
  }
  a = []

  sortedFacts.keys.each { |k|
    sortedFacts["#{k}"].each { |f|
      a << f
    }
  }

  {"facts" => a }.to_json
end

random
