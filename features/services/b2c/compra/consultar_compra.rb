module Compra
  module Rest
    class ConsultarCompra
      include HTTParty

      base_uri URL[BANDEIRA][AMBIENTE]['ApiB2C'] + ENDPOINT['compra_finalizada']

      def compra_finalizada(id_compra)
        response = self.class.get("/?IdCompra=#{id_compra}",
                                  :headers => {'Content-Type' => 'application/json',
                                                'AuthTicket' => $ticket})
        generate_evidence response
        response
      end

    end
  end
end