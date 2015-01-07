use strict;
use warnings;

use Test::More::Behaviour;

use Google::APIClient;

BEGIN {
    use_ok('Google::APIClient::Service::Request');
}

describe 'Google::APIClient::Service::Request' => sub {

    my $CLIENT = Google::APIClient->new( application_name => 'API Client Tests' );

    it 'should normalize parameter names to strings' => sub { 

        my $request = Google::APIClient::Service::Request->new( 
            uri => 'https://www.google.com',
            parameters => { a => '1', 'b' => '2' }
        );

        is($request->parameters->{'a'}, '1');
        is($request->parameters->{'b'}, '2');
    };
};

done_testing();
