module ApiGateway
  module Rest
    class MaisPontos
      include HTTParty

      base_uri URL[BANDEIRA][AMBIENTE]['ApiGateway'] + ENDPOINT['maispontos']

      def get_calculo_pontos(data)
        path = "/lojistas/#{data['id_lojista']}/skus/#{data['id_sku']}/calculopontos"
        params = "precoVenda=#{data['preco_venda']}&unidadeNegocio=#{data['id_unidade_negocio']}&utm_source=#{data['utm_source']}&utm_medium=#{data['utm_medium']}&utm_media=#{data['utm_media']}&utm_campaign=#{data['utm_campaign']}"
        response = self.class.get("#{path}?#{params}")
        generate_evidence(response)
        response
      end
    end
  end
end
