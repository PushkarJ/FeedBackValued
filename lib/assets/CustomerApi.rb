require 'net/http'

# Citation: http://squarism.com/2011/04/01/how-to-write-a-ruby-rails-3-rest-api/

class CustomerApi
  attr_accessor :url
  attr_accessor :uri

  def initialize
    @url = "http://localhost:3000/customers"
    @uri = URI.parse @url
  end

  # Create a Customer using a predefined XML template as a REST request.
  def create(name="Default name")
    xml_req =
        "<?xml version='1.0' encoding='UTF-8'?>
    <customer>
      <name>#{name}</name>
    </customer>"

    request = Net::HTTP::Post.new(@url)
    request.add_field "Content-Type", "application/xml"
    request.body = xml_req

    http = Net::HTTP.new(@uri.host, @uri.port)
    response = http.request(request)

    response.body
  end

  # Read can get all customers with no arguments or
  # get one customer with one argument.  For example:
  # customer_api = customer_api.new
  # customer_api.read 2 => one customer
  # customer_api.read   => all customers
  def read(id=nil)
    request = Net::HTTP.new(@uri.host, @uri.port)
    if id.nil?
      response = request.get("#{@uri.path}.xml")
    else
      response = request.get("#{@uri.path}/#{id}.xml")
    end

    response.body
  end

  # Update a customer using a predefined XML template as a REST request.
  def update(id, name= "Updated Name")
    xml_req =
        "<?xml version='1.0' encoding='UTF-8'?>
    <customer>
      <id type='integer'>#{id}</id>
      <name>#{name}</name>
    </customer>"

    request = Net::HTTP::Put.new("#{@url}/#{id}.xml")
    request.add_field "Content-Type", "application/xml"
    request.body = xml_req

    http = Net::HTTP.new(@uri.host, @uri.port)
    response = http.request(request)

    # no response body will be returned
    case response
      when Net::HTTPSuccess
        return "#{response.code} OK"
      else
        return "#{response.code} ERROR"
    end
  end

  # Delete a customer with an ID using HTTP Delete
  def delete(id)
    request = Net::HTTP::Delete.new("#{@url}/#{id}.xml")
    http = Net::HTTP.new(@uri.host, @uri.port)
    response = http.request(request)

    # no response body will be returned
    case response
      when Net::HTTPSuccess
        return "#{response.code} OK"
      else
        return "#{response.code} ERROR"
    end
  end
end