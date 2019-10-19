require 'google/apis/customsearch_v1'
require 'json'

Search = Google::Apis::CustomsearchV1
search_client = Search::CustomsearchService.new
search_client.key = 'put your client key'
response = search_client.list_cses('Hello wold', {cx: 'put your Search engine ID'})
body = response
  
images = [] 
@items = JSON.parse(jsonresponse)['items']
  @items.each do |item|
     title = item['title']  
     print title 
     @pagemaps = item['pagemap']
     @pagemaps.each do |pagemap|
        titlemap = pagemap[0]
        if(titlemap == 'cse_image')
            images << pagemap[1][0]['src']  
            puts "\n"
        end  
        puts "\n"
     end  
    end 
puts images
 
 
