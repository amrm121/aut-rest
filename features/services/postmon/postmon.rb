module Postmon
  module Rest
    class Postmon
      include HTTParty

      headers 'Content-Type' => 'application/json'

      base_uri 'http://api.postmon.com.br/v1/cep/'

      def get_cep(cep)
        response = self.class.get("/#{cep}")
        generate_evidence response
        response
      end
    end
  end
end
