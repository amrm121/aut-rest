module Cliente
  module Rest
    class ConsultarCliente
      include HTTParty

      headers 'Cookie' => $cookie,
              'Content-Type' => 'application/json'

      base_uri URL[BANDEIRA][AMBIENTE]['url_carrinho'] + ENDPOINT['cliente']

      def get_obter_token_carne_online
        response = self.class.get('/Cliente/ObterTokenCarneOnline', :headers => { 'Cookie' => $cookie,
        'Content-Type' => 'application/json'})
        generate_evidence response
        response
      end

      def get_autenticar_cliente_logado
        response = self.class.get('/Cliente/Autenticado', :headers => {
            :Cookie => $cookie
        })
        generate_evidence response
        response
      end

      def post_renovacao_token(request)
        response = self.class.post('/Cliente/TokensRenovacoes', body: JSON.pretty_generate(request))
        generate_evidence response
        response
      end
    end
  end
end
