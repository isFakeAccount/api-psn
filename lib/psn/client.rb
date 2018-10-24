require 'pry'

module PSN
  class Client
    include HTTParty

    CLIENT_ID     ||= 'ebee17ac-99fd-487c-9b1e-18ef50c39ab5'
    CLIENT_SECRET ||= 'e4Ru_s*LrL4_B2BD'
    DEVICE_ID     ||= '0000000d00040080027BC1C3FBB84112BFC9A4300A78E96A'
    SCOPE         ||= 'kamaji:get_players_met kamaji:get_account_hash kamaji:activity_feed_submit_feed_story kamaji:activity_feed_internal_feed_submit_story kamaji:activity_feed_get_news_feed kamaji:communities kamaji:game_list kamaji:ugc:distributor oauth:manage_device_usercodes psn:sceapp user:account.profile.get user:account.attributes.validate user:account.settings.privacy.get kamaji:activity_feed_set_feed_privacy kamaji:satchel kamaji:satchel_delete user:account.profile.update'

    base_uri ''
    debug_output $stdout
    attr_accessor :token, :code

    def initialize(token = '5793c8f2-8efd-4009-b0d7-39fa74822ed2', code = nil, base_uri: 'https://auth.api.sonyentertainmentnetwork.com/2.0')
      @token = token
      @code  = code

      self.class.default_options.update(base_uri: base_uri)
    end

    def get(url, options = {})
      self.class.get(url, options)
    end

    # @param string: token => Can be either the Ticket UUID, usually for the
    # first time login, or the Refresh Token.
    # 
    # @param string: code => Code sent by PSN when loging for the first time.
    # This is required if passed along with the Ticket UUID
    # 
    def login
      if code

      else
        response = self.class.post('/oauth/token',
          headers: {
            'Content-Type' => 'application/x-www-form-urlencoded'
          },

          body: {
            "app_context" => "inapp_ios",
            "client_id" => CLIENT_ID,
            "client_secret" => CLIENT_SECRET,
            "refresh_token" => token,
            "duid" => DEVICE_ID,
            "grant_type" => "refresh_token",
            "scope" => SCOPE
          }
        )
      end

      response['access_token']
    end
  end
end
