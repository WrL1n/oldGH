# frozen_string_literal: true

# Вариант 'Minimum', без проверок и т.п.
class Host
  attr_accessor :email

  def initialize(email = 'default.host@email.com')
    self.email = email
  end
end
