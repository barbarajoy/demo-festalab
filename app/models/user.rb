class User < ApplicationRecord
  before_validation :format_phone_number

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Formato de email inválido" }
  validates :phone, presence: true, format: { with: /\A\(\d{2}\) \d{5}-\d{4}\z/, message: "Formato de telefone inválido" }
  validates :cpf, presence: true, format: { with: /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/, message: "Formato de cpf inválido" }

  private

  def format_phone_number
    self.phone = phone.gsub(/\D/, '')

    if phone.length == 11
      self.phone = "(#{phone[0..1]}) #{phone[2..6]}-#{phone[7..10]}"
    else
      errors.add(:phone, "Formato de telefone inválido")
    end
  end
end
