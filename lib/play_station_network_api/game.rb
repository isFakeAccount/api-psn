module PlayStationNetworkAPI
  class Game
    attr_accessor :refresh_token, :token, :title_id, :communication_id

    GAME_ENDPOINT   ||= 'https://gamelist.api.playstation.com/v1/'
    TROPHY_ENDPOINT ||= 'https://%s-tpy.np.community.playstation.net/trophy/v1/'

    def initialize(refresh_token, title_id)
      @refresh_token = refresh_token
      @token = PlayStationNetworkAPI::Client.new(refresh_token).login

      @title_id = title_id
      @communication_id = title_id
    end

    # {
    #   "totalResults": 1,
    #   "trophyTitles": [
    #     {
    #       "npCommunicationId": "NPWR07466_00",
    #       "trophyTitleName": "Rocket League®",
    #       "trophyTitleDetail": "Rocket League® Trophy Set",
    #       "trophyTitleIconUrl": "http://trophy01.np.community.playstation.net/trophy/np/NPWR07466_00_002B372EA023E6E03E3194E148C0B2BF285AD8CE49/7E97D451B278DACDDD0CA8D59AFF7BF62E1A6560.PNG",
    #       "trophyTitlePlatfrom": "PS4",
    #       "hasTrophyGroups": true,
    #       "definedTrophies": {
    #         "bronze": 51,
    #         "silver": 24,
    #         "gold": 12,
    #         "platinum": 1
    #       },
    #       "fromUser": {
    #         "onlineId": "pacMakaveli90",
    #         "progress": 94,
    #         "earnedTrophies": {
    #           "bronze": 49,
    #           "silver": 23,
    #           "gold": 11,
    #           "platinum": 1
    #         },
    #         "hiddenFlag": false,
    #         "lastUpdateDate": "2020-05-21T23:11:57Z"
    #       }
    #     }
    #   ]
    # }
    #
    def trophy_info(identity = nil, region: 'gb')
      params = {}
      params[:comparedUser] = identity if identity

      request = PlayStationNetworkAPI::Client.new(base_uri: format(TROPHY_ENDPOINT, region))
        .get("/trophyTitles/#{ communication_id }",
          headers: { 'Authorization': "Bearer #{ token }" },
          query: {
            # platform: ''
            npLanguage: 'en'
          }.merge(params)
        )
      
      error = {
        code: request.dig('error', 'code'),
        message_api: request.dig('error', 'message'),
        message_gem: "The 'communication_id' returned no results, we tried querying the API for you, in order to get the required 'title_id' with no success.\n You will have to manually find the 'communication' for this game in order to return a User's Trophies.\nPlease note 'communication_id' starts with 'NP*'"
      }

      if request.dig('error', 'code') == 2138125
        unless (title_id = get_communication_id).nil?
          self.class.new(refresh_token, title_id).trophy_info
        end
      elsif request['error']
        error
      else
        request.parsed_response
      end
    end

    # {
    #   "trophyTitleName": "Rocket League®",
    #   "trophyTitleDetail": "Rocket League® Trophy Set",
    #   "trophyTitleIconUrl": "http://trophy01.np.community.playstation.net/trophy/np/NPWR07466_00_002B372EA023E6E03E3194E148C0B2BF285AD8CE49/7E97D451B278DACDDD0CA8D59AFF7BF62E1A6560.PNG",
    #   "trophyTitleSmallIconUrl": "http://trophy01.np.community.playstation.net/trophy/np/NPWR07466_00_002B372EA023E6E03E3194E148C0B2BF285AD8CE49/9F1057634EDA80216C0D88F7CD464A6C5B6DBE25.PNG",
    #   "trophyTitlePlatfrom": "PS4",
    #   "definedTrophies": {
    #     "bronze": 51,
    #     "silver": 24,
    #     "gold": 12,
    #     "platinum": 1
    #   },
    #   "trophyGroups": [
    #     {
    #       "trophyGroupId": "default",
    #       "trophyGroupName": "Rocket League®",
    #       "trophyGroupDetail": "Rocket League® Trophy Set",
    #       "trophyGroupIconUrl": "http://trophy01.np.community.playstation.net/trophy/np/NPWR07466_00_002B372EA023E6E03E3194E148C0B2BF285AD8CE49/7E97D451B278DACDDD0CA8D59AFF7BF62E1A6560.PNG",
    #       "trophyGroupSmallIconUrl": "http://trophy01.np.community.playstation.net/trophy/np/NPWR07466_00_002B372EA023E6E03E3194E148C0B2BF285AD8CE49/9F1057634EDA80216C0D88F7CD464A6C5B6DBE25.PNG",
    #       "definedTrophies": {
    #         "bronze": 20,
    #         "silver": 10,
    #         "gold": 5,
    #         "platinum": 1
    #       },
    #       "fromUser": {
    #         "onlineId": "pacMakaveli90",
    #         "progress": 100,
    #         "earnedTrophies": {
    #           "bronze": 20,
    #           "silver": 10,
    #           "gold": 5,
    #           "platinum": 1
    #         },
    #         "hiddenFlag": false,
    #         "lastUpdateDate": "2020-05-21T23:11:57Z"
    #       }
    #     },
    #     ...
    #   ]
    # }
    # 
    def trophy_groups(region: 'gb')
      request = PlayStationNetworkAPI::Client.new(base_uri: format(TROPHY_ENDPOINT, region))
        .get("/trophyTitles/#{ communication_id }/trophyGroups",
          headers: { 'Authorization': "Bearer #{ token }" },
          query: {
            fields: '@default,trophyTitleSmallIconUrl,trophyGroupSmallIconUrl',
            iconSize: 'm', # [s, m]
            npLanguage: 'en'
          }
        )

      request.parsed_response
    end

    # {
    #   "trophies": [
    #     {
    #         "trophyId": 0,
    #         "trophyHidden": false,
    #         "trophyType": "platinum",
    #         "trophyName": "Virtuoso",
    #         "trophyDetail": "Unlock All Trophies",
    #         "trophyIconUrl": "http://trophy01.np.community.playstation.net/trophy/np/NPWR07466_00_002B372EA023E6E03E3194E148C0B2BF285AD8CE49/767E69612A5AB876C31DEEADF3747D20F3334E18.PNG",
    #         "fromUser": {
    #           "onlineId": "pacMakaveli90",
    #           "earned": true,
    #           "earnedDate": "2015-08-29T21:01:14Z"
    #         }
    #     },
    #     ...
    #   ]
    # }
    #
    def trophies(identity = nil, trophy_group: 'all', region: 'gb')
      params = {}
      params[:comparedUser] = identity if identity

      request = PlayStationNetworkAPI::Client.new(base_uri: format(TROPHY_ENDPOINT, region))
        .get("/trophyTitles/#{ communication_id }/trophyGroups/#{ trophy_group }/trophies",
          headers: { 'Authorization': "Bearer #{ token }" },
          query: {
            fields: '@default,groupId,trophyRare,trophyEarnedRate,hasTrophyGroups,trophySmallIconUrl',
            visibleType: '1',
            iconSize: 'm',
            npLanguage: 'en'
          }.merge(params)
        )

      request.parsed_response
    end

    # Logged in User's friends that own the game
    #
    # {
    #   "start": 0,
    #   "size": 10,
    #   "totalResults": 35,
    #   "data": [
    #     {
    #       "accountId": "5703447557297538417",
    #       "onlineId": "Frittux",
    #       "profilePicUrl": "https://psn-rsc.prod.dl.playstation.net/psn-rsc/avatar/EP2025/CUSA05221_00-AV00000000000005_80633B898E819FF66A33_l.png",
    #       "lastPlayed": "2020-09-22T16:08:19Z",
    #       "avatarUrl": "https://psn-rsc.prod.dl.playstation.net/psn-rsc/avatar/EP2025/CUSA05221_00-AV00000000000005_80633B898E819FF66A33_l.png"
    #     },
    #     ...
    #   ]
    # }
    # 
    def players
      request = PlayStationNetworkAPI::Client.new(base_uri: GAME_ENDPOINT)
        .get("/titles/#{ title_id }/players",
          headers: { 'Authorization': "Bearer #{ token }" }
        )

      request.parsed_response
    end

    # {
    #   "apps": [
    #     {
    #       "npTitleId": "CUSA01433_00",
    #       "trophyTitles": [
    #         {
    #           "npCommunicationId": "NPWR07466_00",
    #           "trophyTitleName": "Rocket League®",
    #           "trophyTitleIconUrls": [
    #             {
    #               "size": "s",
    #               "trophyTitleIconUrl": "https://trophy01.np.community.playstation.net/trophy/np/NPWR07466_00_002B372EA023E6E03E3194E148C0B2BF285AD8CE49/9F1057634EDA80216C0D88F7CD464A6C5B6DBE25.PNG"
    #             },
    #             {
    #               "size": "m",
    #               "trophyTitleIconUrl": "https://trophy01.np.community.playstation.net/trophy/np/NPWR07466_00_002B372EA023E6E03E3194E148C0B2BF285AD8CE49/7E97D451B278DACDDD0CA8D59AFF7BF62E1A6560.PNG"
    #             }
    #           ],
    #           "users": []
    #         }
    #       ]
    #     }
    #   ]
    # }
    #
    def get_communication_id(region: 'gb')
      request = PlayStationNetworkAPI::Client.new(base_uri: format(TROPHY_ENDPOINT, region))
        .get('/apps/trophyTitles',
          headers: { 'Authorization': "Bearer #{ token }" },
          query: {
            npTitleIds: communication_id,
            fields: '@default',
            npLanguage: 'en'
          }
        )

      request.dig('apps', 0, 'trophyTitles', 0, 'npCommunicationId')
    end

    def get_title_id
      # TODO
    end

    # {
    #   "data": {
    #     "relationships": {
    #       "children": {
    #         "data": [
    #           {
    #             "id": "EP0006-CUSA00049_00-BATTLEFIELD40000",
    #             "type": "game"
    #           }
    #         ]
    #       }
    #     }
    #   },
    #   "included": []
    # }
    def get_store_id
      request = PlayStationNetworkAPI::Client.new(base_uri: 'https://store.playstation.com//valkyrie-api/en/GB/19')
        .get("/resolve/#{ title_id }")

      request.parsed_response.dig('data', 'relationships', 'children', 'data', 0, 'id')
    end
  end
end
