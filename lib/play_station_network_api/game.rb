module PlayStationNetworkAPI
  class Game < Client
    attr_accessor :account_id

    # account_id [Integer]
    def initialize(account_id = 'me')
      @account_id = account_id
    end

    # @private false
    # offset [Integer]
    # limit [Integer] {
    #   min: 1,
    #   max: 300
    # }
    def titles(offset: 0, limit: 10)
      raise 'limit must be less than or equal to 300' if limit > 300

      # https://m.np.playstation.net/api/gamelist/v2/users/6462910331343535058/titles?limit=300&offset=0
      get([path, account_id, 'titles'].join('/'),
        query: {
          offset: offset,
          limit: limit
        }
      ).parsed_response
    end

    # @private false
    # title_id [String]
    def title(title_id)
      # https://m.np.playstation.net/api/gamelist/v2/users/6462910331343535058/titles/CUSA00938_00
      get([path, account_id, 'titles', title_id].join('/')).parsed_response
    end

    # COMMENT: Pretty much the same endpoint as [titles], except it gives a lot less data and there's no conceptId information
    # 
    # @private false
    # offset [Integer]
    # limit [Integer] {
    #   min: 1,
    #   max: 300
    # }
    def games(offset: 0, limit: 10)
      raise 'limit must be less than or equal to 300' if limit > 300

      # https://m.np.playstation.net/api/gamelist/v3/users/6462910331343535058/profile/games?limit=300&offset=0
      get([path(version: 3), account_id, 'profile', 'games'].join('/'),
        query: {
          offset: offset,
          limit: limit
        }
      ).parsed_response
    end

  private

    def path(version: 2, resource: 'users')
      "/gamelist/v#{ version }/#{ resource }/"
    end
  end
end

# getAccountIdsOfFriendsWhoOwnOrPlayedThisGame: function (t, s) {
# 	return { Works
# 		endpoint: "/v2/users/{userId}/concepts/{conceptId}/friends",
# 	};
# },

# getPlayersByTitleId: function (t, s) {
# 	return { Access Denied
# 		endpoint: "/v2/titles/{titleId}/players",
# 	};
# },

# getPlayCountsByUserId: function (t, s) {
# 	return { Access Denied
# 		endpoint: "/v2/users/{userId}/playCounts",
# 	};
# },

# getTitleListByUserId: function (t, s) {
# 	return { Access Denied
# 		endpoint: "/v2/users/{userId}/stats",
# 	};
# },

# getPlayedTitleIdsByUserId: function (t, s) {
# 	return { Access Denied
# 		endpoint: "/v2/users/{userId}/titles/{titleId}/stats",
# 	};
# },

# getUsersUserIdPlayedTitleIds: function (t, s) {
# 	return { Access Denied
# 		endpoint: "/v2/users/{userId}/titleIds",
# 			{ "Content-Type": "application/json" },
# },

# getTitleSummaryByUserId: function (t, s) {
# 	return { Access Denied
# 		endpoint: "/v2/users/{userId}/titleSummary",
# 	};
# },

# getTitleInfoByUserId: function (t, s) {
# 	return { Access Denied
# 		endpoint: "/v2/users/{userId}/titles/{titleId}",
# 	};
# },

# getStatsTemplateByNpcommid: function (t, s) {
# 	return { Access Denied
# 		endpoint: "/v2/templates/{npCommId}/stats",
# 	};
# },
