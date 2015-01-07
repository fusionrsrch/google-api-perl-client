use strict;
use warnings;

use Test::More::Behaviour;

use Data::Dumper;

BEGIN {
    use_ok('Google::APIClient');
}


#shared_examples_for 'configurable user agent' do
#  include ConnectionHelpers
#
#  it 'should allow the user agent to be modified' do
#    client.user_agent = 'Custom User Agent/1.2.3'
#    expect(client.user_agent).to eq('Custom User Agent/1.2.3')
#  end
#
#  it 'should allow the user agent to be set to nil' do
#    client.user_agent = nil
#    expect(client.user_agent).to eq(nil)
#  end
#
#  it 'should not allow the user agent to be used with bogus values' do
#    expect(lambda do
#      client.user_agent = 42
#      client.execute(:uri=>'https://www.google.com/')
#    end).to raise_error(TypeError)
#  end
#
#  it 'should transmit a User-Agent header when sending requests' do
#    client.user_agent = 'Custom User Agent/1.2.3'
#
#    conn = stub_connection do |stub|
#      stub.get('/') do |env|
#        headers = env[:request_headers]
#        expect(headers).to have_key('User-Agent')
#        expect(headers['User-Agent']).to eq(client.user_agent)
#        [200, {}, ['']]
#      end
#    end
#    client.execute(:uri=>'https://www.google.com/', :connection => conn)
#    conn.verify
#  end
#end
#

describe 'Google::APIClient' => sub { 
#  include ConnectionHelpers
#
#  let(:client) { Google::APIClient.new(:application_name => 'API Client Tests') }
    my $client = Google::APIClient->new( application_name => 'API Client Tests');
#
    it "should pass the faraday options provided on initialization to FaraDay configuration block" => sub { 
#    client = Google::APIClient.new(faraday_option: {timeout: 999})
#    expect(client.connection.options.timeout).to be == 999
    };
#
    it 'should make its version number available' => sub { 
        my $version = Google::APIClient::Version->new();
        print Dumper( $version->STRING );
#    expect(Google::APIClient::VERSION::STRING).to be_instance_of(String)
    };
#
    it 'should default to OAuth 2' => sub { 
#    expect(Signet::OAuth2::Client).to be === client.authorization
    };

};


describe 'configure for no authentication' => sub { 
#    before do
#      client.authorization = nil
#    end
#    it_should_behave_like 'configurable user agent'
#  end
};


describe 'configured for OAuth 1' => sub { 
#    before do
#      client.authorization = :oauth_1
#      client.authorization.token_credential_key = 'abc'
#      client.authorization.token_credential_secret = '123'
#    end
#
    it 'should use the default OAuth1 client configuration' => sub { 
#      expect(client.authorization.temporary_credential_uri.to_s).to eq(
#        'https://www.google.com/accounts/OAuthGetRequestToken'
#      )
#      expect(client.authorization.authorization_uri.to_s).to include(
#        'https://www.google.com/accounts/OAuthAuthorizeToken'
#      )
#      expect(client.authorization.token_credential_uri.to_s).to eq(
#        'https://www.google.com/accounts/OAuthGetAccessToken'
#      )
#      expect(client.authorization.client_credential_key).to eq('anonymous')
#      expect(client.authorization.client_credential_secret).to eq('anonymous')
    };
#
#    it_should_behave_like 'configurable user agent'
};


describe 'configured for OAuth 2' => sub { 
#    before do
#      client.authorization = :oauth_2
#      client.authorization.access_token = '12345'
#    end
#
#    # TODO
#    it_should_behave_like 'configurable user agent'
};


describe 'when executing requests' => sub { 
#    before do
#      @prediction = client.discovered_api('prediction', 'v1.2')
#      client.authorization = :oauth_2
#      @connection = stub_connection do |stub|
#        stub.post('/prediction/v1.2/training?data=12345') do |env|
#          expect(env[:request_headers]['Authorization']).to eq('Bearer 12345')
#          [200, {}, '{}']
#        end
#      end
#    end
#
#    after do
#      @connection.verify
#    end
#
    it 'should use default authorization' => sub { 
#      client.authorization.access_token = "12345"
#      client.execute(
#        :api_method => @prediction.training.insert,
#        :parameters => {'data' => '12345'},
#        :connection => @connection
#      )
    };

    it 'should use request scoped authorization when provided' => sub { 
#      client.authorization.access_token = "abcdef"
#      new_auth = Signet::OAuth2::Client.new(:access_token => '12345')
#      client.execute(
#        :api_method => @prediction.training.insert,
#        :parameters => {'data' => '12345'},
#        :authorization => new_auth,
#        :connection => @connection
#      )
    };

    it 'should accept options with batch/request style execute' => sub {
#      client.authorization.access_token = "abcdef"
#      new_auth = Signet::OAuth2::Client.new(:access_token => '12345')
#      request = client.generate_request(
#        :api_method => @prediction.training.insert,
#        :parameters => {'data' => '12345'}
#      )
#      client.execute(
#        request,
#        :authorization => new_auth,
#        :connection => @connection
#      )
    };


    it 'should accept options in array style execute' => sub { 
#       client.authorization.access_token = "abcdef"
#       new_auth = Signet::OAuth2::Client.new(:access_token => '12345')
#       client.execute(
#         @prediction.training.insert, {'data' => '12345'}, '', {},
#         { :authorization => new_auth, :connection => @connection }
#       )
    };

};


