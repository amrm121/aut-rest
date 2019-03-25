module FormaPagamento
  module Rest
    class FormaPagamento
      include HTTParty

      headers 'Content-Type' => 'application/json'

      base_uri URL[BANDEIRA][AMBIENTE]['url_carrinho'] + ENDPOINT['forma_pagamento']

      def get_forma_pagamento_grupos
        response = self.class.get('/FormaPagamentoGrupo', :headers => {:Cookie => $cookie})
        generate_evidence response
        response
      end

      def get_id_forma_pagamento(id_forma_pgto_grupo)
        response = self.class.get("/FormaPagamento/#{id_forma_pgto_grupo}", :headers => {:Cookie => $cookie})
        generate_evidence response
        response
      end

      def get_id_forma_parcelamento(id_forma_pgto, valor_total)
        response = self.class.get("/FormaPagamentoParcelamento/#{id_forma_pgto}/#{valor_total}", :headers => {:Cookie => $cookie})
        generate_evidence response
        response
      end

      def post_pagamento_forma(request)
        response = self.class.post("/FormaPagamento", body: JSON.pretty_generate(request), :headers => {:Cookie => $cookie})
        generate_evidence response
        response
      end

      def post_validar_cartao_presente(request)
        response = self.class.post("/CartaoPresente/Validar", body: JSON.pretty_generate(request), :headers => {:Cookie => $cookie})
        generate_evidence response
        response
      end

    end
  end
end
