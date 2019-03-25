module ApiAdminB2b
  module Rest
    class LojaPersonalizada
      include HTTParty

      headers 'Content-Type' => 'application/json'

      base_uri URL[BANDEIRA][AMBIENTE]['ApiAdminB2b'] + ENDPOINT['loja_personalizada']

      def post_consultar_vinculos_loja(id)
        response = self.class.post("/ConsultarVinculosLoja/?id=#{id}")
        generate_evidence(response)
        response
      end
    end
  end
end
