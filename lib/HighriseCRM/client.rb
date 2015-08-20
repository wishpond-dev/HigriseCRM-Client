require "HighriseCRM/client/version"
require "httparty"
require "gyoku"

module HighriseCRM
  class Client
    attr_reader :token, :base_site

    def initialize(base_site, token)
      @token = token
      @base_site = base_site
    end

    def ping
      response = me
      response.code == 200
    end

    def people(offset = 0)
      get_request("people", "n={offset}")
    end

    def person_with_filter(filter_option)
      get_request("people", filter_option)
    end

    def me
      get_request("me")
    end

    def account
      get_request("account")
    end

    def users(page = 1)
      get_request("users", "page=#{page}")
    end

    def custom_fields
      get_request("subject_fields")
    end

    def base_sites(page = 1)
      get_request("base_sites", "page=#{page}")
    end

    def create_person(data, endpoint = "people")
      post_request(data, endpoint)
    end

    def update_person(data, id = 0, option = "reload=true")
      put_request(data, "people/#{id}", option)
    end

    private

    def uri_generator(endpoint, options = "")
      "#{@base_site}/#{endpoint}.xml?#{options}"
    end

    def get_request(endpoint, options = "")
      HTTParty.get(uri_generator(endpoint,options),
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
        :body => convert_to_xml(data)
      )
    end

    def put_request(data, endpoint, options = "")
      uri = uri_generator(endpoint, options)
      response = HTTParty.put(uri,
        :headers => { "User-Agent" => "Wishpond", "Content-type" => "application/xml" },
        :basic_auth => { :username => "#{@token}", :password  => 'X' },
        :body => convert_to_xml(data)
      )
    end
  end
end
