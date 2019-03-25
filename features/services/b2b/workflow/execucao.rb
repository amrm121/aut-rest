module ApiWorkflow
  module Rest
    class Execucao
      include HTTParty

      headers 'Authorization' => 'IHoslO6GrLUWXfqHAw4xdVyiqCcPHxGk0uTHxPpYjD6uEpg6A25lepootB76SNLbyaBWnQsl+JTZZF/FbhNeFXAqntrlVq3KtII4ExGFoKqSieaurHEa3w==',
              'X-SecurityAccess' => 'External'

      base_uri URL[BANDEIRA][AMBIENTE]['ApiWorkflow'] + ENDPOINT['execucao_instancia']

      def get_instancia(data)
        response = self.class.get("?idWorkflowInstancia=#{data['id_instancia']}")
        generate_evidence(response)
        response
      end
    end
  end
end
