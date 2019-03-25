module ApiMarketing
  module Rest
    class EstrategiaVenda
      include HTTParty

      base_uri URL[BANDEIRA][AMBIENTE]['ApiMarketing'] + ENDPOINT['estrategia_venda_marketing']

      def get_informacoes_envio_parceiro
        response = self.class.get('/InformacoesEnvioParceiro')
        generate_evidence(response)
        response
      end
    end
  end
end