describe 'when retries enabled' => sub { 
#    before do
#      client.retries = 2
#    end
#
#    after do
#      @connection.verify
#    end

    it 'should follow redirects' => sub { 
#      client.authorization = nil
#      @connection = stub_connection do |stub|
#        stub.get('/foo') do |env|
#          [302, {'location' => 'https://www.google.com/bar'}, '{}']
#        end
#        stub.get('/bar') do |env|
#          [200, {}, '{}']
#        end
#      end
#
#      client.execute(  
#        :uri => 'https://www.google.com/foo',
#        :connection => @connection
#      )
    };

    it 'should refresh tokens on 401 errors' => sub {
#      client.authorization.access_token = '12345'
#      expect(client.authorization).to receive(:fetch_access_token!)
#
#      @connection = stub_connection do |stub|
#        stub.get('/foo') do |env|
#          [401, {}, '{}']
#        end
#        stub.get('/foo') do |env|
#          [200, {}, '{}']
#        end
#      end
#
#      client.execute(  
#        :uri => 'https://www.google.com/foo',
#        :connection => @connection
#      )
    };


    it 'should not attempt multiple token refreshes' => sub {
#      client.authorization.access_token = '12345'
#      expect(client.authorization).to receive(:fetch_access_token!).once
#
#      @connection = stub_connection do |stub|
#        stub.get('/foo') do |env|
#          [401, {}, '{}']
#        end
#      end
#
#      client.execute(  
#        :uri => 'https://www.google.com/foo',
#        :connection => @connection
#      )
    };

    it 'should not retry on client errors' => sub {
#      count = 0
#      @connection = stub_connection do |stub|
#        stub.get('/foo') do |env|
#          expect(count).to eq(0)
#          count += 1
#          [403, {}, '{}']
#        end
#      end
#
#      client.execute(  
#        :uri => 'https://www.google.com/foo',
#        :connection => @connection,
#        :authenticated => false
#      )
    };

    it 'should retry on 500 errors' => sub { 
#      client.authorization = nil
#
#      @connection = stub_connection do |stub|
#        stub.get('/foo') do |env|
#          [500, {}, '{}']
#        end
#        stub.get('/foo') do |env|
#          [200, {}, '{}']
#        end
#      end
#
#      expect(client.execute(  
#        :uri => 'https://www.google.com/foo',
#        :connection => @connection
#      ).status).to eq(200)
#
    };

    it 'should fail after max retries' => sub { 
#      client.authorization = nil
#      count = 0
#      @connection = stub_connection do |stub|
#        stub.get('/foo') do |env|
#          count += 1
#          [500, {}, '{}']
#        end
#      end
#
#      expect(client.execute(  
#        :uri => 'https://www.google.com/foo',
#        :connection => @connection
#      ).status).to eq(500)
#      expect(count).to eq(3)
    };

};



describe 'when retries disabled and expired_auth_retry on (default)' => sub { 
#    before do
#      client.retries = 0
#    end
#
#    after do
#      @connection.verify
#    end
#
    it 'should refresh tokens on 401 errors' => sub { 
#      client.authorization.access_token = '12345'
#      expect(client.authorization).to receive(:fetch_access_token!)
#
#      @connection = stub_connection do |stub|
#        stub.get('/foo') do |env|
#          [401, {}, '{}']
#        end
#        stub.get('/foo') do |env|
#          [200, {}, '{}']
#        end
#      end
#
#      client.execute(
#        :uri => 'https://www.gogole.com/foo',
#        :connection => @connection
#      )
    }; 

};



describe 'when retries disabled and expired_auth_retry off' => sub {
#    before do
#      client.retries = 0
#      client.expired_auth_retry = false
#    end
#
    it 'should not refresh tokens on 401 errors' => sub { 
#      client.authorization.access_token = '12345'
#      expect(client.authorization).not_to receive(:fetch_access_token!)
#
#      @connection = stub_connection do |stub|
#        stub.get('/foo') do |env|
#          [401, {}, '{}']
#        end
#        stub.get('/foo') do |env|
#          [200, {}, '{}']
#        end
#      end
#
#      resp = client.execute(
#        :uri => 'https://www.gogole.com/foo',
#        :connection => @connection
#      )
#
#      expect(resp.response.status).to be == 401
    }; 

};

done_testing();
