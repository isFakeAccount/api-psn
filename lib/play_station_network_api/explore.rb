module PlayStationNetworkAPI
  class Explore < Client
    attr_accessor :account_id

    def initialize(account_id = '6462910331343535058')
      @account_id = account_id
    end

    # GET https://m.np.playstation.net/api/explore/v1/users/6462910331343535058/hub
    def hub
      get([path, account_id, 'hub'].join('/')).parsed_response
    end

    # GET https://m.np.playstation.net/api/explore/v1/users/6462910331343535058/actionCard
    def action_card
      raise 'Access Denied'
      get([path, account_id, 'actionCard'].join('/')).parsed_response
    end

  private

    def path
      '/explore/v1/users'
    end
  end
end