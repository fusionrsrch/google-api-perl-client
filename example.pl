#!/usr/bin/env perl

use strict;
use warnings;

use lib 'lib';

#require 'google/api_client'
use Google::APIClient;
#require 'google/api_client/client_secrets'
use Google::APIClient::ClientSecrets;
#require 'google/api_client/auth/installed_app'
use Google::APIClient::Auth::InstalledAppFlow;

use Data::Dumper;


## Initialize the client.
my $client = Google::APIClient->new(
#  :application_name => 'Example Ruby application',
    application_name => 'Example Ruby application',
#  :application_version => '1.0.0'
    application_version => '1.0.0'
);

# Initialize Google+ API. Note this will make a request to the
# discovery service every time, so be sure to use serialization
# in your production code. Check the samples for more details.
my $plus = $client->discovered_api('plus');

# Load client secrets from your client_secrets.json.
my $client_secrets = Google::APIClient::ClientSecrets->new();
$client_secrets->load();

# Run installed application flow. Check the samples for a more
# complete example that saves the credentials between runs.
my $flow = Google::APIClient::Auth::InstalledAppFlow->new(
#  :client_id => client_secrets.client_id,
    client_id => $client_secrets->client_id,
#  :client_secret => client_secrets.client_secret,
    client_secret => $client_secrets->client_secret,
#  :scope => ['https://www.googleapis.com/auth/plus.me']
    scope => ['https://www.googleapis.com/auth/plus.me']
);

$client->set_authorization( $flow->authorize );

# Make an API call.
my $result = $client->execute(
#  :api_method => plus.activities.list,
    api_method => $plus->activities->list,
#  :parameters => {'collection' => 'public', 'userId' => 'me'}
    parameters => {'collection' => 'public', 'userId' => 'me'}
);

#puts result.data
print Dumper( $result );
