# Classe responsável pela conexão com o mongo
#TODO - Conexão ainda batendo apenas no banco de stage da CasasBahia. Avaliar incluir bancos e ambientes restantes
module DB
  module MongoDB
    module MongoConnection
      @client = nil

      def self.create_connection
        @client = Mongo::Client.new([DATABASE['mongo']['server']],
                                    :database => DATABASE['mongo']['database'],
                                    :server_selection_timeout => 10)

        $LOG.info 'Estabelecida conexão com MongoDB'
        $LOG.info 'Server: ' + DATABASE['mongo']['server'].to_s
        $LOG.info 'Database: ' + DATABASE['mongo']['database'].to_s

      rescue StandardError => err
        $LOG.info 'Não foi possível realizar a conexão com o MongoDB: ' + err
        raise 'Não foi possível realizar a conexão com o MongoDB:' + err
      end

      def self.get_connection
        raise 'Conexão com o MongoDB não iniciada' if @client.nil?
        @client
      end

      def self.finilize_connection
        @client.close
        $LOG.info 'Finalizada conexão com MongoDB'
        @client = nil
      end
    end
  end
end


