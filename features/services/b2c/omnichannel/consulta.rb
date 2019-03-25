module Omnichannel
  module Rest
    class Omni
      include HTTParty

      headers 'Content-Type' => 'application/json',
              'Authorization' => '9Rs9nJqvqYTpH23RvF7KtfBvoOWuOmgSrj1AtYmwHGao9egL09LNdVt2mFaK1QaJVqwrEChRyfBpGVi2B6c4BpGnXNhcmfz1jWKUSvHeEDLoNPucRzZD1g=='

      base_uri ENDPOINT['omnichannel']['v2']

      def post_consulta(request)
        response = self.class.post('/cupom/consulta', body: JSON.pretty_generate(request))
        generate_evidence response
        response
      end

      def put_consumo(request)
        response = self.class.post('/cupom/consumo', body: JSON.pretty_generate(request))
        generate_evidence response
        response
      end

      def put_efetivacao(request)
        response = self.class.post('/cupom/efetivacao', body: JSON.pretty_generate(request))
        generate_evidence response
        response
      end

      def post_consulta_token_invalido(request)
        response = self.class.post('/cupom/consulta', :headers => { 'Authorization' => 'Token_Invalido'}, body: JSON.pretty_generate(request))
        generate_evidence response
        response
      end
    end
  end
end
