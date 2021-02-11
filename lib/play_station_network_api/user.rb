module PlayStationNetworkAPI
  class User < Client
		attr_accessor :account_id

		def initialize(account_id = '6462910331343535058')
			@account_id = account_id
		end

    # https://dms.api.playstation.com/api/v1/devices/accounts/me
    def self.account_id
      HTTParty.get('https://dms.api.playstation.com/api/v1/devices/accounts/me').parsed_response
    end

    # https://m.np.playstation.net/api/userProfile/v1/internal/users/6462910331343535058/profiles
    def profile
			get([path, account_id, 'profiles'].join('/')).parsed_response
    end

    # https://m.np.playstation.net/api/userProfile/v1/internal/users/profiles?accountIds=6462910331343535058
    def profiles(account_ids)
			raise 'account_ids size must be less than or equal to 100' if account_ids.length > 100

      get([path, 'profiles'].join('/'),
        query: {
          accountIds: account_ids.split.join(',')
        }
      ).parsed_response
    end

    # https://m.np.playstation.net/api/userProfile/v1/internal/users/6462910331343535058/basicPresences?type=primary
    def presence
      get([path, account_id, 'basicPresences'].join('/'),
        query: {
          type: 'primary'
        }
      ).parsed_response
    end

    # https://m.np.playstation.net/api/userProfile/v1/internal/users/me/basicPresences?type=primary
    def presences(account_ids)
			raise 'account_ids size must be less than or equal to 100' if account_ids.length > 100

      get([path, 'basicPresences'].join('/'),
        query: {
          type: 'primary',
          accountIds: account_ids.split.join(',')
        }
      ).parsed_response
    end

    # https://m.np.playstation.net/api/userProfile/v1/internal/users/me/friends?limit=1000
    def friends(limit: 1000)
			raise 'limit must be less than or equal to 1000' if limit > 1000
			
      get([path, account_id, 'friends'].join('/'),
        query: {
          limit: limit
        }
      ).parsed_response
    end

    # https://m.np.playstation.net/api/userProfile/v1/internal/users/me/friends/9014970682312518995/summary
    def friendship(account_id)
      get([path, 'me', 'friends', account_id, 'summary'].join('/')).parsed_response
    end

    # https://m.np.playstation.net/api/userProfile/v1/internal/users/me/friends/9014970682312518995/summary
    # 
    # type [Symbol]: [:received, :sent]
    def friend_requests(type: :received)
      get([path, 'me', 'friends', "#{ type.to_s }Requests"].join('/')).parsed_response
    end

    # https://m.np.playstation.net/api/userProfile/v1/internal/users/me/blocks
    def blocks
      get([path, 'me', 'blocks'].join('/')).parsed_response
    end

    # https://m.np.playstation.net/api/userProfile/v1/internal/users/me/friends/subscribing/availableToPlay
    def available_to_play
      get([path, 'me', 'friends', 'subscribing', 'availableToPlay'].join('/')).parsed_response
    end

  private

    def path
      '/userProfile/v1/internal/users'      
    end
  end
end

# getFollowingConceptsInternal: function (n, t) {
#   return { Access Denied
#     method: "GET",
#     endpoint:
#       "/v1/internal/users/{accountId_or_me}/followings/concepts",
#   };
# },
# putFollowingConceptInternal: function (n, t) {
#   return { Not tested, dependent on previous endpoint
#     method: "PUT",
#     endpoint:
#       "/v1/internal/users/me/followings/concepts/{conceptId}",
#   };
# },
# getAvailabilitiesInternal: function (n, t) {
#   return { Access Denied
#     method: "GET",
#     endpoint: "/v1/internal/users/{accountId_or_me}/availability",
#   };
# },
# getMultiAvailabilitiesInternal: function (n, t) {
#   return { Access Denied
#     method: "GET",
#     endpoint: "/v1/internal/users/availabilities",
#   };
# },
# getDoNotDisturbSettingInternal: function (n, t) {
#   return { Access Denied
#     method: "GET",
#     endpoint: "/v1/internal/users/me/userSettings/doNotDisturb",
#   };
# },
# getBusySettingInternal: function (n, t) {
#   return { Works but useless
#     method: "GET",
#     endpoint: "/v1/internal/users/me/userSettings/busy",
#   };
# },
# getAppearOfflineSettingInternal: function (n, t) {
#   return { Works but useless
#     method: "GET",
#     endpoint: "/v1/internal/users/me/userSettings/appearOffline",
#   };
# },
# getReceivedRequestPersonalDetailsInternal: function (n, t) {
#   return { Works but requires some additional params, I think. Needs more info
#     method: "GET",
#     endpoint:
#       "/v1/internal/users/me/friends/receivedRequests/personalDetails",
#   };
# },
# getFriendsPlayingThisGameInternal: function (n, t) {
#   return { Access Denied
#     method: "GET",
#     endpoint:
#       "/v1/internal/users/me/playingFriends/concepts/{conceptId}",
#   };
# },