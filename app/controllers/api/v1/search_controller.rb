class Api::V1::SearchController < ApplicationController
  def show
    service = MerchantSearchService.new if params[:resource] == 'merchants'
    service = ItemSearchService.new if params[:resource] == 'items'
    render json: service.package(params) if service
  end
end
