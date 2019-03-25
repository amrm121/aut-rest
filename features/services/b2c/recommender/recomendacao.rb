module Recommender
  module Rest
    class Recomendacao
      include HTTParty

      headers 'Content-Type' => 'application/json'

      base_uri URL[BANDEIRA][AMBIENTE]['ApiRecomendacao'] + ENDPOINT['recomendacao']

      def get_recomendacoes sku
        response = self.class.get("/?kind=w16&id=#{sku}")
        generate_evidence response
        response
      end
    end
  end
end
