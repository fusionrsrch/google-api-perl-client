use MooseX::Declare;

class Google::APIClient::Reference extends Google::APIClient::Request {

    use Data::Dumper;

    use Method::Signatures::Simple name => 'action';

    ##
    # Subclass of Request for backwards compatibility with pre-0.5.0 versions of the library
    # 
    # @deprecated
    #   use {Google::APIClient::Request} instead
}
