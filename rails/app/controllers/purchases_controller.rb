class PurchasesController < ApplicationController
  before_action :set_product

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.product = @product
    @purchase.total_price = (@product.price * @purchase.quantity)

    @product.quantity = (@product.quantity - @purchase.quantity)
    @product.save

    if @purchase.save
      redirect_to products_path
    else
      render :new
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def purchase_params
    params.require(:purchase).permit(:quantity)
  end
end
