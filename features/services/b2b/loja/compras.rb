module ApiLoja
  module Rest
    class Compras
      include HTTParty

      headers 'Content-Type' => 'application/json'

      base_uri URL[BANDEIRA][AMBIENTE]['ApiLoja'] + ENDPOINT['compras']

      def post_status_compra_entrega(request)
        response = self.class.post('/Parceiro/StatusCompraEntrega', body: JSON.pretty_generate(request))
        generate_evidence(response)
        response
      end
    end
  end
end
