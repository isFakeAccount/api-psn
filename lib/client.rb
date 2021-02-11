class Client
  include HTTParty
  base_uri 'https://m.np.playstation.net/api'

  attr_accessor :access_token, :default_headers

  def initialize(access_token = nil)
    @access_token = access_token
    @default_headers = {
      'Accept-Language'] => 'en-US', # TODO: Make this a variable for other languages
      'User-Agent' => "psn-api/#{ PlayStationNetworkAPI::VERSION }"
    }
  end

  def get(url, options = {})
    headers = options[:headers] || {}
    options.delete(:headers)

    self.class.get(url,
      headers: {
        **default_headers,
        'Authorization' => "Bearer #{ access_token }",
        **headers
      },
      **options
    )
  end

  def post(url, options = {})
    self.class.post(url, 
      headers: {
        **default_headers,
        'Content-Type' => 'application/json'
      },
      **options
    )
  end
end