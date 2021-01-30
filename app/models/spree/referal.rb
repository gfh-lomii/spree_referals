module Spree
  class Referal < Spree::Base
    belongs_to :cart

    validates :code, :first_name, :last_name, :email, presence: true

    def full_name
      first_name + ' ' + last_name
    end
  end
end
