module RetiraCommons
  def self.check_contains_withdraw_point(form_withdraw, response_body)
    is_withdraw_type = false
    response_body.each do |withdraw|
      next unless withdraw.first.eql? 'Lojas'
      response_body['Lojas'].size.times do |index|
        is_withdraw_type = true if withdraw.last[index]['IdTipoPontoRetirada'].eql? withdraw_type(form_withdraw)
      end
    end

    is_withdraw_type
  end

  def self.check_sequence_withdraw_point(number_shops, form_withdraw, response_body)
    is_withdraw_type = false
    response_body.each do |withdraw|
      next unless withdraw.first.eql? 'Lojas'
      number_shops.times do |index|
        if (withdraw.last[index]['IdTipoPontoRetirada']).eql? withdraw_type(form_withdraw)
          is_withdraw_type = true
        end
      end
    end
    is_withdraw_type
  end

  def self.return_withdraw_point(response_body, form_withdraw)
    array_shops = []
    response_body.each do |withdraw|
      next unless withdraw.first.eql? 'Lojas'
      response_body['Lojas'].size.times do |index|
        if (withdraw.last[index]['IdTipoPontoRetirada']).eql? withdraw_type(form_withdraw)
          array_shops.push(withdraw.last[index])
        end
      end
    end
    validate_array_shops(array_shops, form_withdraw).sample
  end

  def self.validate_array_shops(array, form_withdraw)
    if array.empty?
      raise "Não foi encontrado nenhum ponto de retirada '#{form_withdraw}'"
    end
    array
  end
end
