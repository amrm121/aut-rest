module ApiMaisPontos
  module Rest
    class Configuracao
      include HTTParty

      headers 'Authorization' => 'rLWBzUtuHjZWeJIIW7wVh7Q4ILoDdslo25cEQDYGIU8B3MlSS3snKBoK6ar360QU07//FEuwG4M/v8xLyySsNCjPgLj2BwrqX7BLXVVNziUD8hwyvKevEA==',
              'X-SecurityAccess' => 'External'

      base_uri URL[BANDEIRA][AMBIENTE]['ApiMaisPontos'] + ENDPOINT['configuracoes']

      def get_configuracoes(data)
        response = self.class.get("?idParceiro=#{data['id_parceiro']}")
        generate_evidence(response)
        response
      end
    end
  end
end
