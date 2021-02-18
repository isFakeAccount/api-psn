require 'httparty'

module PlayStationNetworkAPI
  class Client
    VERSION ||= '2.0'
  
    include HTTParty
    base_uri 'https://m.np.playstation.net/api'

    attr_accessor :refresh_token, :default_headers, :account_id, :country, :language, :age

    def initialize(refresh_token, account_id: 'me', country: 'GB', language: 'en')
      @refresh_token = refresh_token
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
      PlayStationNetworkAPI::Catalog.new(refresh_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def entitlement
      PlayStationNetworkAPI::Entitlement.new(refresh_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def explore
      PlayStationNetworkAPI::Explore.new(refresh_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def game
      PlayStationNetworkAPI::Game.new(refresh_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def search
      PlayStationNetworkAPI::Search.new(refresh_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def session
      PlayStationNetworkAPI::Session.new(refresh_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def trophy
      PlayStationNetworkAPI::Trophy.new(refresh_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def user
      PlayStationNetworkAPI::User.new(refresh_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end
      
    # @private true
    def get_account_id
      self.class.base_uri 'https://dms.api.playstation.com/api'

      # https://dms.api.playstation.com/api/v1/devices/accounts/me
      get('/v1/devices/accounts/me').parsed_response['accountId']
    end

    def get_account_devices
      self.class.base_uri 'https://dms.api.playstation.com/api'

      # https://dms.api.playstation.com/api/v1/devices/accounts/me
      get('/v1/devices/accounts/me').parsed_response['accountDevices']
    end

  protected

    def get(url, options = {})
      access_token = PlayStationNetworkAPI::Session.new(refresh_token).access_token
      
      base_uri = options[:base_uri]
      options.delete(:base_uri)

      headers = options[:headers] || {}
      options.delete(:headers)

      self.class.base_uri base_uri if base_uri

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