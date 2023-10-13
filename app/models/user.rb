class User < ApplicationRecord
  before_validation :format_phone_number, :format_cpf
  before_save :format_name

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email format" }
  validates :phone, presence: true, format: { with: /\A\(\d{2}\) \d{5}-\d{4}\z/, message: "Invalid phone format" }
  validates :cpf, presence: true, uniqueness: true, format: { with: /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/, message: "Invalid CPF format" }
  has_one_attached :photo

  private

  def format_phone_number
    return if phone.blank?

    self.phone = phone.gsub(/\D/, '')

    if phone.length == 11
      self.phone = "(#{phone[0..1]}) #{phone[2..6]}-#{phone[7..10]}"
    else
      errors.add(:phone, "Invalid phone format")
    end
  end

  def format_cpf
    return if cpf.blank?

    self.cpf = cpf.gsub(/\D/, '')

    if cpf.length == 11
      self.cpf = "#{cpf[0..2]}.#{cpf[3..5]}.#{cpf[6..8]}-#{cpf[9..10]}"
    else
      errors.add(:cpf, "Invalid CPF format")
    end
  end

  def format_name
    return if name.blank?

    self.name = name.split.map(&:capitalize).join(' ')
  end
end
