module ApiCatalogo
  module Rest
    class Categorias
      include HTTParty

      base_uri URL[BANDEIRA][AMBIENTE]['ApiCatalogo'] + ENDPOINT['categorias']

      def get_obter_categorias(id_categoria)
        response = self.class.get("/Obter?FlagSubCategorias=true&IdCategoria=#{id_categoria}")
        generate_evidence(response)
        response
      end
    end
  end
end
