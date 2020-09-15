module PlayStationNetworkAPI
  class Account
    attr_accessor :identity

    ACCOUNTS_ENDPOINT  ||= 'https://accounts.api.playstation.com/api/v1/accounts/'

    def initialize(identity)
      @identity = identity
    end

    # Check whether a PlayStation Username (psn_id) is valid, exists or it can be reserved
    #
    def check(reserve_if_available: false)
      request = PlayStationNetworkAPI::Client.new(base_uri: ACCOUNTS_ENDPOINT)
        .post('/onlineIds',
          headers: {
            'User-Agent': 'Mozilla/5.0 (PlayStation 4 5.55) AppleWebKit/601.2 (KHTML, like Gecko)',
            'Content-Type': 'application/json',
            'Host': 'accounts.api.playstation.com'
          },

          body: {
            onlineId: identity,
            reserveIfAvailable: reserve_if_available
          }.to_json
        )

      # Identity doesn't exist but it has been reserved
      #
      # {
      #   "namespace": "accounts",
      #   "code": "3101",
      #   "validationErrors": [{
      #     "message": "Online id already exists or is not available to be reserved. onlineId=pacMakavelias"
      #   }]
      # }

      # Identity exists
      #
      # {
      #   "namespace": "accounts",
      #   "code": "3101",
      #   "validationErrors": [{
      #     "message": "Account with this online id already exists. existingReservationId=null reservationId=null onlineId=pacMakaveli90"
      #   }]
      # }

      # Identity has been reserved
      # {
      #   "reservationId": "d06b4872-63de-4853-99d1-d767a19383a8",
      #   "expirationDate": "2020-09-16T22:51:13.060+0000"
      # }

      request.parsed_response
    end
  end
end