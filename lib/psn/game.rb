module PSN
  class Game
    attr_accessor :token, :title_id

    GAME_ENDPOINT   ||= 'https://gamelist.api.playstation.com/v1/'
    TROPHY_ENDPOINT ||= 'https://us-tpy.np.community.playstation.net/trophy/v1/'

    def initialize(title_id)
      @token = PSN::Client.new().login
      @title_id = title_id
    end

    def details
    end

    def trophy_info
      if title_id.start_with?('CU')
        request = PSN::Client.new(base_uri: TROPHY_ENDPOINT)
          .get("/apps/trophyTitles", headers: { 'Authorization': "Bearer #{ token }" },
            query: {
              npTitleIds: title_id,
              fields: '@default',
              npLanguage: 'en'
            }
          )

        @title_id = request.dig('apps', 0, 'trophyTitles', 0, 'npCommunicationId')

        warn "Please save the new 'titleId' : #{ title_id } and use this on your next request. PSN::Game.new('#{ title_id }').trophy_info"
      end

      request = PSN::Client.new(base_uri: TROPHY_ENDPOINT)
        .get("/trophyTitles/#{ title_id }", headers: { 'Authorization': "Bearer #{ token }" },
          query: {
            npLanguage: 'en'
          }
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
      request = PSN::Client.new(base_uri: GAME_ENDPOINT)
        .get("/titles/#{ title_id }/players", headers: { 'Authorization': "Bearer #{ token }" })

      request.parsed_response
    end

  private

    def t(identity = nil, get: nil, trophy_group: nil)
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

      request = PSN::Client.new(base_uri: TROPHY_ENDPOINT)
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
