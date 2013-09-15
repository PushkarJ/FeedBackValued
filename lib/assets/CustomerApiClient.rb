require '../../lib/assets/CustomerApi.rb'
require 'nokogiri'

# CRUD example with an api

def list_employees(api_object)
  puts "Current Customers:"
  doc = Nokogiri::XML.parse api_object.read
  names = doc.xpath('customers/customer/name').collect {|e| e.text }
  puts names.join(", ")
  puts ""
end

api = CustomerApi.new
list_employees(api)

# Create
puts "Creating customers..."
api.create "Pizza Bellino"
list_employees(api)

# Read one and do nothing with it
api.read 1

# Read all and get valid IDs
doc = Nokogiri::XML.parse api.read
ids = doc.xpath('customers/customer/id').collect {|e| e.text }

# Update last record
puts "Updating last customer ..."
api.update ids.last, "New Pizza Bellino"
list_employees(api)

# Delete
puts "deleting last customer ..."
api.delete ids.last
list_employees(api)