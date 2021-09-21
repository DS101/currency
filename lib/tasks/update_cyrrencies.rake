require 'nokogiri'
require 'net/http'
require 'net/https'

desc "update or create currencies"

task :update_or_create_currencies => [ :environment ] do
  url = "http://www.cbr.ru/scripts/XML_daily.asp"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  xml_doc = Nokogiri::XML(response)
  xml_doc.xpath("ValCurs/Valute").each do |valute|
    code  = valute.xpath("CharCode").text.strip
    name  = valute.xpath("Name").text.strip
    value = valute.xpath("Value").text.strip
    item = Currency.find_or_create_by(code: code)
    item.name = name
    item.value = value
    item.save
  end
end
