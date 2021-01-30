  module Spree
    module Admin
      class ReferalsController < ResourceController

        private

        def find_resource
          Referal.find(params[:id])
        end

      def collection
        params[:q] = {} if params[:q].blank?
        referals = super
        @search = referals.ransack(params[:q])
        @collection = @search.result.
            page(params[:page]).
            per(params[:per_page])
      end


      end
    end
  end
