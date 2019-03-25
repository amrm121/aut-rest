E("informo um cupom de desconto {string}") do |tipo_cupom|
  @cupom = DescontoCommons.obtenho_cupom_desconto_massa tipo_cupom
end


E('faço uma requisição POST para o serviço CupomDesconto') do
  @contrato_cupom = RequestCarrinho.contrato_cupom_desconto(@cupom)
  @response_cupom_desconto = carrinho.post_cupom_desconto(@contrato_cupom)
end

E('faço uma requisição POST para o serviço CupomDescontoRemover') do
  @response_cupom_desconto = carrinho.get_cupom_desconto
end

Entao('valido mensagem de cupom de desconto invalido') do
  expect(@response_cupom_desconto['carrinho']['Erro']).to eql true
  expect(@response_cupom_desconto['carrinho']['Mensagens'][0]).to eql DescontoCommons.valida_mensagem_cupom
end

Entao('valido cupom inserido com sucesso') do
  expect(@response_cupom_desconto['carrinho']['Erro']).to eql false
  expect(@response_cupom_desconto['carrinho']['Cupom']['Cupom']).to eql @cupom
  expect(@response_cupom_desconto['carrinho']['ValorTotal']).to eql DescontoCommons.validar_valor_com_desconto @response_cupom_desconto
end

Entao('valido cupom removido com sucesso') do
  expect(@response_cupom_desconto['Erro']).to eql false
  expect(@response_cupom_desconto['Cupom']).to be_nil
end