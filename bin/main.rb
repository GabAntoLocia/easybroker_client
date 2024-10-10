#!/usr/bin/env ruby
require_relative '../lib/easyBroker/easybroker_client'

client = EasyBrokerClient.new
client.print_property_titles
