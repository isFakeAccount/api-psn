module PlayStationNetworkAPI
  class Search < PlayStationNetworkAPI::Client
    
    # query [String]
    # limit [Integer] {
    #   min: 1,
    #   max: 50
    # }
    # country [String]
    # language [String]
    def query(query, offset: 0, limit: 50)
      # https://m.np.playstation.net/api/search/v1/universalSearch
      request = post('/search/v1/universalSearch',
        body: {
          "domainRequests": [
            {
              "domain": "ConceptGameMobileApp",
              
              # TODO: It seems to be a Java GraphQL pagination thingy, when present it breaks the offset.
              # So let's leave it out for now as we don't really need to paginate
              # "cursor": "10"

              "pagination": {
                "pageSize": limit,
                "offset": offset
              }
            }
          ],
          "age": "999",
          "countryCode": country,
          "searchTerm": query,
          "languageCode": language
        }.to_json
      )

      return {
        total_results: request.dig('domainResponses', 0, 'totalResultCount'),
        results: request.dig('domainResponses', 0, 'results')
      }
    end
  end
end