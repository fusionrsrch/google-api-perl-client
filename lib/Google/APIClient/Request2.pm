use MooseX::Declare;

class Google::APIClient::Request2 {

    use Data::Dumper;

    use Method::Signatures::Simple name => 'action';

    use LWP::UserAgent;

    # @return [Hash] Request parameters
#      attr_reader :parameters
    has 'parameters' => ( isa => 'HashRef', is => 'rw' );

    # @return [Hash] Additional HTTP headers
#      attr_reader :headers
    has 'headers' => ( isa => 'HashRef', is => 'rw' );

    # @return [Google::APIClient::Method] API method to invoke
#      attr_reader :api_method
    has 'api_method' => ( isa => 'Str', is => 'rw' );

    # @return [Google::APIClient::UploadIO] File to upload
#      attr_accessor :media
    has 'media' => ( isa => 'Str', is => 'rw' );

    # @return [#generated_authenticated_request] User credentials
#      attr_accessor :authorization
    has 'authorization' => ( is => 'rw' );

    # @return [TrueClass,FalseClass] True if request should include credentials
#      attr_accessor :authenticated
    has 'authenticated' => ( isa => 'Str', is => 'rw' );

    # @return [#read, #to_str] Request body
#      attr_accessor :body
    has 'body' => ( isa => 'Str', is => 'rw' );

    has 'options' => ( isa => 'HashRef', is => 'rw' );

    action BUILD() {
    }

#   # private attributes
#    has '_lwp_handle'  => ( isa => 'Google::APIClient::UserAgent', is => 'ro', builder => '__build_lwp_handle'  );
##    has '_json_handle' => ( isa => 'JSON',           is => 'ro', builder => '__build_json_handle'  );
#
#    # builders
#    action __build_lwp_handle() { return LWP::UserAgent->new(); }


    # Transmits the request with the given connection
    #
    # @api private
    #
    # @param [Faraday::Connection] connection
    #   the connection to transmit with
    # @param [TrueValue,FalseValue] is_retry
    #   True if request has been previous sent
    #
    # @return [Google::APIClient::Result]
    #   result of API request
#    def send(connection, is_retry = false)
    action send($connection, $is_retry) {

        print Dumper( $self );
        print Dumper( $connection );

        my $http_method = $self->api_method;

        print "#{self.class} Sending API request ".$http_method." #{env[:url].to_s} #{env[:request_headers]}\n";

    }


}
