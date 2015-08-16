require 'sinatra/base'

class FakeHighriseCRM < Sinatra::Base

  get '/people.xml' do
    if check_token
      json_response(200, 'people.json')
    else
      json_response(400, 'error.json')
    end
  end

  get '/users.xml' do
    if check_token
      json_response(200, 'users.json')
    else
      json_response(400, 'error.json')
    end
  end

  get '/me.xml' do
    if check_token
      json_response(200, 'me.json')
    else
      json_response(400,'error.json')
    end
  end

  get '/subject_fields.xml' do
     if check_token
      json_response(200, 'custom_fields.json')
    else
      json_response(400, 'error.json')
    end
  end

  post '/people.xml' do
    if check_token
      json_response(201, 'create_person.json')
    else
      json_response(400, 'error.json')
    end
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end

  def check_token
    encoded = Base64.encode64('12345abcde:X').chomp
    authorization = "Basic" + " " + encoded
    env['HTTP_AUTHORIZATION'] == authorization
  end
end
