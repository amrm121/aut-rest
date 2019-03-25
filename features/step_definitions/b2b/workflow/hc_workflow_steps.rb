Dado("que tenha um payload padrão do método {string} da API Workflow") do |string|
  metodo = string.downcase.tr(' ', '_')
  @data = HcExecucaoFactories.method(metodo).call
end

Quando("é enviada uma requisição GET para {string} da API Workflow") do |string|
  metodo = string.downcase.tr(' ', '_')
  @response_body = workflow_execucao.method("get_#{metodo}").call(@data)
end
