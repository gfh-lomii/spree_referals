module Spree
  class Referal < Spree::Base
    belongs_to :cart

    validates :first_name, :last_name, :email, presence: true
  end
end
