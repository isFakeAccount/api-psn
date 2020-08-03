module PlayStationNetworkAPI
  class User
    attr_accessor :token, :identity

    USERS_ENDPOINT     ||= 'https://gb-prof.np.community.playstation.net/userProfile/v1/users/%s'
    COMMUNITY_ENDPOINT ||= 'https://communities.api.playstation.com/v1/'
    ACTIVITY_ENDPOINT  ||= 'https://activity.api.np.km.playstation.net/activity/api/v2/users/%s/'
    GAMES_ENDPOINT     ||= 'https://gamelist.api.playstation.com/v1/users/%s'

    def initialize(identity)
      @token = PlayStationNetworkAPI::Client.new().login
      @identity = identity
    end

    def info
      request = PlayStationNetworkAPI::Client.new(base_uri: format(USERS_ENDPOINT, identity))
        .get('/profile2', headers: { 'Authorization': "Bearer #{ token }" },
          query: {
            # fields: 'npId,onlineId,accountId,avatarUrls,plus,aboutMe,languagesUsed,trophySummary(@default,level,progress,earnedTrophies),isOfficiallyVerified,personalDetail(@default,profilePictureUrls),personalDetailSharing,personalDetailSharingRequestMessageFlag,primaryOnlineStatus,presences(@titleInfo,hasBroadcastData),friendRelation,requestMessageFlag,blocking,mutualFriendsCount,following,followerCount,friendsCount,followingUsersCount',
            fields: 'npId,onlineId,accountId,avatarUrls,plus,aboutMe,languagesUsed,trophySummary(@default,level,progress,earnedTrophies),isOfficiallyVerified,personalDetail,personalDetail(@default,profilePictureUrls),personalDetailSharing,personalDetailSharingRequestMessageFlag,primaryOnlineStatus,presences(@default,platform,@titleInfo,hasBroadcastData),friendRelation,requestMessageFlag,blocking,mutualFriendsCount,following,followerCount,friendsCount,followingUsersCount,consoleAvailability,currentOnlineId,displayableOldOnlineId',
            avatarSizes: 'xl',
            profilePictureSizes: 'xl',
            languagesUsedLanguageSet: 'set3',
            psVitaTitleIcon: 'circled',
            titleIconSize: 's'
          }
        )

      request.parsed_response
    end

    # Get friends of a given Identity
    #
    def friends(sort: 'onlineStatus', offset: 0, limit: 25)
      request = PlayStationNetworkAPI::Client.new(base_uri: format(USERS_ENDPOINT, identity))
        .get('/friends/profiles2', headers: { 'Authorization': "Bearer #{ token }" },
          query: {
            fields: 'onlineId,accountId,avatarUrls,plus,trophySummary(@default),isOfficiallyVerified,personalDetail(@default,profilePictureUrls),presences(@titleInfo,hasBroadcastData,lastOnlineDate),presences(@titleInfo),friendRelation,consoleAvailability',
            offset: offset,
            limit: limit,
            profilePictureSizes: 'xl',
            avatarSizes: 'xl',
            titleIconSize: 's',
            sort: sort
          }
        )

      request.parsed_response
    end

    # Get the games of a given Identity
    # 
    def games(limit: 100, offset: 0)
      request = PlayStationNetworkAPI::Client.new(base_uri: format(GAMES_ENDPOINT, identity))
        .get('/titles', headers: { 'Authorization': "Bearer #{ token }" },
          query: {
            type: 'played',
            app: 'richProfile',
            sort: '-lastPlayedDate',
            limit: limit,
            offset: offset
          }
        )

      request.parsed_response
    end

    # Get the communities of a given Identity
    # 
    def communities(limit: 25, offset: 0)
      request = PlayStationNetworkAPI::Client.new(base_uri: COMMUNITY_ENDPOINT)
        .get('/communities', headers: { 'Authorization': "Bearer #{ token }" },
          query: {
            fields: 'backgroundImage,description,id,isCommon,members,name,profileImage,role,unreadMessageCount,sessions,timezoneUtcOffset,language,titleName',
            includeFields: 'gameSessions,timezoneUtcOffset,parties',
            limit: limit,
            sort: 'common',
            offset: offset,
            onlineId: identity
          }
        )

      request.parsed_response
    end

    # Get the PlayStation Network Activity of a given Identity
    # 
    def activity(page: 0, offset: 0, size: 25, include_comments: true)
      request = PlayStationNetworkAPI::Client.new(base_uri: format(ACTIVITY_ENDPOINT, identity))
        .get("/feed/#{ page }", headers: { 'Authorization': "Bearer #{ token }" },
          query: {
            includeComments: include_comments,
            blockSize: size,
            offset: offset
          }
        )

      # 
      # TODO: Deal with condensed stories
      # 

      request.parsed_response
    end

    def add

    end

    def remove

    end

    def block

    end

    def unblock

    end

  end
end