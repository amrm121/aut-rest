module ApiIntegracaoB2b
  module Rest
    class Pedidos
      include HTTParty

      headers 'Content-Type' => 'application/json',
              'Authorization' => 'a1uLEUbp6U2toE9lM0t6dA=='

      base_uri URL[BANDEIRA][AMBIENTE]['ApiIntegracaoB2b'] + ENDPOINT['pedidos']

      def put_confirmar_reserva(request, row, cod_pedido)
        response = self.class.put('/' "#{cod_pedido}/reserva/confirmacao/#{row[:confirmacao]}", body: JSON.pretty_generate(request))
        generate_evidence(response)
        response
      end

      def post_criar_reserva(request)
        response = self.class.post('/reserva', body: JSON.pretty_generate(request))
        generate_evidence(response)
        response
      end
    end
  end
end