use MooseX::Declare;

class Google::APIClient::UserAgent extends LWP::UserAgent is mutable {

    use Data::Dumper;

    use Method::Signatures::Simple name => 'action';

    action build_request($method,$url,$headers,$body) {

        my $request = HTTP::Request->new( GET => 'http://search.cpan.org/dist/libwww-perl/');
        $request->header('Accept' => 'text/html');

        return $request;
    }

#    around new { 
#        my $obj = $self->SUPER::new( @_ );
#        return $self->meta->new_object( __INSTANCE__ => $obj, @_ );
#        return $obj;
#    }

#    method setup {
#        $self->start_mode( 'main' );
#
#        my @methods = map { $_->name } $self->meta->get_all_methods;
#
#        $self->run_modes( map  { /^rm_(.+)$/  => $_ }
#                          grep { /^rm_/ }
#                          @methods
#                        );
#    }

    __PACKAGE__->meta->make_immutable( inline_constructor => 0 );

}
