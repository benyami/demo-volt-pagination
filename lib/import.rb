require 'rss'
require 'open-uri'

urls = [
  "http://lifehacker.com/rss",
  "http://feeds.wired.com/wired/index",
]

urls.each do |url|
  puts "====================================================="
  puts "Opening #{url}"
  puts "====================================================="
  open(url) do |rss|
    feed = RSS::Parser.parse(rss)
    feed.items.each do |item|
      $page.store._articles << { title: item.title, link: item.link}
      # puts "#{item.title} : #{item.link}"
    end
  end
end