require 'net/http'
require 'json'

class EasyBrokerClient
  STAGING_API_KEY = 'l7u502p8v46ba3ppgvj5y2aad50lb9'  #TODO: Añadir varibles de entorno  por tiempo no se incluye
  BASE_URL = 'https://api.stagingeb.com/v1/properties?page=1&limit=20'

  def initialize(api_key = STAGING_API_KEY)
    @api_key = api_key
  end

  def list_properties
    uri = URI("#{BASE_URL}")
    request = Net::HTTP::Get.new(uri)
    request['X-Authorization'] = @api_key

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)['content']
    else
      raise "Error: #{response.code} - #{response.message}"
    end
  end

  def print_property_titles
    properties = list_properties
    properties.each do |property|
      puts property['title']
    end
  end
end