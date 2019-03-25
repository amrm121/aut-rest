Dado('que tenha um payload padrão do método {string} da API Catálogo') do |string|
  metodo = string.downcase.tr(' ', '_')
  @data = HcObterCategoriasFactories.method(metodo).call
end

Quando('é enviada uma requisição GET para {string} da API Catálogo') do |string|
  metodo = string.downcase.tr(' ', '_')
  @response_body = catalogo_categorias.method("get_#{metodo}").call(@data)
end
