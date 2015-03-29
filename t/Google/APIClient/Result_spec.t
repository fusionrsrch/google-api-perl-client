use strict;
use warnings;

use Test::More::Behaviour;

use Data::Dumper;

#use Google::APIClient;

BEGIN {
    use_ok('Google::APIClient::Result');
}

my $CLIENT;
my $plus;
my $reference;
my $request;
my $result;
my $response;

#require 'spec_helper'
#
#require 'google/api_client'
use Google::APIClient; 
#
#RSpec.describe Google::APIClient::Result do
#describe 'Google::APIClient::Service::Result' => sub {
#  CLIENT = Google::APIClient.new(:application_name => 'API Client Tests') unless defined?(CLIENT)
    $CLIENT = Google::APIClient->new(application_name => 'API Client Tests');
#
#  describe 'with the plus API' do
describe 'with the plus API' => sub {
#    before do
#      CLIENT.authorization = nil
#      @plus = CLIENT.discovered_api('plus', 'v1')
#      @reference = Google::APIClient::Reference.new({
#        :api_method => @plus.activities.list,
#        :parameters => {
#          'userId' => 'me',
#          'collection' => 'public',
#          'maxResults' => 20
#        }
#      })
#      @request = @reference.to_http_request
        $plus = $CLIENT->discovered_api('plus', 'v1');
        $reference = Google::APIClient::Reference->new(
            #api_method => $plus->activities->list,
            api_method => 'dude',
            parameters => {
                'userId' => 'me',
                'collection' => 'public',
                'maxResults' => 20
            }
        );
        $request = $reference->to_http_request();

    # Response double
#      @response = double("response")
#      allow(@response).to receive(:status).and_return(200)
#      allow(@response).to receive(:headers).and_return({
#        'etag' => '12345',
#        'x-google-apiary-auth-scopes' =>
#          'https://www.googleapis.com/auth/plus.me',
#        'content-type' => 'application/json; charset=UTF-8',
#        'date' => 'Mon, 23 Apr 2012 00:00:00 GMT',
#        'cache-control' => 'private, max-age=0, must-revalidate, no-transform',
#        'server' => 'GSE',
#        'connection' => 'close'
#      })
#    end
};
#
#    describe 'with a next page token' do
describe 'with a next page token' => sub {
#      before do
#        allow(@response).to receive(:body).and_return(
#          <<-END_OF_STRING
#          {
#            "kind": "plus#activityFeed",
#            "etag": "FOO",
#            "nextPageToken": "NEXT+PAGE+TOKEN",
#            "selfLink": "https://www.googleapis.com/plus/v1/people/foo/activities/public?",
#            "nextLink": "https://www.googleapis.com/plus/v1/people/foo/activities/public?maxResults=20&pageToken=NEXT%2BPAGE%2BTOKEN",
#            "title": "Plus Public Activity Feed for ",
#            "updated": "2012-04-23T00:00:00.000Z",
#            "id": "123456790",
#            "items": []
#          }
#          END_OF_STRING
#        )
#        @result = Google::APIClient::Result.new(@reference, @response)
#      end

    $result = Google::APIClient::Result->new($reference, $response);        

    it 'should indicate a successful response' => sub {
#        expect(@result.error?).to be_falsey
    };

    it 'should return the correct next page token' => sub { 
#        expect(@result.next_page_token).to eq('NEXT+PAGE+TOKEN')
        is($result->next_page_token, 'NEXT+PAGE+TOKEN');
    };

    it 'should escape the next page token when calling next_page' => sub { 
#        reference = @result.next_page
        my $_reference = $result->next_page;
#        expect(Hash[reference.parameters]).to include('pageToken')
#        expect(Hash[reference.parameters]['pageToken']).to eq('NEXT+PAGE+TOKEN')
        my $parameters = $_reference->parameters;
        is( $parameters->{pageToken}, 'NEXT+PAGE+TOKEN' );
#        url = reference.to_env(CLIENT.connection)[:url]
#        expect(url.to_s).to include('pageToken=NEXT%2BPAGE%2BTOKEN')
    };

    it 'should return content type correctly' => sub { 
#        expect(@result.media_type).to eq('application/json')
        is( $result->media_type, 'application/json' );
    };

    it 'should return the result data correctly' => sub { 
        my $data = $result->data;
#        expect(@result.data?).to be_truthy
#        expect(@result.data.class.to_s).to eq(
#            'Google::APIClient::Schema::Plus::V1::ActivityFeed'
#        )
#        expect(@result.data.kind).to eq('plus#activityFeed')
        is( $data->{kind}, 'plus#activityFeed');
#        expect(@result.data.etag).to eq('FOO')
        is( $data->{etag}, 'FOO');
#        expect(@result.data.nextPageToken).to eq('NEXT+PAGE+TOKEN')
        is( $data->{nextPageToken}, 'NEXT+PAGE+TOKEN');
#        expect(@result.data.selfLink).to eq('
#            'https://www.googleapis.com/plus/v1/people/foo/activities/public?'
#        )
        is( $data->{selfLink}, 'https://www.googleapis.com/plus/v1/people/foo/activities/public?');
#        expect(@result.data.nextLink).to eq(
#            'https://www.googleapis.com/plus/v1/people/foo/activities/public?' +
#            'maxResults=20&pageToken=NEXT%2BPAGE%2BTOKEN'
#        )
        is( $data->{nextLink}, 'https://www.googleapis.com/plus/v1/people/foo/activities/public?maxResults=20&pageToken=NEXT%2BPAGE%2BTOKEN');
#        expect(@result.data.title).to eq('Plus Public Activity Feed for ')
        is( $data->{title}, 'Plus Public Activity Feed for ');
#        expect(@result.data.id).to eq("123456790")
        is( $data->{id}, "123456790");
#        expect(@result.data.items).to be_empty
    };
};

