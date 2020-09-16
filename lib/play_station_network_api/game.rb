module PlayStationNetworkAPI
  class Game
    attr_accessor :token, :title_id

    GAME_ENDPOINT   ||= 'https://gamelist.api.playstation.com/v1/'
    TROPHY_ENDPOINT ||= 'https://%s-tpy.np.community.playstation.net/trophy/v1/'

    def initialize(refresh_token, title_id)
      @token = PlayStationNetworkAPI::Client.new(refresh_token).login
      @title_id = title_id
    end

    def details
    end

    def trophy_info(identity = nil, region: 'gb')
      if title_id.start_with?('CU')
        request = PlayStationNetworkAPI::Client.new(base_uri: format(TROPHY_ENDPOINT, region))
          .get("/apps/trophyTitles", headers: { 'Authorization': "Bearer #{ token }" },
            query: {
              npTitleIds: title_id,
              fields: '@default',
              npLanguage: 'en'
            }
          )

        @title_id = request.dig('apps', 0, 'trophyTitles', 0, 'npCommunicationId')

        warn "Please save the new 'titleId' : #{ title_id } and use this on your next request. PlayStationNetworkAPI::Game.new('#{ title_id }').trophy_info"
      end

      params = {}

      if identity
        params[:comparedUser] = 'pacMakaveli90'
      end

      request = PlayStationNetworkAPI::Client.new(base_uri: format(TROPHY_ENDPOINT, region))
        .get("/trophyTitles/#{ title_id }", headers: { 'Authorization': "Bearer #{ token }" },
          query: {
            # platform: 'PS3',
            npLanguage: 'en',
          }.merge(params)
        )

      request.parsed_response
    end

    def trophies(identity = nil, trophy_group: 'all')
      t(identity, get: :trophies, trophy_group: trophy_group)
    end

    def trophy_groups(identity = nil)
      t(identity, get: :groups)
    end

    def players
      request = PlayStationNetworkAPI::Client.new(base_uri: GAME_ENDPOINT)
        .get("/titles/#{ title_id }/players", headers: { 'Authorization': "Bearer #{ token }" })

      request.parsed_response
    end

  private

    def t(identity = nil, get: nil, trophy_group: nil, region: 'gb')
      params = { }
      url = "/trophyTitles/#{ title_id }/trophyGroups"

      case get
      when :trophies
        url += "/#{ trophy_group }/trophies"

        params[:fields] = '@default,trophyRare,trophyEarnedRate,hasTrophyGroups'
        params[:visibleType] = 1 # [0, 1]
      when :groups
        params[:fields] = '@default,trophyTitleSmallIconUrl,trophyGroupSmallIconUrl'
      end

      if identity
        params[:comparedUser] = identity
      end

      request = PlayStationNetworkAPI::Client.new(base_uri: format(TROPHY_ENDPOINT, region))
        .get(url, headers: { 'Authorization': "Bearer #{ token }" },
          query: {
            iconSize: 'm', # [s, m]
            npLanguage: 'en'
          }.merge(params)
        )

      request.parsed_response
    end
  end
end
