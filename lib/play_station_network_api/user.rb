module PlayStationNetworkAPI
  class User
    attr_accessor :token, :identity

    USERS_ENDPOINT     ||= 'https://%s-prof.np.community.playstation.net/userProfile/v1/users/%s'
    GAMES_ENDPOINT     ||= 'https://gamelist.api.playstation.com/v1/users/%s'
    TROPHY_ENDPOINT    ||= 'https://%s-tpy.np.community.playstation.net/trophy/v1/'
    COMMUNITY_ENDPOINT ||= 'https://communities.api.playstation.com/v1/'
    ACTIVITY_ENDPOINT  ||= 'https://activity.api.np.km.playstation.net/activity/api/v2/users/%s/'

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

    # Get the games of a given Identity
    #
    # This only seems to get the PS4 titles and the information returned is quite
    # limited. Instead, we'll use the same endpoint the app is using to fetch
    # the games. This will remain as we get a nicer list
    #
    def games(limit: 100, offset: 0, include_ps3: false, language: 'en-GB', region: 'gb')

      if include_ps3

        # Returns all the User's games, including the PS3 and PSVITA ones.
        # Note that the data returned by this endpoints is different than the '/titles' one.
        #
        # {
        #   "npCommunicationId" => "NPWR15120_00",
        #   "trophyTitleName" => "Ghost of Tsushima",
        #   "trophyTitleDetail" => "Trophy set for Ghost of Tsushima",
        #   "trophyTitleIconUrl" => "http://trophy01.np.community.playstation.net/trophy/np/NPWR15120_00_00736F40BFE5A427C57A238478A141FABB81ABA3C7/F7780A7B9141F2A1D0B68E578787D962D7F69C31.PNG",
        #   "trophyTitlePlatfrom" => "PS4",
        #   "hasTrophyGroups" => false,
        #   "definedTrophies" => {
        #     "bronze" => 40,
        #     "silver" => 9,
        #     "gold" => 2,
        #     "platinum" => 1
        #   },
        #   "fromUser" => {
        #     "onlineId" => "pacMakaveli90",
        #     "progress" => 22,
        #     "earnedTrophies" => {
        #       "bronze" => 16,
        #       "silver" => 0,
        #       "gold" => 0,
        #       "platinum" => 0
        #     },
        #     "hiddenFlag" => false,
        #     "lastUpdateDate" => "2020-09-01T20:54:56Z"
        #   }
        # }
        #

        endpoint = format(TROPHY_ENDPOINT, region)
        url = '/trophyTitles'
        query = {
          fields: '@default',
          platform: 'PS3,PS4,PSVITA',
          npLanguage: language,
          comparedUser: identity
        }

      else

        # {
        #   "titleId" => "CUSA13323_00",
        #   "name" => "Ghost of Tsushima",
        #   "image" => "https://image.api.np.km.playstation.net/images/?format=png&image=http%3A%2F%2Fgs2-sec.ww.prod.dl.playstation.net%2Fgs2-sec%2Fappkgo%2Fprod%2FCUSA13323_00%2F8%2Fi_79e6fad7f6d7610ec23583faf0f43c6a09057193f811583539f88f632cbe8fd7%2Fi%2Ficon0.png&sign=599d63007b7c2d555d376b43d5a8808adc9cbf35&w=512&h=512",
        #   "privacy"=>"PUBLIC"
        # }
        #
        endpoint = format(GAMES_ENDPOINT, identity)
        url = '/titles'
        query = {
          type: 'owned,played',
          app: 'richProfile',
          sort: '-lastPlayedDate',
        }

      end

      request = PlayStationNetworkAPI::Client.new(base_uri: endpoint ).get(url,
        headers: { 'Authorization': "Bearer #{ token }" },
        query: {
          limit: limit,
          offset: offset
        }.merge(query)
      )

      request.parsed_response
    end

    # Get friends of a given Identity
    #
    def friends(sort: 'onlineStatus', offset: 0, limit: 100, region: 'gb')
      request = PlayStationNetworkAPI::Client.new(base_uri: format(USERS_ENDPOINT, region, identity))
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

      # TODO: Deal with condensed stories
      #
      request.parsed_response
    end
  end
end