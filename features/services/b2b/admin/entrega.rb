module ApiIntegracaoB2b
  module Rest
    class LocaisRetirada
      include HTTParty

      headers 'Content-Type' => 'application/json',
              'Authorization' => 'a1uLEUbp6U2toE9lM0t6dA=='

      base_uri URL[BANDEIRA][AMBIENTE]['ApiIntegracaoB2b'] + ENDPOINT['entrega']

      def get_locais_entrega(data)
        response = self.class.get('/locais-retirada?' "cep=#{data['cep']}&idCampanha=#{data['id_campanha']}&idSku=#{data['id_sku']}")
        generate_evidence(response)
        response
      end
    end
  end
end