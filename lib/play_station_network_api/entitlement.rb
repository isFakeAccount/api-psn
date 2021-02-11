module PlayStationNetworkAPI
  class Entitlement < Client

    # offset [Integer]
    # limit [Integer] {
    #   min: 1,
    #   max: 500
    # }
    def entitlements(offset: 0, limit: 500)
      raise 'limit must be less than or equal to 500' if limit > 500

      # https://m.np.playstation.net/api/entitlement/v2/users/me/internal/entitlements
      get(path,
        query: {
          limit: limit,
          offset: offset
        }
      ).parsed_response
    end

    # entitlement_id [String]
    def entitlement(entitlement_id)
      # https://m.np.playstation.net/api/entitlement/v2/users/me/internal/entitlements/EP0700-NPEB90430_00-RRUDEMOEU0000100
      get([path, entitlement_id].join('/').parsed_response)
    end

  private

    def path
      '/entitlement/v2/users/me/internal/entitlements'.freeze
    end
  end
end