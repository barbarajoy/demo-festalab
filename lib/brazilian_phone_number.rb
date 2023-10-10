module Faker
  class PhoneNumber
    class << self
      def brazilian_phone_number
        format("(#{rand(10..99)})", rand(1_0000..9_9999), rand(1_0000..9_9999))
      end
    end
  end
end
