module PlayStationNetworkAPI
  class Client
    include HTTParty

    CLIENT_ID     ||= 'ebee17ac-99fd-487c-9b1e-18ef50c39ab5'
    CLIENT_SECRET ||= 'e4Ru_s*LrL4_B2BD'
    SCOPE         ||= [
      'kamaji:activity_feed_get_news_feed',
      'kamaji:activity_feed_internal_feed_submit_story',
      'kamaji:activity_feed_set_feed_privacy',
      'kamaji:activity_feed_submit_feed_story',
      'kamaji:communities',
      'kamaji:game_list',
      'kamaji:get_account_hash',
      'kamaji:get_players_met',
      'kamaji:satchel',
      'kamaji:satchel_delete',
      'kamaji:ugc:distributor',
      'oauth:manage_device_usercodes',
      'psn:sceapp',
      'user:account.attributes.validate',
      'user:account.profile.get',
      'user:account.profile.update',
      'user:account.settings.privacy.get'
    ]

    attr_accessor :token

    def initialize(refresh_token = nil, base_uri: 'https://auth.api.sonyentertainmentnetwork.com/2.0')
      @token = refresh_token

      self.class.default_options.update(base_uri: base_uri)
    end

    def get(url, options = {})
      self.class.get(url, options)
    end

    def login_with(npsso)
      response = self.class.post('/oauth/token',
        headers: {
          'User-Agent' => 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.0 Mobile/15E148 Safari/604.1',
          'Cookie' => HTTParty::CookieHash.new().add_cookies({ npsso: npsso }).to_cookie_string
        },

        body: {
          'client_id' => CLIENT_ID,
          'client_secret' => CLIENT_SECRET,
          'scope' => SCOPE.join(' '),
          'grant_type' => 'sso_cookie'
        }
      )
    end

    # @param string: token => Can be either the Ticket UUID, usually for the
    # first time login, or the Refresh Token.
    #
    def login
      puts token
      response = self.class.post('/oauth/token',
        headers: {
          'Content-Type' => 'application/x-www-form-urlencoded'
        },

        body: {
          'app_context' => 'inapp_ios',
          'client_id' => CLIENT_ID,
          'client_secret' => CLIENT_SECRET,
          'refresh_token' => token,
          'duid' => '0000000d00040080027BC1C3FBB84112BFC9A4300A78E96A',
          'grant_type' => 'refresh_token',
          'scope' => SCOPE.join(' ')
        }
      )

      return response['access_token']
    end
  end
end
