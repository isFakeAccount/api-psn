module PlayStationNetworkAPI
  class Trophy < PlayStationNetworkAPI::Client
    # TODO: Test against PS5 titles, using 'trophy2' as the npServiceName
    
    def summary
      # https://m.np.playstation.net/api/trophy/v1/users/6462910331343535058/trophySummary
      get([path, 'trophySummary'].join('/')).parsed_response
    end

    # title_ids [Array[String]]
    # offset [Integer]
    # limit [Integer] {
    #   min: 1,
    #   max: 1000
    # }
    def titles(title_ids = [], offset: 0, limit: 10)
      raise 'title_ids size must be less than or equal to 5' if title_ids.length > 5
      raise 'limit must be less than or equal to 5000' if limit > 5000

      if title_ids.empty?
        # https://m.np.playstation.net/api/trophy/v1/users/6462910331343535058/trophyTitles
        get([path, 'trophyTitles'].join('/'),
          query: {
            offset: offset,
            limit: limit
          }
        ).parsed_response
        
        # TODO: Cast every response to a Model
        # return PlayStationNetworkAPI::Models::Trophy.new(request.parsed_response)
      else
        # https://m.np.playstation.net/api/trophy/v1/users/6462910331343535058/titles/trophyTitles?npTitleIds=CUSA00054_00,CUSA07970_00,CUSA00208_00,CUSA00938_00,CUSA01985_00

        get([path, 'titles', 'trophyTitles'].join('/'),
          query: {
            npTitleIds: title_ids.join(',')
          }
        ).parsed_response
      end
    end

    # communication_id [String]
    def trophy_groups(communication_id)
      url = if account_id
        # https://m.np.playstation.net/api/trophy/v1/users/6462910331343535058/npCommunicationIds/NPWR00133_00/trophyGroups?npServiceName=trophy
        [path, 'npCommunicationIds', communication_id, 'trophyGroups']
      else
        # https://m.np.playstation.net/api/trophy/v1/npCommunicationIds/NPWR00133_00/trophyGroups?npServiceName=trophy
        [path(communication_id), 'trophyGroups']
      end

      get(url.join('/'),
        query: {
          npServiceName: 'trophy'
        }
      ).parsed_response
    end

    # communication_id [String]
    # trophy_group_id [String | Integer] => 'default', '001', 002
    def trophies(communication_id, trophy_group_id = nil)
      # BROKEN: https://m.np.playstation.net/api/trophy/v1/users/6462910331343535058/npCommunicationIds/NPWR00133_00/trophies?npServiceName=trophy
      # https://m.np.playstation.net/api/trophy/v1/users/6462910331343535058/npCommunicationIds/NPWR00133_00/trophyGroups/default/trophies?npServiceName=trophy
      get([path, 'npCommunicationIds', communication_id, 'trophyGroups', ([trophy_group_id, 'trophies'] if trophy_group_id)].flatten.compact.join('/'),
        query: {
          npServiceName: 'trophy'
        }
      ).parsed_response
    end

    # communication_id [String]
    # trophy_id [Integer]
    def trophy_details(communication_id, trophy_id)
      url = if account_id
        # https://m.np.playstation.net/api/trophy/v1/npCommunicationIds/NPWR00133_00/trophies/2?npServiceName=trophy
        [path, 'npCommunicationIds', communication_id, 'trophies', trophy_id]
      else
        # https://m.np.playstation.net/api/trophy/v1/users/6462910331343535058/npCommunicationIds/NPWR00133_00/trophies/2?npServiceName=trophy
        [path(communication_id), 'trophies', trophy_id]
      end

      get(url.join('/'),
        query: {
          npServiceName: 'trophy'
        }
      ).parsed_response
    end

    # title_ids Array[[String]]
    def get_communication_id(title_ids = [])
      # https://gb-tpy.np.community.playstation.net/trophy/v1/apps/trophyTitles?npTitleIds=CUSA15010_00,CUSA20046_00,CUSA24894_00,CUSA24269_00,CUSA24267_00
      get('/trophy/v1/apps/trophyTitles',
        base_uri: 'https://gb-tpy.np.community.playstation.net',
        query: {
          npTitleIds: title_ids.join(',')
        },
        
      ).parsed_response
    end

  private

    def path(communication_id = nil)
      if communication_id
        "/trophy/v1/npCommunicationIds/#{ communication_id }"
      else
        "/trophy/v1/users/#{ account_id }"
      end
    end
  end
end