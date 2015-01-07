# Google API Perl Client

<dl>
  <dt>Homepage</dt><dd><a href="https://github.com/fusionrsrch/google-api-perl-client.git">https://github.com/fusionrsrch/google-api-perl-client.git</a></dd>
</dl>

## Description

The Google API Perl Client makes it trivial to discover and access supported
APIs.

## Example Usage

```perl
use Google::APIClient;
use Google::APIClient::ClientSecrets;
use Google::APIClient::Auth::InstalledAppFlow;

# Initialize the client.
my $client = Google::APIClient->new(
    application_name => 'Example Perl application',
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
    client_id => $client_secrets->client_id,
    client_secret => $client_secrets->client_secret,
    scope => ['https://www.googleapis.com/auth/plus.me']
);

$client->set_authorization( $flow->authorize );

# Make an API call.
my $result = $client->execute(
    api_method => $plus->activities->list,
    parameters => {'collection' => 'public', 'userId' => 'me'}
);
```
