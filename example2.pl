#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;

use lib 'lib';

use Google::APIClient::UserAgent;

my $agent = Google::APIClient::UserAgent->new();

print $agent->agent,"\n";
print $agent->build_request,"\n";

print Dumper( $agent );
