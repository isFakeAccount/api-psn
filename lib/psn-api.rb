require 'psn/version'
require 'httparty'

module PSN
  Dir[File.dirname(__FILE__) + '/psn/*.rb'].each do |file|
    require file
  end
end
