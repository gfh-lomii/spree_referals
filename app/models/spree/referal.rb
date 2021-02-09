module Spree
  class Referal < Spree::Base
    belongs_to :order

    validates :code, :first_name, :last_name, :email, presence: true
    self.whitelisted_ransackable_attributes = %w[code first_name last_name email]
    
    def full_name
      first_name + ' ' + last_name
    end
  end
end
