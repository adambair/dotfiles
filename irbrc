def clear
  puts %x(clear)
end

class KD
  class Trigo
    class << self
      # u = KD::Trigo.reset_password('dkelly')
      def reset_password(login, password='password')
        u = User.where(login: login).first
        u.password = password_confirmation = password
        u.save
        u
      end
    end
  end
end

require 'awesome_print'
