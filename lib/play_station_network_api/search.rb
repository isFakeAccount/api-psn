module PlayStationNetworkAPI
  class Search < PlayStationNetworkAPI::Client
    
    # query [String]
    # limit [Integer] {
    #   min: 1,
    #   max: 50
    # }
    # country_code [String]
    # language_code [String]
    def query(query, offset: 0, limit: 50)
      # https://m.np.playstation.net/api/search/v1/universalSearch
      request = Client.new().post('/search/v1/universalSearch',
        body: {
          "domainRequests": [
            {
              "domain": "ConceptGameMobileApp",
              "pagination": {

                # TODO: It seems to be a Java GraphQL pagination thingy, when present it breaks the offset.
                # So let's leave it out for now as we don't really need to paginate
                # "cursor": "10"

                "pageSize": limit,
                "offset": offset
              }
            }
          ],
          "age": "999",
          "countryCode": country_code,
          "searchTerm": query,
          "languageCode": language_code
        }
      )

      return {
        total_results: request.dig('domainResponses', 'totalResultCount'),
        results: request.dig('domainResponses', 'results')
      }
    end
  end
end