module Endereco
  module Rest
    class TiposEntrega
      include HTTParty
      default_timeout 30

      base_uri URL[BANDEIRA][AMBIENTE]['url_carrinho'] + ENDPOINT['endereco']

      def get_tipos_entrega(id_cliente_endereco)
        response = self.class.get("/TiposEntrega/#{id_cliente_endereco}",
                                  :headers => {:Cookie => $cookie, 'Content-Type' => 'application/json'})
        generate_evidence response
        response
      end
    end
  end
end
