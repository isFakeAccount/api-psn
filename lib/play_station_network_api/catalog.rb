require 'play_station_network_api/models/trophy'

module PlayStationNetworkAPI
  class Catalog < PlayStationNetworkAPI::Client

    # offset [Integer]
    # limit [Integer] {
    #   min: 1,
    #   max: 1000
    # }
    def most_purchased(offset: 0, limit: 10)
      raise 'limit must be less than or equal to 1000' if limit > 1000
      warn "[DEPRECATED] This endpoint has been marked as deprecated, don't rely on it as things might break in the future!"

      # https://m.np.playstation.net/api/catalog/v2/concepts/fetch?country=GB&language=en&age=999&offset=4446
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

# syncConcepts: function (t, n) {
# 	endpoint: "/v2/sync/concepts",
# },

# fetchMostPurchasedConcepts: function (t, n) {
# 	endpoint: "/v2/fetch/concepts",
# },

# getConcepts: function (t, n) {
# 	endpoint: "/v2/concepts",
# },

# getConcept: function (t, n) {
# 	endpoint: "/v2/concepts/{conceptId}",
# },

# titleIdToConcept: function (t, n) {
# 	endpoint: "/v2/titles/{titleId}/concept",
# },

# getMainTmdbEntitlement: function (t, n) {
# 	endpoint: "/v2/titles/{titleId}/tmdb",
# },

# titleIdToConceptDepreciated: function (t, n) {
# 	endpoint: "/v2/concepts/title/{titleId}",
# },

# titleIdsToConcepts: function (t, n) {
# 	endpoint: "/v2/titles/{titleIds}/concepts",
# },

# fetchMostPurchasedProducts: function (t, n) {
# 	endpoint: "/v2/fetch/products",
# },

# fetchMostPurchasedProductsDeprecatedAgain: function (t, n) {
# 	endpoint: "/v2/products/fetch",
# },

# getProducts: function (t, n) {
# 	endpoint: "/v2/products",
# },

# getCloudGames: function (t, n) {
# 	endpoint: "/v2/products/cloudgame",
# },

# getProduct: function (t, n) {
# 	endpoint: "/v2/products/{productId}",
# },

# getSku: function (t, n) {
# 	endpoint: "/v2/skus/{skuId}",
# },

# getCategory: function (t, n) {
# 	endpoint: "/v2/categories/{categoryId}",
# },

# getEntitlement: function (t, n) {
# 	endpoint: "/v2/entitlements/{entitlementId}",
# },

# getTmdbEntitlement: function (t, n) {
# 	endpoint: "/v2/entitlements/{entitlementId}/tmdb",
# },

# getPlayGo: function (t, n) {
# 	endpoint: "/v2/entitlements/{entitlementId}/tmdb/playgo",
# },

# getPlayGoDepreciated: function (t, n) {
# 	endpoint: "/v2/entitlements/{entitlementId}/playgo",
# }