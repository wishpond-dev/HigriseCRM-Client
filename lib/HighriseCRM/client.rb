require "HighriseC/RM/client/version"
require "httparty"
require "gyoku"

module HighriseCRM
  class Client
    attr_reader :token, :user

    def initialize(user, token)
      @token = token
      @user = user
    end

    def ping
      response = me
      response.code == 200
    end

    def people(page = 1)
      get_request("people", "page=#{page}")
    end

    def me
      get_request("me")
    end

    def custom_fields(page = 1)
      get_request("subject_fields", "page=#{page}")
    end

    def users(page = 1)
      get_request("users", "page=#{page}")
    end

    def create_person(data, endpoint = "people")
      post_request(data, endpoint)
    end

    private

    def uri_generator(endpoint, options = "")
      "#{@user}/#{endpoint}.xml?#{options}"
    end

    def get_request(endpoint, options = "")
      response = HTTParty.get(uri_generator(endpoint,options),
        {
          :headers => { "User-Agent" => "Wishpond" },
          :basic_auth => { :username => "#{@token}", :password => 'X' }
        }
      )
    end

    def convert_to_xml(data)
      Gyoku.xml(data)
    end

    def post_request(data, endpoint, options = "")
      uri = uri_generator(endpoint, options)
      response = HTTParty.post(uri,
        :headers => { "User-Agent" => "Wishpond", "Content-type" => "application/xml" },
        :basic_auth => { :username => "#{@token}", :password  => 'X' },
        :body => conver_to_xml(data)
      )
    end
  end
end
