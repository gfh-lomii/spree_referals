module SpreeReferals::Spree
  module StoreControllerDecorator
    def self.prepended(base)
      base.before_action :check_referal
    end

    private

    def check_referal
      return if params[:referal_id].blank?
      referal = Spree::Referal.find_by(code: params[:referal_id])
      return if referal.blank?
      current_order.update_column(:spree_referal_id, referal.id)
    end

  end
end

::Spree::StoreController.prepend SpreeReferals::Spree::StoreControllerDecorator
