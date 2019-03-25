module EnviarPropostaBradesco
  module Rest
    class EnviarProposta
      include HTTParty

      headers 'Content-Type' => 'application/json'

      base_uri URL[BANDEIRA][AMBIENTE]['url_carrinho'] + ENDPOINT['bradesco_enviar_proposta']

      def post_primeira_compra(request)
        response = self.class.post('',body: JSON.pretty_generate(request))
        generate_evidence response
        response
      end
    end
  end
end