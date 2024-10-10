require 'rspec'
require_relative '../lib/easyBroker/easybroker_client'


RSpec.describe EasyBrokerClient do
  let(:client) { EasyBrokerClient.new }

  it 'fetches properties and prints their titles' do
    allow(client).to receive(:list_properties).and_return(
      [
        { 'title' => 'Beautiful Apartment' },
        { 'title' => 'Spacious House' }
      ]
    )

    expect { client.print_property_titles }.to output("Beautiful Apartment\nSpacious House\n").to_stdout
  end

  it 'raises an error if the API key is missing' do
    allow(ENV).to receive(:[]).with('EASYBROKER_API_KEY').and_return(nil)
    expect { EasyBrokerClient.new }.to raise_error(RuntimeError, "API Key not found. Please set the EASYBROKER_API_KEY environment variable.")
  end

  it 'handles API errors gracefully' do
    allow(RestClient).to receive(:get).and_raise(RestClient::InternalServerError)
    expect { client.list_properties }.to raise_error(RestClient::InternalServerError)
  end

  it 'handles a large number of properties efficiently' do
    properties = Array.new(1000) { { 'title' => 'Property Title' } }
    allow(client).to receive(:list_properties).and_return(properties)

    expect { client.print_property_titles }.to output(/Property Title\n/).exactly(1000).times
  end
end