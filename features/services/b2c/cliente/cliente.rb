module Cliente
  module Rest
    class Cliente
      include HTTParty

      headers 'Content-Type' => 'application/json'

      base_uri URL[BANDEIRA][AMBIENTE]['url_carrinho'] + ENDPOINT['cliente']

      def put_criar_usuario(request)
        response = self.class.put('/Cliente2', body: JSON.pretty_generate(request))
        generate_evidence response
        response
      end
    end
  end
end
