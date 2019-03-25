module Endereco
  module Rest
    class Endereco
      include HTTParty

      base_uri URL[BANDEIRA][AMBIENTE]['url_carrinho'] + ENDPOINT['endereco']

      def get_endereco
        response = self.class.get('/Endereco',
          :headers => {
            'Cookie' => $cookie,
            'Content-Type' => 'application/json'
        })
        generate_evidence response
        return response
      end

      def put_endereco_meu_perfil(response_login, request)
        response = self.class.put('/EnderecoMeuPerfil', call_with_cookie(response_login, request))
        generate_evidence response
        response
      end

      private

      def header_with_cookie response
        {headers:
             {
                 'Cookie' => parse_cookie(response),
             }
        }
      end

      def call_with_cookie(response, request = nil)
        {headers:
             {
                 'Content-Type' => 'application/json',
                 'Cookie' => parse_cookie(response),
             },
         body: JSON.pretty_generate(request)
        }
      end

    end
  end
end
