module PlayStationNetworkAPI
  class Catalog < PlayStationNetworkAPI::Client

    # offset [Integer]
    # limit [Integer] {
    #   min: 1,
    #   max: 1000
    # }
    def most_purchased(offset: 0, limit: 10)
      raise 'limit must be less than or equal to 1000' if limit > 1000
      warn "[DEPRECATED] This endpoint has been marked as deprecated on the PlayStation API, don't rely on it as things might break in the future!"

      # https://m.np.playstation.net/api/catalog/v2/concepts/fetch?country=GB&language=en&age=999&limit=1000&offset=1
      get([path, 'concepts', 'fetch'].join('/'),
        query: {
          country: country,
          language: language,
          age: 999,
          limit: limit,
          offset: offset
        }
      ).parsed_response
    end

    # concept_id [Integer]
    # metadata [Boolean]: Different data is returned when true; stuff like age restrictions, release dates in different countries etc..
    def concept(concept_id, metadata: false)
      options = {}

      if metadata
        options[:query] = {
          country: country,
          language: language,
          age: 999
        }
      end

      # https://m.np.playstation.net/api/catalog/v2/concepts/10000470
      # https://m.np.playstation.net/api/catalog/v2/concepts/10000470?country=GB&language=en&age=999
      get([path, 'concepts', concept_id].join('/'), options).parsed_response
    end

    # concept_id [Integer]
    # offset [Integer]
    # limit [Integer] {
    #   min: 1,
    #   max: 1000
    # }
    def products(concept_id, offset: 0, limit: 10)
      raise 'limit must be less than or equal to 1000' if limit > 1000
      
      # https://m.np.playstation.net/api/catalog/v2/concepts/10000470/products?country=GB&language=en&age=999&limit=1000
      get([path, 'concepts', concept_id, 'products'].join('/'),
        query: {
          country: country,
          language: language,
          age: age,
          limit: limit,
          offset: offset
        }
      ).parsed_response
    end

    # title_ids [Array[String]]
    def title_ids_to_concept_id(title_ids)
      raise 'limit must be less than or equal to 500' if title_ids.length > 500

      # https://m.np.playstation.net/api/catalog/v2/titles/[..]/concepts/id
      response = get([path, 'titles', title_ids, 'concepts', 'id'].join('/')).parsed_response
      
      return title_ids.length == 1 ? response[0] : response
    end

    # title_id [String]
    def title(title_id)
      # https://m.np.playstation.net/api/catalog/v2/titles/CUSA18182_00/?country=GB&language=en&age=999
      get([path, 'title', title_id].join('/')).parsed_response
    end

    # title_id [String]
    def title_age_limit(title_id)
      get([path, 'title', title_id, 'ageLimit'].join('/')).parsed_response
    end

  private

    def path
      '/catalog/v2'.freeze
    end
  end
end