class Client
  include HTTParty
  base_uri 'https://m.np.playstation.net/api'

  attr_accessor :access_token, :user_agent

  def initialize(access_token = nil)
    @access_token = access_token
    @user_agent = {
      'User-Agent' => "psn-api/#{ PlayStationNetworkAPI::VERSION }"
    }
  end

  def get(url, options = {})
    headers = options[:headers] || {}
    options.delete(:headers)

    self.class.get(url,
      headers: {
        **user_agent,
        'Authorization' => "Bearer #{ access_token }",
        **headers
      },
      **options
    )
  end

  def post(url, options = {})
    self.class.post(url, 
      headers: {
        **user_agent,
        'Content-Type' => 'application/json'
      },
      **options
    )
  end
end