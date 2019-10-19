require 'open-uri'
require 'nokogiri'
puts "Enter link"
input=gets()
name=0
a=Nokogiri::HTML.parse(open("#{input}"))                              #fetch and parse the html
b=a.search("meta[property='og:image']").map{|n|n['content']}.join("") #get the image link
html= open(b).read                                                    #read image
while File.file?("#{name}.png")                                       #checks file names if it exist
  name+=1
end
File.open("#{name}.png", "w") { |file| file.puts html}                #save file
