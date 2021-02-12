module PlayStationNetworkAPI
  class Session
    include HTTParty
    base_uri 'https://ca.account.sony.com/api'

    DEFAULT_SCOPES ||= ['psn:clientapp', 'psn:mobile.v1'].join(' ').freeze
    CLIENT_ID ||= 'ac8d161a-d966-4728-b0ea-ffec22f69edc'.freeze
    
    attr_accessor :token
    
    def initialize(token)
      @token = token
    end

    def authenticate
      code, cid = oauth_authorize
      oauth_token(code)
    end

    alias_method :refresh, :authenticate

    def access_token
      oauth_token['access_token']
    end

    def expiration_date
      (Time.now + oauth_token['refresh_token_expires_in']).to_datetime.to_s
    end

    def expired?
      expiration_date < DateTime.now.to_s
    end
    
  private

    def oauth_authorize
      request = self.class.get('/authz/v3/oauth/authorize',
        headers: {
          'Cookie' => HTTParty::CookieHash.new().add_cookies({ npsso: token }).to_cookie_string
        },

        query: {
          'access_type' => 'offline',
          'client_id' => CLIENT_ID,
          'redirect_uri' => 'com.playstation.PlayStationApp://redirect',
          'response_type' => 'code',
          'scope' => DEFAULT_SCOPES
        },

        follow_redirects: false
      )

      if (location = request.headers['location'])
        code = location.match(/code=([A-Za-z0-9:\?_\-\.\/=]+)/)[1]
        cid = location.match(/cid=([A-Za-z0-9:\?_\-\.\/=]+)/)[1]
        
        return code, cid
      end
    end

    def oauth_token(code = nil)
      body = {}

      if code
        body = {
          'code' => code,
          'grant_type' => 'authorization_code',
          'redirect_uri' => 'com.playstation.PlayStationApp://redirect'
        }
      else
        body = {
          'refresh_token' => token,
          'grant_type' => 'refresh_token'
        }
      end
      
      self.class.post('/authz/v3/oauth/token',
        headers: {
          'Authorization' => 'Basic YWM4ZDE2MWEtZDk2Ni00NzI4LWIwZWEtZmZlYzIyZjY5ZWRjOkRFaXhFcVhYQ2RYZHdqMHY='
        },

        body: {
          'scope' => DEFAULT_SCOPES,
          **body,
          'token_format' => 'jwt'
        }
      ).parsed_response
    end
  end
end
