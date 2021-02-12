module PlayStationNetworkAPI
  class Explore < PlayStationNetworkAPI::Client
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