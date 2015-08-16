require 'HighriseCRM/client'
require 'webmock/rspec'
require 'support/fake_highrise_crm'
require 'pry'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "https://highrisehq.com").
      with(headers: {'Accept' => '*/*', 'User-Agent' => 'Ruby'}).
      to_return(status: 200, body: "stubbed response", headers: {})

    stub_request(:any, /https:\/\/12345abcde:X@test.highrisehq.com/).to_rack(FakeHighriseCRM)
    stub_request(:any, /https:\/\/12345abcd:X@test.highrisehq.com/).to_rack(FakeHighriseCRM)
  end
end
