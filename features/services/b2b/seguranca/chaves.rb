module ApiSeguranca
  module Rest
    class Chaves
      include HTTParty

      headers 'X-SecurityAccess' => 'External'

      base_uri URL[BANDEIRA][AMBIENTE]['ApiSeguranca'] + ENDPOINT['chaves']

      def get_chaves
        response = self.class.get('')
        generate_evidence(response)
        response
      end
    end
  end
end
