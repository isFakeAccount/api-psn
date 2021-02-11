module PlayStationNetworkAPI
  class Explore < Client
    attr_accessor :account_id
    
    # account_id [Integer]
    def initialize(account_id = 'me')
      @account_id = account_id
    end

    def hub
      # https://m.np.playstation.net/api/explore/v1/users/6462910331343535058/hub
      get([path, account_id, 'hub'].join('/')).parsed_response
    end

  private

    def path
      '/explore/v1/users'.freeze
    end
  end
end