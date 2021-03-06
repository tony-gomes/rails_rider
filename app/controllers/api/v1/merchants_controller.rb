class Api::V1::MerchantsController < ApplicationController
  def index
    render json: Merchant.all
  end

  def show
    render json: Merchant.find(params[:id])
  end

  def create
    render json: Merchant.create(merchant_params)
  end

  def update
    render json: Merchant.update(params[:id], merchant_params)
  end

  def destroy
    render json: Merchant.delete(params[:id])
  end

  def all_items
    render json: Item.where(merchant_id: params['id'])
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name)
  end
end
