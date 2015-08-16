require 'spec_helper'

describe HighriseCRM::Client do
  subject { HighriseCRM::Client.new }
  let(:token) { '12345abcde' }
  let(:base_site){ 'https://test.highrisehq.com' }
  let(:client) { HighriseCRM::Client.new(base_site, token) }
  let(:bad_token) { '12345abcd'}
  let(:bad_client) { HighriseCRM::Client.new(base_site, bad_token) }

  describe '#initialize' do
    it 'stores the token' do
      expect(client.token).to eq(token)
    end
  end

  describe '#ping' do
    context 'good token' do
      it 'returns true' do
        response = client.ping
        expect(response).to be_truthy
      end
    end

    context 'bad_token' do
      it 'returns false' do
        response = bad_client.ping
        expect(response).to be_falsey
      end
    end
  end

  describe '#people' do
    it 'returns the collection of people' do
      response = client.people
      expect(response['people'].size).to be > 0
    end

    context 'wrong token' do
      it "returns an error message" do
        response = bad_client.people
        expect(response['error']).to eq('Wrong Token brah!')
      end
    end
  end

  describe '#users' do
    it 'return the collection of users' do
      response = client.users
      expect(response.has_key?('users')).to be_truthy
    end

    context 'wrong token' do
      it "returns an error message" do
        response = bad_client.users
        expect(response['error']).to eq('Wrong Token brah!')
      end
    end
  end

  describe '#custom_fields' do
    it 'returns the collection of custom fields' do
      response = client.custom_fields
      expect(response.has_key?('subject_fields')).to be_truthy
    end

    context 'wrong token' do
      it "returns an error message" do
        response = bad_client.custom_fields
        expect(response['error']).to eq('Wrong Token brah!')
      end
    end
  end

  describe '#me' do
    it 'returns a user with email and name' do
      response = client.me
      expect(response.has_key?('user')).to be_truthy
    end

    it 'has email' do
      response = client.me
      expect(response['user']['email_address'].nil?).to be_falsey
    end
  end
end
