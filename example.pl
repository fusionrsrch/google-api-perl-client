#!/usr/bin/env perl

use strict;
use warnings;

use lib 'lib';

use Google::APIClient;
use Google::APIClient::ClientSecrets;
use Google::APIClient::Auth::InstalledAppFlow;

## Initialize the client.
my $client = Google::APIClient->new( options => {
    application_name => 'Example Ruby application',
    application_version => '1.0.0' }
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
    client_id => $client_secrets->client_id,
    client_secret => $client_secrets->client_secret,
    scope => ['https://www.googleapis.com/auth/plus.me']
);

$client->set_authorization( $flow->authorize );

# Make an API call.
my $result = $client->execute(
    #api_method => $plus->activities->list,
    api_method => 'dude',
    parameters => {'collection' => 'public', 'userId' => 'me'}
);
