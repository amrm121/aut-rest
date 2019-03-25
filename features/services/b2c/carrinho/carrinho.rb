module ConsultarCarrinho
  module Rest
    class Carrinho
      include HTTParty

      headers 'Content-Type' => 'application/json'

      base_uri URL[BANDEIRA][AMBIENTE]['url_carrinho'] + ENDPOINT['carrinho']

      def post_carrinho(request)
        response = self.class.post('/Carrinho/', body: JSON.pretty_generate(request), :headers => {
            :Cookie => $cookie
        })
        generate_evidence response
        response
      end

      def post_carrinho_v2(request)
        response = self.class.post('/v2/carrinho/', body: JSON.pretty_generate(request), :headers => {:Cookie => $cookie})
        generate_evidence response
        response
      end

      def put_carrinho_sku(request)
        response = self.class.put('/CarrinhoSku/', body: JSON.pretty_generate(request), :headers => {:Cookie => $cookie})
        generate_evidence response
        response
      end

      def delete_sku_carrinho(idCLiente)
        response = self.class.delete("/ExcluirProdutosDoCarrinho/#{idCLiente}", :headers => {:Cookie => $cookie
        })
        generate_evidence response
        response
      end

      def post_alterar_quantidade_sku(id_carrinho_sku, quantidade_sku)
        response = self.class.post("/AlterarQuantidadeSku/#{id_carrinho_sku}/#{quantidade_sku}", :headers => {
            'Cookie' => $cookie
        })
        generate_evidence response
        response
      end

      def put_incluir_sku_servico(request)
        response = self.class.put('/CarrinhoSkuServico/', body: JSON.pretty_generate(request), :headers => {
            'Cookie' => $cookie
        })
        generate_evidence response
        response
      end

      def post_forma_pagamento(request)
        response = self.class.post('/CompraFormaPagamento/',
                                   body: JSON.pretty_generate(request),
                                   headers: {:Cookie => $cookie})
        generate_evidence response
        response
      end

      def post_compra(request)
        response = self.class.post('/Compra/',
                                   body: JSON.pretty_generate(request),
                                   headers: {:Cookie => $cookie, timeout: '30'})
        generate_evidence response
        response
      end

      def post_cupom_desconto(request)
        response = self.class.post('/CupomDesconto/', body: JSON.pretty_generate(request), headers: {:Cookie => $cookie})
        generate_evidence response
        response
      end

      def get_cupom_desconto
        response = self.class.get('/CupomDescontoRemover/', headers: {:Cookie => $cookie})
        generate_evidence response
        response
      end
    end
  end
end