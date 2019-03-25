module Login
  module Rest
    class Login
      include HTTParty

      headers 'Content-Type' => 'application/json'

      base_uri URL[BANDEIRA][AMBIENTE]['url_carrinho'] + ENDPOINT['cliente']

      def post_login(request)
        response = self.class.post('/Cliente/Login', body: JSON.pretty_generate(request))
        generate_evidence response
        response
      end

      def post_logoff
        response = self.class.post('/Cliente/Logoff', headers: {:Cookie => $cookie, 'Content-Type' => 'application/json'})
        generate_evidence response
        response
      end
    end
  end
end
