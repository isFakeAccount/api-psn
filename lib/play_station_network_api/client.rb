require 'httparty'

module PlayStationNetworkAPI
  class Client
    VERSION ||= '2.0'
  
    include HTTParty
    base_uri 'https://m.np.playstation.net/api'

    attr_accessor :access_token, :default_headers, :account_id, :country, :language, :age

    def initialize(access_token, account_id: 'me', country: 'GB', language: 'en')
      @access_token = access_token
      @default_headers = {
        # TODO: Make this a variable for other languages
        'Accept-Language' => 'en-US',
        'User-Agent' => "psn-api/#{ VERSION }"
      }

      @account_id = account_id
      @country = country
      @language = language
    end

  public

    def catalog
      PlayStationNetworkAPI::Catalog.new(access_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def entitlement
      PlayStationNetworkAPI::Entitlement.new(access_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def explore
      PlayStationNetworkAPI::Explore.new(access_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def game
      PlayStationNetworkAPI::Game.new(access_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def search
      PlayStationNetworkAPI::Search.new(access_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def session
      PlayStationNetworkAPI::Session.new(access_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def trophy
      PlayStationNetworkAPI::Trophy.new(access_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def user
      PlayStationNetworkAPI::User.new(access_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

  protected

    def get(url, options = {})
      headers = options[:headers] || {}
      options.delete(:headers)

      self.class.get(url,
        headers: {
          **default_headers,
          'Authorization' => "Bearer #{ access_token }",
          **headers
        },
        **options
      )
    end

    def post(url, options = {})
      self.class.post(url, 
        headers: {
          **default_headers,
          'Content-Type' => 'application/json'
        },
        **options
      )
    end

  private

    def self.changelog
      # v2.0
      # Implemented the new API that's currently present in the new PlayStation App.
      # There are quite a few endpoints that currently return Access Denied, which probably means they're not active yet
      
      # v1.0
    end
  end
end