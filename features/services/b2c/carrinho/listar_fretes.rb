module ConsultarCarrinho
  module Rest
    class ListarFretes
      include HTTParty
      headers 'Content-Type' => 'application/json'
      base_uri URL[BANDEIRA][AMBIENTE]['url_carrinho_multicanalidade'] + ENDPOINT['listar_fretes']

      def post_listar_fretes(request)
        response = self.class.post('/ListarFretes/', body: JSON.pretty_generate(request))
        generate_evidence response
        response
      end
    end
  end
end