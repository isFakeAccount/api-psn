module PlayStationNetworkAPI
  class Store
    include HTTParty

    require 'net/http'

    attr_reader :args, :region, :language, :headers

    # Looks like each Region has a different store code. This is not going to be used right now, but
    # we might want to store this information for later use.
    #
    PS_PLUS_REGIONS = {
      SCEA: 'STORE-MSF77008-PSPLUSFREEGAMES',
      SCEE: 'STORE-MSF75508-PLUSINSTANTGAME',
      'SCE-ASIA': 'STORE-MSF86012-PLUS_FTT_CONTENT',
      SCEJ: 'PN.CH.JP-PN.CH.MIXED.JP-PSPLUSFREEPLAY',
      SCEK: 'STORE-MSF86012-PLUS_FTT_KR'
    }.freeze

    # Available stores we can query.
    # TODO: As we check the stores, update the update frequency
    #
    STORES = {
      ALL: 'STORE-MSF75508-FULLGAMES',              # monthly?
      LATEST: 'STORE-MSF75508-GAMELATEST',          # daily
      SOON: 'STORE-MSF75508-COMINGSOON',            # daily
      PLUS: 'STORE-MSF75508-PLUSINSTANTGAME',       # bi-weekly
      PRICE_DROPS: 'STORE-MSF75508-PRICEDROPSCHI',  # daily
      DEALS: 'STORE-MSF75508-DOTW1',                # daily
      OFFERS: 'STORE-MSF75508-GAMESUNDER202018',    # daily
      DISCOUNTS: 'STORE-MSF75508-PSPLUSDOUBLEDISC', # daily
      CHOICES: 'STORE-MSF75508-EDITORSCHOICE'       # daily

    }.freeze

    def initialize(args, region: 'GB', language: 'en')
      @args = args
      @region = region
      @language = language

      @headers = {
        "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36",
        "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
        "Authority" => "store.playstation.com"
      }
    end

    def games(limit = 99, offset = 0, region = 'EU', store: STORES[:ALL])
      request = PlayStationNetworkAPI::Client.new(base_uri: 'https://store.playstation.com')
        .get("/chihiro-api/viewfinder/GB/EN/999/#{ store }",
          headers: {},
          query: {
            size: limit,
            start: offset,
            gkb: 1,
            geoCountry: region,
            # sort: 'release_date'
          }
        )

      request
    end

    def search(game_type = 'PSN Game')
      options = {
        query: {
          suggested_size: 10,
          mode: 'game'
        }
      }

      get(search_url(args), options) do |response|
        games = []

        response['included'].each do |result|
          games << {
            store_id:     result['id'],
            name:         result['attributes']['name'],
            description:  result['attributes']['long_description'],
            type:         result['attributes']['game-content-type'],
            raw:          result
          }
        end

        games
      end
    end

    def details(size: 50)
      get(details_url(args, size)) do |response|
        response
      end
    end

  private

    def get(url, options = {}, &block) 
      uri = URI.parse(url)

      unless options.empty?
        uri.query = URI.encode_www_form(options[:query])
      end

      Net::HTTP.start(uri.host, uri.port, use_ssl: (uri.scheme == 'https')) do |http|
        request = Net::HTTP::Get.new(uri.request_uri)

        headers.each do |key, value|
          request[key] = value
        end

        response = http.request(request)

        if response.code == '200'
          yield(JSON.parse(response.body))
        else
          response.code
        end
      end
    end

    def search_url(query)
      "https://store.playstation.com/valkyrie-api/#{ language }/#{ region }/19/tumbler-search/#{ URI.encode(query) }"
    end

    def details_url(identifier, size)
      "https://store.playstation.com/store/api/chihiro/00_09_000/container/#{ region }/#{ language }/19/#{ identifier }?size=#{ size }"
    end

    def deep_transform_keys(object, &block)
      case object
      when Hash
        object.each_with_object({}) do |(key, value), result|
          result[yield(key)] = deep_transform_keys(value, &block)
        end
      when Array
        object.map { |e| deep_transform_keys(e, &block) }
      else
        object
      end
    end
  end
end