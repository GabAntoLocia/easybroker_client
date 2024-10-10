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
end