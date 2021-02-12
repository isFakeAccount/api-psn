require 'httparty'

module PlayStationNetworkAPI
  class Client
    VERSION ||= '2.1'
  
    include HTTParty
    base_uri 'https://m.np.playstation.net/api'

    attr_accessor :access_token, :default_headers, :account_id, :country, :language, :age

    def initialize(access_token, account_id: 'me', country: 'GB', language: 'en')
      @access_token = access_token
      @default_headers = {
        # TODO: Make this a variable for other languages
        'Accept-Language' => 'en-US',
        'User-Agent' => "psn-api/#{ VERSION }"
      }

      @account_id = account_id
      @country = country
      @language = language
    end

  public

    def catalog
      PlayStationNetworkAPI::Catalog.new(access_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def entitlement
      PlayStationNetworkAPI::Entitlement.new(access_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def explore
      PlayStationNetworkAPI::Explore.new(access_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def game
      PlayStationNetworkAPI::Game.new(access_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def search
      PlayStationNetworkAPI::Search.new(access_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def session
      PlayStationNetworkAPI::Session.new(access_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def trophy
      PlayStationNetworkAPI::Trophy.new(access_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

    def user
      PlayStationNetworkAPI::User.new(access_token, 
        account_id: account_id, 
        country: country, 
        language: language
      )
    end

  protected

    def get(url, options = {})
      headers = options[:headers] || {}
      options.delete(:headers)

      self.class.get(url,
        headers: {
          **default_headers,
          'Authorization' => "Bearer #{ access_token || 'eyJraWQiOiJucF8xIiwiYWxnIjoiUlMyNTYifQ.eyJhY2NvdW50X2lkIjoiNjQ2MjkxMDMzMTM0MzUzNTA1OCIsImFjY291bnRfdXVpZCI6IjFjOWRkZmZjLTA5NjYtNDc4Yi1iMGNmLTg5ZjMyMDFkN2ZlMiIsImFnZSI6MzAsImF1dGh6X2MiOiJlTnFWVk50dTJ6QU0vWlVnejRPUnJ0ZnBMVW1EWWNBNkRNc0hHSXJFMkZ4bHlaQW90OGF3ZngvbFc1eTBLTEFBUnF6REk1SStQTktmcFk2b2wySzU2bithbjV2VjZtSDE4SEI5Yzc5ZXI3YjNYMjV2UGo5ZWIrNXU3M2FiemUzVmRuZTkyK3l1bHArV1Fia2FlS3VTVmloWFZkTHFMQWJ3V1FHMGVBT0dDYlFFcjNUSm5JRTlrNlJ4aFNBa0EyR3o3WmdhR2xRZzBpdTgxc1o1ZnBjVmhHeU9CSEllQnl4Rm4wQ2ozSVB2dG5LZDRBeGtIRUJiZkhmUkZwREZXa3VDeFJ6NzZsMnNnK2phcWR3QjA1WSszMGVVMURqcW5Od3pXQ0VMT0MwTzZLbnNxa3hROThtV2NrWGVuRkFNdVNyUjZCUGlyRUVMT2VyRnM2emtieFJLZXNvUHNiWHU1UjBvcnoyckJPZWhTNHpuQWw1QmJpVmhBeU9jMU1vTkJwb0FvQnk1UzIrbHliblhOSXVLLzhOSVNPUnA0YlhwUkpvdGd5cEJSd056YkZCN1FLSTNVM2RPUmlxRnJHdnZHc2pUd3VhRTZwbHpzdEVzSzFBSDlrcnZnbS8yNk1aY0had0c4ZFBERVR4WUJhY1FLMjJRbSthODNXcVlWWE8xcUdNb2Z6akNJN0xiMEZueEFvZTlTL1hHZ2ZLTUxDaGFUR2tmMlpZbkwwVkx2dDA2ZThRaTh5RDF3cFBhZU5RRmlNWXhaVnRLbW5LRWd5eW42Z1JKU2Q2ZGxUS1Vpd0RTcTFJTXB1OVVIS0RnRkVveklDRndsMC9Tc3JXOHFIbXc3YjdIc3RBR2dtcjg2RXVta1MzNEMrck0xZjlCSHdxUUNpTDBNbVNzYTZiNDZ3ZTRQOEg5cGhIMnJpNWJJZG5ZMEhRR21sY2ZvaHFPYURHTjRaMWc3YkdScXAxSG91VzVnVjRyZGpCUysrU1N6MFRubzlRQ1Yrdm1rMGtpajRkSWZDTTAwbURYL2hraEhRWk8xbHZnRndTbXEvUzZKMG14djBiTytHOEFQdlhFdDBMSXhpNUh4cG0zN0d5UkJjNE4vV1UzS1BveGY3b3JlNU83STZ0d3B2UmNtSThwZmIzbDMzOTJ3VVlPIiwiY2xpZW50X2lkIjoiYWM4ZDE2MWEtZDk2Ni00NzI4LWIwZWEtZmZlYzIyZjY5ZWRjIiwiZGNpbV9pZCI6ImNlMmZlODJkLTJjOWUtNGI1OC05Y2JmLWM1OWZjM2E4NmU0NSIsImRldmljZV90eXBlIjoiSU9TX0FQUCIsImVudl9pc3NfaWQiOiIyNTYiLCJleHAiOjE2MTMxMzM5MzgsImdyYW50X3R5cGUiOiJhdXRob3JpemF0aW9uX2NvZGUiLCJpYXQiOjE2MTMxMzAzMzgsImlzX2NoaWxkIjpmYWxzZSwiaXNzIjoiaHR0cHM6Ly9hdXRoLmFjY291bnQuc29ueS5jb20vIiwianRpIjoiMDUxZDhhODItZTE4MS00MmQyLTliOGItZWZmMmM0NzY4MWJmIiwibGVnYWxfY291bnRyeSI6IkdCIiwibG9jYWxlIjoiZW4tR0IiLCJ2ZXIiOiIyIn0.WvyJ7O89Gz9fXF47nq_V__22xd6uEV0_7eti9BmbXacvQBG-8nWgIoVM0ItdMYtfHiOKOS14Ux6tbV8cDOiSG9q6zybh8JcMpAMKbCqoQzXeoQMK9oXBAY7ZWomUVrl2BvDwNxhS2ywMdWyrpceu-PKX_NyMo2WmbgybRXmLfFgyPKvXZlkwsrHM0vyPlJSiLJLoU2k0qI-qWUsBqR9E_FiJmdyaFXiIXAaevJs5zHKYhGhAIzgaoSHIOTS-lujExiFbG7PMvB-pqbSxXeQNO-7Nl66DWaEVHipAUaO2MgpzGLVAMXDqo_Hj81grC1_YbgHTCmBHcjB15orZg3P0Wf_usgdL8bJMgkOjLgxxNof4K6ck-i50NiQ1mOt8HRJpErzziTXiJAxtfo4A8VgV3VRFad4K3xcRYXPfwT4GHdJMJoMagvFWlle8X72oEIZqbqwU7d0l_wcuslFRg56mIclRtNDXTTFThzKp2aDDf1Ju-B8BwFODwgiDeuhCj-it' }",
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

  private

    def self.changelog
      # v2.1
      # Add new CloudAssistedNavigation, GamingLoungeGroup, RemoteDownloadList and SessionManager endpoints
      
      # v2.0
      # Implemented the new API that's currently present in the new PlayStation App.
      # There are quite a few endpoints that currently return Access Denied, which probably means they're not active yet
      
      # v1.0
    end
  end
end