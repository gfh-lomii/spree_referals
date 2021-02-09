module Spree
  class ReferalPurchaseMailer < BaseMailer
    def notification(order, resend = false)
      @order = order.respond_to?(:id) ? order : Spree::Order.complete.find(order)
      return if @order.spree_referal_id.blank?

      @referal = Spree::Referal.find(@order.spree_referal_id)
      current_store = @order.store
      subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
      subject += "#{current_store.name} #{Spree.t('referal_purchase_mailer.notification.subject')} ##{@order.number}"
      mail(to: @referal.email, from: from_address, subject: subject)
    end
  end
end
