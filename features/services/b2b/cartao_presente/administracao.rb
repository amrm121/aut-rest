module ApiCartaoPresente
  module Rest
    class Administracao
      include HTTParty

      headers 'Authorization' => 'IHoslO6GrLUWXfqHAw4xdVyiqCcPHxGk0uTHxPpYjD6uEpg6A25lepootB76SNLbyaBWnQsl+JTZZF/FbhNeFXAqntrlVq3KtII4ExGFoKqSieaurHEa3w==',
              'X-SecurityAccess' => 'External'

      base_uri URL[BANDEIRA][AMBIENTE]['ApiCartaoPresente'] + ENDPOINT['administracao']

      def get_contrato_esta_inadimplente(data)
        response = self.class.get("/Contratos/ContratoEstaInadimplente?IdWorkflowInstancia=#{data['id_workflow']}")
        generate_evidence(response)
        response
      end
    end
  end
end
