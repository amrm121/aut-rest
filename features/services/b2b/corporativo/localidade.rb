module ApiCorporativo
  module Rest
    class Localidade
      include HTTParty

      base_uri URL[BANDEIRA][AMBIENTE]['ApiCorporativo'] + ENDPOINT['localidade']

      def get_localidade_ceps(cep)
        response = self.class.get("/Ceps/#{cep}")
        generate_evidence(response)
        response
      end
    end
  end
end
