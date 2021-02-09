module Spree
  module OrderDecorator
    def self.prepended(base)
      base.state_machine.after_transition to: :complete, do: :send_referal_notification
    end

    private

    def send_referal_notification
      return if spree_referal_id.blank?
      return if referal_delivered?

      ReferalPurchaseMailer.notification(id, false).deliver_later
      update_column(:referal_delivered, true)
    end

  end
end

::Spree::Order.prepend Spree::OrderDecorator
