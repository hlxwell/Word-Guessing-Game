require 'pp'
require "rexml/document"

task :import_word => :environment do
  counter = 0
  doc = REXML::Document.new File.open("words.xml").read
  doc.elements.each("dataroot/Words") { |element|
    begin
      counter+=1;next if counter < 5361
      puts "#{counter+=1} Adding --- #{element.elements[1].text}"

      Word.create(
        :word => element.elements[1].text,
        :pronounce => element.elements[2].text,
        :comment => element.elements[3].text,
        :sample => element.elements[4].text
      )
    rescue
    end
  }
end