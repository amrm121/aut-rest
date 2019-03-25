module ApiCotadorB2B
  module Rest
    class Comum
      include HTTParty

      base_uri URL[BANDEIRA][AMBIENTE]['ApiCotadorB2B'] + ENDPOINT['comum']

      def get_mensagens
        response = self.class.get('/Mensagens')
        generate_evidence(response)
        response
      end
    end
  end
end
