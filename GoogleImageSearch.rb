require 'google/apis/customsearch_v1'
require 'json'
require "open-uri"

Search = Google::Apis::CustomsearchV1
search_client = Search::CustomsearchService.new
search_client.key = 'put your client key' #https://support.google.com/googleapi/answer/6158862?hl=en

puts "Please type the word you want to search on google?"

response = search_client.list_cses(gets.chomp, {cx: 'put your Search engine ID'}) #https://developers.google.com/custom-search/v1/introduction
 
jsonresponse = JSON.pretty_generate(response)
 
images = [] 
@items = JSON.parse(jsonresponse)['items']
  @items.each do |item|
     title = item['title']  
     print title 
     @pagemaps = item['pagemap']
     @pagemaps.each do |pagemap|
        titlemap = pagemap[0]
        if(titlemap == 'cse_image')
            imagesrc = pagemap[1][0]['src'];
            images << imagesrc
            print 'Downloading...'
            File.open("Images/"+title+'.png', 'wb') do |fo|
                fo.write open(imagesrc).read 
              end
            puts "\n"
        end  
        puts "\n"
     end  
    end 
puts images
 
 
