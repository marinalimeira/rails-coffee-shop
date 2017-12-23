class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.sales.delete_all
    @product.delete

    redirect_to products_path
  end

  private

  def product_params
     params.require(:product).permit(:weight, :roast, :ground, :price, :quantity)
  end
end
