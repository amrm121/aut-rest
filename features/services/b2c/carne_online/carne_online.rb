module CarneOnline
  module Rest
    class CarneOnlineAPI
      include HTTParty

      base_uri URL[BANDEIRA][AMBIENTE]['ApiCarneOnline']

      def consultar_elegibilidade(request)
        response = self.class.post('/Consulta/Elegibilidade',
                                   :headers => {'Content-Type' => 'application/json',
                                                'AuthTicket' => @@authticket},
                                   body: JSON.pretty_generate(request))
        generate_evidence response
        response
      end

      def consultar_plano(request)
        response = self.class.post('/Consulta/Plano',
                                   :headers => {'Content-Type' => 'application/json',
                                                'AuthTicket' => @@authticket},
                                   body: JSON.pretty_generate(request))
        generate_evidence response
        response
      end


    end
  end
end