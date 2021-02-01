module Spree
  module StoreControllerDecorator
    def self.prepended(base)
      base.before_action :check_referal
    end

    private

    def check_referal
      return if params[:referal_id].blank? && cookies[:referal_id].blank?
      referal_id = params[:referal_id] || cookies[:referal_id]
      referal = Spree::Referal.find_by(code: referal_id)
      return if referal.blank?
      cookies[:referal_id] = {value: referal_id, expires: Time.now + 4.hours}

      return if current_order.blank?
      return if current_order.spree_referal_id == referal.id
      current_order.update_column(:spree_referal_id, referal.id)
    end

  end
end

::Spree::StoreController.prepend Spree::StoreControllerDecorator
