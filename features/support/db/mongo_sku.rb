# Classe responsável pelo manuseio do mongo
module DB
  module MongoDB
    module MongoSku

      def self.get_sku(sku_balance = true, active_flag = true, limit = 10)

        query_mongo = type_of_sku(sku_balance, active_flag, limit)
        list_sku = []
        list_sku << find_sku(query_mongo)
        list_sku
      end

      private

      def self.type_of_sku(sku_balance, active_flag, limit)
        @db_connection = MongoConnection.get_connection
        query_mongo = @db_connection[:Produto].find(:Colecoes => {'$in' => [12593]},
                                                    :FlagSkuSaldoDisponivel => sku_balance,
                                                    :FlagAtiva => active_flag).limit(limit)
        query_mongo
      end

      def self.find_sku query_mongo
        indice = 0
        numero_lojista = 0
        sku_id = []
        count = 0

        query_mongo.to_a.size.times do |index_collection|
          break if count == 10
          indice = index_collection
          sku_lojistas = query_mongo.to_a[index_collection]['Skus'][0][1]['SkuLojistas']
          sku_lojistas.size.times do |index_lojista|
            numero_lojista = index_lojista
            if (sku_lojistas[index_lojista]['Lojista']['LojistaGPA'].eql? true) && (sku_lojistas[index_lojista]['Lojista']['RetiroEmLoja'].eql? false)
              sku_id << sku_lojistas[index_lojista]['IdSku']
              count += 1
            end
            break if count == 10
          end
        end
        puts "Result mongo: #{indice} e index do lojista #{numero_lojista}"
        sku_id = sku_id.sort
        sku_id
      end
    end
  end
end


