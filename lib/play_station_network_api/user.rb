module PlayStationNetworkAPI
  class User
    attr_accessor :token, :identity

    USERS_ENDPOINT     ||= 'https://%s-prof.np.community.playstation.net/userProfile/v1/users/%s'
    COMMUNITY_ENDPOINT ||= 'https://communities.api.playstation.com/v1/'
    ACTIVITY_ENDPOINT  ||= 'https://activity.api.np.km.playstation.net/activity/api/v2/users/%s/'
    GAMES_ENDPOINT     ||= 'https://gamelist.api.playstation.com/v1/users/%s'
    TROPHY_ENDPOINT    ||= 'https://%s-tpy.np.community.playstation.net/trophy/v1/'

    def initialize(refresh_token, identity)
      @token = PlayStationNetworkAPI::Client.new(refresh_token).login
      @identity = identity
    end

    def info(region: 'gb')
      request = PlayStationNetworkAPI::Client.new(base_uri: format(USERS_ENDPOINT, region, identity))
        .get('/profile2', headers: { 'Authorization': "Bearer #{ token }" },
          query: {
            fields: 'npId,onlineId,currentOnlineId,displayableOldOnlineId,accountId,avatarUrls,plus,aboutMe,languagesUsed,trophySummary(@default,level,progress,earnedTrophies),isOfficiallyVerified,personalDetail(@default,profilePictureUrls),personalDetailSharing,personalDetailSharingRequestMessageFlag,primaryOnlineStatus,presences(@default,@titleInfo,platform,lastOnlineDate,hasBroadcastData),friendRelation,requestMessageFlag,blocking,mutualFriendsCount,following,followerCount,friendsCount,followingUsersCount,consoleAvailability',
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
    def friends(sort: 'onlineStatus', offset: 0, limit: 100)
      request = PlayStationNetworkAPI::Client.new(base_uri: format(USERS_ENDPOINT, identity))
        .get('/friends/profiles2', headers: { 'Authorization': "Bearer #{ token }" },
          query: {
            fields: 'npId,onlineId,accountId,avatarUrls,plus,aboutMe,languagesUsed,trophySummary(@default,level,progress,earnedTrophies),isOfficiallyVerified,personalDetail(@default,profilePictureUrls),personalDetailSharing,personalDetailSharingRequestMessageFlag,primaryOnlineStatus,presences(@default,@titleInfo,platform,lastOnlineDate,hasBroadcastData),requestMessageFlag,blocking,friendRelation,following,consoleAvailability',
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
    # This only seems to get the PS4 titles and the information returned is quite limited.
    # Instead, we'll use the same endpoint the app is using to fetch the games. This will remain as we get a nicer list
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

    def trophies(limit: 100, offset: 0, language: 'en-GB', region: 'gb')
      request = PlayStationNetworkAPI::Client.new(base_uri: format(TROPHY_ENDPOINT, region))
        .get('/trophyTitles', headers: { 'Authorization': "Bearer #{ token }" },
          query: {
            limit: limit,
            offset: offset,
            fields: '@default',
            platform: 'PS3,PS4,PSVITA',
            npLanguage: language,
            comparedUser: identity
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