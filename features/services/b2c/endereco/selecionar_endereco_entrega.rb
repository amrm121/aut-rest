module Endereco
  module Rest
    class SelecionarTiposEntrega
      include HTTParty

      base_uri URL[BANDEIRA][AMBIENTE]['url_carrinho'] + ENDPOINT['carrinho']

      headers 'Content-Type' => 'application/json'

      def post_selecionar_entrega(request)
        response = self.class.post('/v2/CarrinhoEnderecoEntrega/', body: JSON.pretty_generate(request), :headers => {
            :Cookie => $cookie
        })
        generate_evidence response
        response
      end
    end
  end
end

