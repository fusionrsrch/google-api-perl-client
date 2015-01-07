use MooseX::Declare;

class Google::APIClient::Auth::InstalledAppFlow {

    use Data::Dumper;

    use Method::Signatures::Simple name => 'action';

#
#require 'webrick'
#require 'launchy'
#
#module Google
#  class APIClient
#
#    # Small helper for the sample apps for performing OAuth 2.0 flows from the command
#    # line or in any other installed app environment.
#    #
#    # @example
#    #
#    #    client = Google::APIClient.new
#    #    flow = Google::APIClient::InstalledAppFlow.new(
#    #      :client_id => '691380668085.apps.googleusercontent.com',
#    #      :client_secret => '...',
#    #      :scope => 'https://www.googleapis.com/auth/drive'
#    #    )
#    #    client.authorization = flow.authorize
#    #
#    class InstalledAppFlow
#      
#      RESPONSE_BODY = <<-HTML
#        <html>
#          <head>
#            <script>
#              function closeWindow() { 
#                window.open('', '_self', '');
#                window.close();
#              }
#              setTimeout(closeWindow, 10);
#            </script>
#          </head>
#          <body>You may close this window.</body>
#        </html>
#      HTML
#      
#      ##
#      # Configure the flow
#      #
#      # @param [Hash] options The configuration parameters for the client.
#      # @option options [Fixnum] :port
#      #   Port to run the embedded server on. Defaults to 9292
#      # @option options [String] :client_id 
#      #   A unique identifier issued to the client to identify itself to the
#      #   authorization server.
#      # @option options [String] :client_secret
#      #   A shared symmetric secret issued by the authorization server,
#      #   which is used to authenticate the client.
#      # @option options [String] :scope
#      #   The scope of the access request, expressed either as an Array
#      #   or as a space-delimited String.
#      #
#      # @see Signet::OAuth2::Client
#      def initialize(options)
#        @port = options[:port] || 9292
#        @authorization = Signet::OAuth2::Client.new({
#          :authorization_uri => 'https://accounts.google.com/o/oauth2/auth',
#          :token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
#          :redirect_uri => "http://localhost:#{@port}/"}.update(options)
#        )
#      end
#      
      ##
      # Request authorization. Opens a browser and waits for response.
      #
      # @param [Google::APIClient::FileStorage] storage
      #  Optional object that responds to :write_credentials, used to serialize
      #  the OAuth 2 credentials after completing the flow.
      #
      # @return [Signet::OAuth2::Client]
      #  Authorization instance, nil if user cancelled.
#      def authorize(storage=nil)
      action authorize($storage) {
#        auth = @authorization
#    
#        server = WEBrick::HTTPServer.new(
#          :Port => @port,
#          :BindAddress =>"localhost",
#          :Logger => WEBrick::Log.new(STDOUT, 0),
#          :AccessLog => []
#        )
#        begin
#          trap("INT") { server.shutdown }
#
#          server.mount_proc '/' do |req, res|
#            auth.code = req.query['code']
#            if auth.code
#              auth.fetch_access_token!
#            end
#            res.status = WEBrick::HTTPStatus::RC_ACCEPTED
#            res.body = RESPONSE_BODY
#            server.stop
#          end
#
#          Launchy.open(auth.authorization_uri.to_s)
#          server.start
#        ensure
#          server.shutdown
#        end
#        if @authorization.access_token
#          if storage.respond_to?(:write_credentials)
#            storage.write_credentials(@authorization)
#          end
#          return @authorization
#        else
#          return nil
#        end
#      end
#    end
        return;
    }

#
#  end
#end
#
#

}
