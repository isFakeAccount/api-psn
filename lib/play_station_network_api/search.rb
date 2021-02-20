module PlayStationNetworkAPI
  class Search < PlayStationNetworkAPI::Client
    BUCKETS ||= {
      BLENDED: 'Blended',
      CONCEPT_GAME: 'ConceptGame',
      CONCEPT_GAME_ALL: 'ConceptGameAll',
      CONCEPT_GAME_MOBILE_APP: 'ConceptGameMobileApp',
      CONCEPT_GAME_PS_NOW: 'ConceptGamePsNow',
      CONCEPT_GAME_EXCLUDING_PS_NOW: 'ConceptGameExcludingPsNow',
      CONCEPT_GAME_ADDONS: 'ConceptGameAddons',
      CONCEPT_APPLICATION_GAME: 'ConceptApplicationGame',
      CONCEPT_APPLICATION_VIDEO: 'ConceptApplicationVideo',
      CONCEPT_OTHER_NON_GAME: 'ConceptOtherNonGame',
      VIDEO_CATALOG: 'VideoCatalog',
      VIDEO_CATALOG_MOVIE: 'VideoCatalogMovie',
      VIDEO_CATALOG_TV_SERIES: 'VideoCatalogTVSeries',
      SOCIAL_ALL_ACCOUNTS: 'SocialAllAccounts',
      SOCIAL_FRIENDS: 'SocialFriends',
      SOCIAL_FRIENDS_OF_FRIENDS: 'SocialFriendsOfFriends',
      SOCIAL_FRIENDS_AND_FRIENDS_OF_FRIENDS: 'SocialFriendsAndFriendsOfFriends',
      SOCIAL_UNRELATED_AND_FRIENDS_OF_FRIENDS: 'SocialUnrelatedAndFriendsOfFriends',
      SOCIAL_UNRELATED: 'SocialUnrelated'
    }.freeze
    
    # Returns a list of buckets available to pass to .query(domains: [])
    # 
    def buckets
      BUCKETS.keys
    end

    # query [String]
    # limit [Integer] {
    #   min: 1,
    #   max: 50
    # }
    # country [String]
    # language [String]
    def query(query, offset: 0, limit: 50, buckets: [:CONCEPT_GAME_MOBILE_APP])
      search_domains = []
      
      buckets.each do |bucket|
        search_domains.push({
          "domain": BUCKETS[bucket.to_sym],
          "pagination": {
            
            # TODO: It seems to be a Java GraphQL pagination thingy, when present it breaks the offset.
            # So let's leave it out for now as we don't really need to paginate
            # "cursor": "10"

            "pageSize": limit,
            "offset": offset
          }
        })
      end

      # https://m.np.playstation.net/api/search/v1/universalSearch
      request = post('/search/v1/universalSearch',
        body: {
          "domainRequests": search_domains,
          "age": "999",
          "countryCode": country,
          "searchTerm": query,
          "languageCode": language
        }.to_json
      )

      buckets = []

      request.dig('domainResponses').map do |domain_response|
        bucket = {}
        bucket[domain_response['domain']] = {
          total_results: domain_response['totalResultCount'],
          results: domain_response['results']
        }

        buckets.push(bucket)
      end

      return {
        query: request['prefix'],
        suggestions: request['suggestions'],
        buckets: buckets,
      }
    end
  end
end