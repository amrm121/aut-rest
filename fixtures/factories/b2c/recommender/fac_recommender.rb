class RequestRecommender

  LISTAR_FRETE_MASSA = YAML.load_file("#{PATH_API_REST}features/support/massa/carrinho/listar_fretes.yml")

  def self.request_valid_sku_recommender
    LISTAR_FRETE_MASSA[BANDEIRA][AMBIENTE]['id_sku']['normal'].sample
  end
end
