class User < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Formato de email inválido" }
  validates :phone, presence: true, format: { with: /\A\d{11}\z/, message: "Formato de telefone inválido" }
  validates :cpf, presence: true, format: {with: /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/, message: "Formato de cpf inválido"}
end