describe 'without a next page token' => sub { 
#      before do
#        allow(@response).to receive(:body).and_return(
#          <<-END_OF_STRING
#          {
#            "kind": "plus#activityFeed",
#            "etag": "FOO",
#            "selfLink": "https://www.googleapis.com/plus/v1/people/foo/activities/public?",
#            "title": "Plus Public Activity Feed for ",
#            "updated": "2012-04-23T00:00:00.000Z",
#            "id": "123456790",
#            "items": []
#          }
#          END_OF_STRING
#        )
#        @result = Google::APIClient::Result.new(@reference, @response)
#      end

    $result = Google::APIClient::Result->new($reference, $response);

    it 'should not return a next page token' => sub { 
#        expect(@result.next_page_token).to eq(nil)
    };

    it 'should return content type correctly' => sub { 
#        expect(@result.media_type).to eq('application/json')
        is($result->media_type, 'application/json'); 
    };

    it 'should return the result data correctly' => sub { 
#        expect(@result.data?).to be_truthy
#        expect(@result.data.class.to_s).to eq(
#            'Google::APIClient::Schema::Plus::V1::ActivityFeed'
#        )
#        expect(@result.data.kind).to eq('plus#activityFeed')
#        expect(@result.data.etag).to eq('FOO')
#        expect(@result.data.selfLink).to eq(
#            'https://www.googleapis.com/plus/v1/people/foo/activities/public?'
#        )
#        expect(@result.data.title).to eq('Plus Public Activity Feed for ')
#        expect(@result.data.id).to eq("123456790")
#        expect(@result.data.items).to be_empty
    };
};

describe 'with JSON error response' => sub { 
#      before do
#        allow(@response).to receive(:body).and_return(
#         <<-END_OF_STRING
#         {
#          "error": {
#           "errors": [
#            {
#             "domain": "global",
#             "reason": "parseError",
#             "message": "Parse Error"
#            }
#           ],
#           "code": 400,
#           "message": "Parse Error"
#          }
#         }
#         END_OF_STRING
#        )
#        allow(@response).to receive(:status).and_return(400)
#        @result = Google::APIClient::Result.new(@reference, @response)
#      end

    $result = Google::APIClient::Result->new($reference, $response);

    it 'should return error status correctly' => sub { 
#        expect(@result.error?).to be_truthy
    };

    it 'should return the correct error message' => sub { 
#        expect(@result.error_message).to eq('Parse Error')
        is( $result->error_message, 'Parse Error');
    };
};

describe 'with 204 No Content response' => sub { 
#      before do
#        allow(@response).to receive(:body).and_return('')
#        allow(@response).to receive(:status).and_return(204)
#        allow(@response).to receive(:headers).and_return({})
#        @result = Google::APIClient::Result.new(@reference, @response)
#      end
#
    it 'should indicate no data is available' => sub { 
#        expect(@result.data?).to be_falsey
    };

    it 'should return nil for data' => sub { 
#        expect(@result.data).to eq(nil)
    };

    it 'should return nil for media_type' => sub { 
#        expect(@result.media_type).to eq(nil)
    };

};

done_testing();
