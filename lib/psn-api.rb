require 'play_station_network_api/version'
require 'httparty'
require 'client'

module PlayStationNetworkAPI
  Dir[File.dirname(__FILE__) + '/play_station_network_api/*.rb'].each do |file|
    require file
  end
end
