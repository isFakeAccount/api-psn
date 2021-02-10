module PlayStationNetworkAPI
  class Session
    include HTTParty
    base_uri 'https://ca.account.sony.com/api'

    DEFAULT_SCOPES ||= ['psn:clientapp', 'psn:mobile.v1'].join(' ').freeze
    CLIENT_ID ||= 'ac8d161a-d966-4728-b0ea-ffec22f69edc'.freeze

    def refresh(refresh_token)
      oauth_token(refresh_token, refresh: true)
    end

    def authenticate(npsso)
      code, cid = oauth_authorize(npsso)
      oauth_token(code)
    end
    
    def access_token(refresh_token)
      refresh(refresh_token)['access_token']
    end

  private

    def oauth_authorize(npsso)
      request = self.class.get('/authz/v3/oauth/authorize',
        headers: {
          'Cookie' => HTTParty::CookieHash.new().add_cookies({ npsso: npsso }).to_cookie_string
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

    def oauth_token(code, refresh: false)
      body = {}

      if refresh
        body = {
          'refresh_token' => code,
          'grant_type' => 'refresh_token'
        }
      else
        body = {
          'code' => code,
          'grant_type' => 'authorization_code',
          'redirect_uri' => 'com.playstation.PlayStationApp://redirect'
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
