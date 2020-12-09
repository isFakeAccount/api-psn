module PlayStationNetworkAPI
  class Store
    include HTTParty

    require 'net/http'

    attr_reader :args, :region, :language, :headers
    
    # "localeRegionMapping": {
    #   "es-ar": "SIEA",
    #   "es-bz": "SIEA",
    #   "es-bo": "SIEA",
    #   "pt-br": "SIEA",
    #   "en-ca": "SIEA",
    #   "fr-ca": "SIEA",
    #   "es-cl": "SIEA",
    #   "es-co": "SIEA",
    #   "es-cr": "SIEA",
    #   "es-ec": "SIEA",
    #   "es-sv": "SIEA",
    #   "es-gt": "SIEA",
    #   "es-hn": "SIEA",
    #   "es-mx": "SIEA",
    #   "es-ni": "SIEA",
    #   "es-pa": "SIEA",
    #   "es-py": "SIEA",
    #   "es-pe": "SIEA",
    #   "en-us": "SIEA",
    #   "es-uy": "SIEA",
    #   "es-ve": "SIEA",
    #   "en-au": "SIEE",
    #   "de-at": "SIEE",
    #   "ar-bh": "SIEE",
    #   "en-bh": "SIEE",
    #   "nl-be": "SIEE",
    #   "fr-be": "SIEE",
    #   "en-bg": "SIEE",
    #   "en-hr": "SIEE",
    #   "en-cy": "SIEE",
    #   "cs-cz": "SIEE",
    #   "en-cz": "SIEE",
    #   "da-dk": "SIEE",
    #   "en-dk": "SIEE",
    #   "en-fi": "SIEE",
    #   "fi-fi": "SIEE",
    #   "fr-fr": "SIEE",
    #   "de-de": "SIEE",
    #   "en-gr": "SIEE",
    #   "el-gr": "SIEE",
    #   "en-hu": "SIEE",
    #   "hu-hu": "SIEE",
    #   "en-is": "SIEE",
    #   "en-in": "SIEE",
    #   "en-ie": "SIEE",
    #   "en-il": "SIEE",
    #   "it-it": "SIEE",
    #   "ar-kw": "SIEE",
    #   "en-kw": "SIEE",
    #   "ar-lb": "SIEE",
    #   "en-lb": "SIEE",
    #   "fr-lu": "SIEE",
    #   "de-lu": "SIEE",
    #   "en-mt": "SIEE",
    #   "nl-nl": "SIEE",
    #   "en-nz": "SIEE",
    #   "en-no": "SIEE",
    #   "no-no": "SIEE",
    #   "ar-om": "SIEE",
    #   "en-om": "SIEE",
    #   "en-pl": "SIEE",
    #   "pl-pl": "SIEE",
    #   "pt-pt": "SIEE",
    #   "ar-qa": "SIEE",
    #   "en-qa": "SIEE",
    #   "en-ro": "SIEE",
    #   "ro-ro": "SIEE",
    #   "ru-ru": "SIEE",
    #   "ar-sa": "SIEE",
    #   "en-sa": "SIEE",
    #   "en-sk": "SIEE",
    #   "en-si": "SIEE",
    #   "en-za": "SIEE",
    #   "es-es": "SIEE",
    #   "en-se": "SIEE",
    #   "sv-se": "SIEE",
    #   "fr-ch": "SIEE",
    #   "de-ch": "SIEE",
    #   "it-ch": "SIEE",
    #   "en-tr": "SIEE",
    #   "tr-tr": "SIEE",
    #   "ar-ae": "SIEE",
    #   "en-ae": "SIEE",
    #   "en-gb": "SIEE",
    #   "ru-ua": "SIEE",
    #   "en-hk": "SIEJA",
    #   "zh-cn-hk": "SIEJA",
    #   "zh-tw-hk": "SIEJA",
    #   "id-id": "SIEJA",
    #   "en-id": "SIEJA",
    #   "ja-jp": "SIEJA",
    #   "ko-kr": "SIEJA",
    #   "en-my": "SIEJA",
    #   "en-ph": "SIEJA",
    #   "en-sg": "SIEJA",
    #   "en-tw": "SIEJA",
    #   "zh-tw-tw": "SIEJA",
    #   "en-th": "SIEJA",
    #   "th-th": "SIEJA",
    #   "en-vn": "SIEJA",
    #   "vi-vn": "SIEJA"
    # },

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
      ALL: 'STORE-MSF77008-ALLGAMES',              # ( All Games ) - monthly
      FULL: 'STORE-MSF77008-PS3FULLGAMES',         # ( Full Games )
      DIGITAL: 'STORE-MSF77008-PSNGAME',           # ( Digital Only )
      ULTIMATE: 'STORE-MSF77008-ULTIMATEEDITIONS', # ( Ultimate Editions )
      BUNDLES: 'STORE-MSF77008-BUNDLES',           # ( Bundles )
      PS2: 'STORE-MSF77008-PS2GAMESONPS4G',        # ( PS2 Games )
      PS1: 'STORE-MSF77008-CLASSICS',              # ( PS1 Classics )
      MINI: 'STORE-MSF77008-MINIS',                # ( Minis )
      PS3TOPS4: 'STORE-MSF77008-PS3PS4XBUY',       # ( PS3 - PS4 Cross Buy )
      PS3TOPSV: 'STORE-MSF77008-9_PS3PSVCBBUNDLE', # ( PS3 - PS Vita Cross Buy )
      PS4TOPSV: 'STORE-MSF77008-9_PS4PSVCBBUNDLE', # ( PS4 - PS Vita Cross Buy )
      
      # FULL: 'STORE-MSF75508-FULLGAMES',              # monthly?
      
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