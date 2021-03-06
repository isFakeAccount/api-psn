module PlayStationNetworkAPI
  class User < PlayStationNetworkAPI::Client

    # @private false
    def profile
      # https://m.np.playstation.net/api/userProfile/v1/internal/users/6462910331343535058/profiles
      get([path, account_id, 'profiles'].join('/')).parsed_response
    end

    # @private false
    # account_ids [Array[Integer]]
    def profiles(account_ids)
      raise 'account_ids size must be less than or equal to 100' if account_ids.length > 100

      # https://m.np.playstation.net/api/userProfile/v1/internal/users/profiles?accountIds=6462910331343535058
      get([path, 'profiles'].join('/'),
        query: {
          accountIds: account_ids.split.join(',')
        }
      ).parsed_response
    end

    # @private false
    def presence
      # https://m.np.playstation.net/api/userProfile/v1/internal/users/6462910331343535058/basicPresences?type=primary
      get([path, account_id, 'basicPresences'].join('/'),
        query: {
          type: 'primary'
        }
      ).parsed_response
    end
    
    # @private false
    # account_ids [Array[Integer]]
    def presences(account_ids)
      raise 'account_ids size must be less than or equal to 100' if account_ids.length > 100

      # https://m.np.playstation.net/api/userProfile/v1/internal/users/me/basicPresences?type=primary
      get([path, 'basicPresences'].join('/'),
        query: {
          type: 'primary',
          accountIds: account_ids.split.join(',')
        }
      ).parsed_response
    end

    # @private false
    # limit [Integer] {
    #   min: 1,
    #   max: 1000
    # }
    def friends(limit: 1000)
      raise 'limit must be less than or equal to 1000' if limit > 1000
      
      # https://m.np.playstation.net/api/userProfile/v1/internal/users/me/friends?limit=1000
      get([path, account_id, 'friends'].join('/'),
        query: {
          limit: limit
        }
      ).parsed_response
    end

    # @private true
    # friend_account_id [Integer]
    def friendship(friend_account_id)
      # https://m.np.playstation.net/api/userProfile/v1/internal/users/me/friends/9014970682312518995/summary
      get([path, 'me', 'friends', friend_account_id, 'summary'].join('/')).parsed_response
    end

    # @private true
    # type [Symbol] => :received, :sent
    def friend_requests(type: :received)
      # https://m.np.playstation.net/api/userProfile/v1/internal/users/me/friends/9014970682312518995/summary
      get([path, 'me', 'friends', "#{ type.to_s }Requests"].join('/')).parsed_response
    end

    # @private true
    def blocks
      # https://m.np.playstation.net/api/userProfile/v1/internal/users/me/blocks
      get([path, 'me', 'blocks'].join('/')).parsed_response
    end

    # @private true
    def available_to_play
      # https://m.np.playstation.net/api/userProfile/v1/internal/users/me/friends/subscribing/availableToPlay
      get([path, 'me', 'friends', 'subscribing', 'availableToPlay'].join('/')).parsed_response
    end

  private

    def path
      '/userProfile/v1/internal/users'.freeze
    end
  end
end