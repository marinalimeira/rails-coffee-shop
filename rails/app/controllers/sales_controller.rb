class SalesController < ApplicationController
  before_action :set_product

  def new
    @sale = Sale.new
  end

  def create
    @sale = Purchase.new(sale_params)
    @sale.product = @product
    @sale.total_price = (@product.price * @sale.quantity)

    @product.quantity = (@product.quantity - @sale.quantity)
    @product.save

    if @sale.save
      redirect_to products_path
    else
      render :new
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def sale_params
    params.require(:sale).permit(:quantity)
  end
end
