module Retira
  module Rest
    class OutrasLojasRetira
      include HTTParty
      # headers 'Content-Type' => 'application/json'
      base_uri URL[BANDEIRA][AMBIENTE]['url_bandeira'] + ENDPOINT['async_outras_lojas_retira']

      def get_outras_lojas_retira(data)
        response = self.class.get("?cep=#{data['cep']}&idsku=#{data['idsku']}&isImediata=#{data['isImediata']}&isProprietario=#{data['isProprietario']}", format: :json)
        generate_evidence(response)
        response
      end
    end
  end
end
